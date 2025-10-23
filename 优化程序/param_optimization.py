import argparse
import numpy as np
import time

# 可选导入启发式算法库
try:
	from pymoo.algorithms.soo.nonconvex.ga import GA as PymooGA
	from pymoo.core.problem import Problem as PymooProblem
	from pymoo.optimize import minimize as pymoo_minimize
	_HAS_PYMOO = True
except Exception:
	_HAS_PYMOO = False

try:
	import pyswarms as ps
	_HAS_PYSWARMS = True
except Exception:
	_HAS_PYSWARMS = False

# 导入强化学习算法
from 优化程序.TD3 import TD3
from 优化程序.DDPG import DDPG


def placeholder_objective(x: np.ndarray) -> float:
	"""
	占位评估函数。
	- 输入: x (5维参数向量)
	- 输出: 标量得分（越大越好）
	这里使用一个平滑的多峰目标：
	  f(x) = -sum((x - 2)^2) + 0.5*cos(sum(x))
	"""
	x = np.asarray(x, dtype=np.float64)
	return -np.sum((x - 2.0) ** 2) + 0.5 * np.cos(np.sum(x))


class SearchSpace:
	def __init__(self, lower_bounds, upper_bounds):
		self.lower = np.asarray(lower_bounds, dtype=np.float64)
		self.upper = np.asarray(upper_bounds, dtype=np.float64)
		assert self.lower.shape == self.upper.shape
		self.dim = self.lower.size

	def clip(self, x: np.ndarray) -> np.ndarray:
		return np.clip(x, self.lower, self.upper)

	def denorm_from_unit(self, a: np.ndarray) -> np.ndarray:
		"""将[-1,1]动作映射到实际边界。"""
		a01 = (a + 1.0) * 0.5
		return self.lower + a01 * (self.upper - self.lower)


def optimize_random(objective_fn, space: SearchSpace, iterations=2000, seed=0):
	rng = np.random.RandomState(seed)
	best_x = None
	best_f = -1e18
	for _ in range(iterations):
		x = rng.uniform(space.lower, space.upper)
		f = float(objective_fn(x))
		if f > best_f:
			best_f = f
			best_x = x
	return best_x, best_f


def optimize_ga(objective_fn, space: SearchSpace, pop_size=64, generations=200, seed=0):
	if not _HAS_PYMOO:
		raise RuntimeError("未检测到 pymoo，请先安装：pip install pymoo")

	class _Problem(PymooProblem):
		def __init__(self):
			# 使用向量化评估，避免不同版本对 elementwise 的差异
			super().__init__(n_var=space.dim, n_obj=1, n_constr=0, xl=space.lower, xu=space.upper)

		def _evaluate(self, x, out, *args, **kwargs):
			# 兼容单样本与批量样本
			if np.ndim(x) == 1:
				out["F"] = -float(objective_fn(x))
			else:
				vals = np.apply_along_axis(lambda r: -float(objective_fn(r)), 1, x)
				out["F"] = vals.reshape((-1, 1))

	problem = _Problem()
	algorithm = PymooGA(pop_size=pop_size)
	res = pymoo_minimize(problem, algorithm, ("n_gen", generations), seed=seed, verbose=False)
	best_x = res.X
	best_f = float(objective_fn(best_x))
	return best_x, best_f


def optimize_pso(objective_fn, space: SearchSpace, swarm_size=100, iterations=200, seed=0):
	if not _HAS_PYSWARMS:
		raise RuntimeError("未检测到 pyswarms，请先安装：pip install pyswarms")

	# pyswarms 是最小化接口，这里返回负号
	def _cost(X):
		return np.array([-objective_fn(x) for x in X])

	opts = {
		"c1": 1.49618,
		"c2": 1.49618,
		"w": 0.7298,
	}

	optimizer = ps.single.GlobalBestPSO(n_particles=swarm_size, dimensions=space.dim, options=opts, bounds=(space.lower, space.upper))
	best_cost, best_pos = optimizer.optimize(_cost, iters=iterations, verbose=False)
	best_x = np.asarray(best_pos)
	best_f = float(objective_fn(best_x))
	return best_x, best_f


# ===== 强化学习优化（使用本仓库 TD3/DDPG）=====
class ReplayBuffer:
	def __init__(self, state_dim, action_dim, max_size=int(1e6)):
		self.max_size = max_size
		self.ptr = 0
		self.size = 0
		self.state = np.zeros((max_size, state_dim), dtype=np.float32)
		self.action = np.zeros((max_size, action_dim), dtype=np.float32)
		self.next_state = np.zeros((max_size, state_dim), dtype=np.float32)
		self.reward = np.zeros((max_size, 1), dtype=np.float32)
		self.not_done = np.zeros((max_size, 1), dtype=np.float32)

	def add(self, state, action, next_state, reward, done):
		self.state[self.ptr] = state
		self.action[self.ptr] = action
		self.next_state[self.ptr] = next_state
		self.reward[self.ptr] = reward
		self.not_done[self.ptr] = 1.0 - float(done)
		self.ptr = (self.ptr + 1) % self.max_size
		self.size = min(self.size + 1, self.max_size)

	def sample(self, batch_size):
		ind = np.random.randint(0, self.size, size=batch_size)
		import torch
		device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
		return (
			torch.FloatTensor(self.state[ind]).to(device),
			torch.FloatTensor(self.action[ind]).to(device),
			torch.FloatTensor(self.next_state[ind]).to(device),
			torch.FloatTensor(self.reward[ind]).to(device),
			torch.FloatTensor(self.not_done[ind]).to(device),
		)


def optimize_rl(objective_fn, space: SearchSpace, algo="td3", steps=10000, start_random=2, batch_size=512, noise_end=0.2, lr_gamma=0.9999, seed=0, infer_batch=1024):
	import torch
	rng = np.random.RandomState(seed)
	torch.manual_seed(seed)

	state_dim = 1  # 无状态问题，使用常量占位
	action_dim = space.dim
	max_action = 1.0

	if algo.lower() == "td3":
		policy = TD3(state_dim, action_dim, max_action, lr_gamma=lr_gamma)
	elif algo.lower() == "ddpg":
		policy = DDPG(state_dim, action_dim, max_action, lr_gamma=lr_gamma)
	else:
		raise ValueError("algo 仅支持 td3/ddpg")

	buffer = ReplayBuffer(state_dim, action_dim, max_size=int(2e5))
	state = np.ones(state_dim, dtype=np.float32)
	best_x = None
	best_f = -1e18

	noise_start = 1.0
	gamma = (noise_end / max(noise_start, 1e-8)) ** (1.0 / max(steps - 1, 1))

	for t in range(1, steps + 1):
		curr_noise = max(noise_end, noise_start * (gamma ** (t - 1)))

		# ===== 批量动作推理 =====
		if t < start_random:
			actions = rng.uniform(-1.0, 1.0, size=(infer_batch, action_dim)).astype(np.float32)
		else:
			states_t = torch.FloatTensor(np.repeat(state[None, :], infer_batch, axis=0)).to(torch.device("cuda" if torch.cuda.is_available() else "cpu"))
			actions_t = policy.select_action_batch(states_t, noise_std=curr_noise)
			actions = actions_t.detach().cpu().numpy().astype(np.float32)
			actions = np.clip(actions, -1.0, 1.0)

		# ===== 批量评估 =====
		params_batch = np.asarray([space.denorm_from_unit(a) for a in actions])
		rewards_batch = np.asarray([float(objective_fn(p)) for p in params_batch], dtype=np.float64)

		# 记录全局最优
		idx_best = int(np.argmax(rewards_batch))
		if rewards_batch[idx_best] > best_f:
			best_f = float(rewards_batch[idx_best])
			best_x = params_batch[idx_best].copy()

		# ===== 写入经验回放（将批量样本全部写入） =====
		next_state = state.copy()
		done = True
		for i in range(infer_batch):
			buffer.add(state, actions[i], next_state, rewards_batch[i], done)

		# 训练一步
		if buffer.size > batch_size:
			policy.train(buffer, batch_size=batch_size)

	return best_x, best_f


def main(print):
	parser = argparse.ArgumentParser(description="5参数寻优框架（GA/PSO/TD3/DDPG/Random）")
	parser.add_argument("--algo", type=str, default="ga", choices=["random", "ga", "pso", "td3", "ddpg"], help="选择算法")
	parser.add_argument("--iters", type=int, default=2000, help="迭代/步数（随机/PSO/GA/RL共用或近似")
	parser.add_argument("--pop", type=int, default=64, help="GA群体规模或PSO粒子数")
	parser.add_argument("--seed", type=int, default=0)
	parser.add_argument("--lower", type=float, nargs=5, default=[-5, -5, -5, -5, -5], help="5个下界")
	parser.add_argument("--upper", type=float, nargs=5, default=[5, 5, 5, 5, 5], help="5个上界")
	parser.add_argument("--noise_end", type=float, default=0.05, help="RL噪声终值")
	parser.add_argument("--lr_gamma", type=float, default=0.999, help="RL学习率衰减因子")
	args = parser.parse_args()

	space = SearchSpace(args.lower, args.upper)
	objective_fn = placeholder_objective

	start = time.time()
	if args.algo == "random":
		best_x, best_f = optimize_random(objective_fn, space, iterations=args.iters, seed=args.seed)
	elif args.algo == "ga":
		best_x, best_f = optimize_ga(objective_fn, space, pop_size=args.pop, generations=max(1, args.iters // 10), seed=args.seed)
	elif args.algo == "pso":
		best_x, best_f = optimize_pso(objective_fn, space, swarm_size=args.pop, iterations=args.iters, seed=args.seed)
	elif args.algo in ("td3", "ddpg"):
		best_x, best_f = optimize_rl(
			objective_fn,
			space,
			algo=args.algo,
			steps=args.iters,
			start_random=max(100, args.pop),
			batch_size=min(512, max(64, args.pop)),
			noise_end=args.noise_end,
			lr_gamma=args.lr_gamma,
			seed=args.seed,
			infer_batch=args.pop,
		)
	else:
		raise ValueError("未知算法")
	elapsed = time.time() - start

	print("\n===== 寻优完成 =====\n")
	print(f"算法: {args.algo}\n")
	print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
	print(f"最优目标值: {best_f:.6f}\n")
	print(f"耗时: {elapsed:.2f}s\n")

def random(print,iters=2000, seed=0,lower=(-5, -5, -5, -5, -5), upper=(5, 5, 5, 5, 5)):
    space = SearchSpace(lower, upper)
    start = time.time()
    objective_fn = placeholder_objective
    best_x, best_f = optimize_random(objective_fn, space, iterations=iters, seed=seed)
    elapsed = time.time() - start
    print("\n===== 寻优完成 =====\n")
    print(f"算法: random\n")
    print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
    print(f"最优目标值: {best_f:.6f}\n")
    print(f"耗时: {elapsed:.2f}s\n")
def GA(print,iters=2000, seed=0,pop_size=64, lower=(-5, -5, -5, -5, -5), upper=(5, 5, 5, 5, 5)):
    space = SearchSpace(lower, upper)
    start = time.time()
    objective_fn = placeholder_objective
    best_x, best_f = optimize_ga(objective_fn, space, pop_size=pop_size, generations=max(1, iters // 10), seed=seed)
    elapsed = time.time() - start
    print("\n===== 寻优完成 =====\n")
    print(f"算法: GA\n")
    print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
    print(f"最优目标值: {best_f:.6f}\n")
    print(f"耗时: {elapsed:.2f}s\n")
def pso(print,iters=2000, seed=0,swarm_size=100, lower=(-5, -5, -5, -5, -5), upper=(5, 5, 5, 5, 5)):
    space = SearchSpace(lower, upper)
    start = time.time()
    objective_fn = placeholder_objective
    best_x, best_f = optimize_pso(objective_fn, space, swarm_size=swarm_size, iterations=iters, seed=seed)
    elapsed = time.time() - start
    print("\n===== 寻优完成 =====\n")
    print(f"算法: pso\n")
    print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
    print(f"最优目标值: {best_f:.6f}\n")
    print(f"耗时: {elapsed:.2f}s\n")
def td3(print,iters=2000, seed=0,start_random=100, batch_size=512, noise_end=0.05, lr_gamma=0.999, lower=(-5, -5, -5, -5, -5), upper=(5, 5, 5, 5, 5)):
    space = SearchSpace(lower, upper)
    algo = "td3"
    start = time.time()
    objective_fn = placeholder_objective
    best_x, best_f = optimize_rl(
        objective_fn,
        space,
        algo=algo,
        steps=iters,
        start_random=max(100, start_random),
        batch_size=min(512, max(64, batch_size)),
        noise_end=noise_end,
        lr_gamma=lr_gamma,
        seed=seed,
        infer_batch=64,
    )
    elapsed = time.time() - start
    print("\n===== 寻优完成 =====\n")
    print(f"算法: {algo}\n")
    print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
    print(f"最优目标值: {best_f:.6f}\n")
    print(f"耗时: {elapsed:.2f}s\n")
def ddpg(print,iters=2000, seed=0,start_random=100, batch_size=512, noise_end=0.05, lr_gamma=0.999, lower=(-5, -5, -5, -5, -5), upper=(5, 5, 5, 5, 5)):
    space = SearchSpace(lower, upper)
    algo = "ddpg"
    start = time.time()
    objective_fn = placeholder_objective
    best_x, best_f = optimize_rl(
        objective_fn,
        space,
        algo=algo,
        steps=iters,
        start_random=max(100, start_random),
        batch_size=min(512, max(64, batch_size)),
        noise_end=noise_end,
        lr_gamma=lr_gamma,
        seed=seed,
        infer_batch=64,
    )
    elapsed = time.time() - start
    print("\n===== 寻优完成 =====\n")
    print(f"算法: {algo}\n")
    print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}\n")
    print(f"最优目标值: {best_f:.6f}\n")
    print(f"耗时: {elapsed:.2f}s\n")
if __name__ == "__main__":
	ddpg()


