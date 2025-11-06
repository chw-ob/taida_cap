$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/02/2025 15:51:36')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:04:08')
			I(1, 'ComEngine Memory', '97.5 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions(Memory=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'E:\\\\INApps\\\\AnsysEM\\\\v242\\\\Win64\\\\MAXWELLCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Manual')
				I(1, 'Distribution Types', 'Variations, Frequencies')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2021')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(4, 1, \'Name\', \'chw\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Tasks\', 1, false, 2, \'Cores\', 4, false)', false, true)
		$end 'ProfileGroup'
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 97100, true)', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 15:51:38')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 33784, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 950, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 35360, 'I(2, 2, \'Tetrahedra\', 950, false, 2, \'Cores\', 1, false)', true, true)
			ProfileItem('Manual Refine', 3, 0, 3, 0, 60844, 'I(3, 2, \'Tetrahedra\', 19487, false, 2, \'Cores\', 1, false, 0, \'Length1\')', true, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 15:51:43')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:04:01')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 148, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 185, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 2, 0, 2, 0, 303744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 0s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 102322, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 447220, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 456336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97437, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 458264, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 100208, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 460256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98160, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 461692, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 463016, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 462936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 466788, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 8, 0, 8, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 466604, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9e-07s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99094, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 465800, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97721, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 469312, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 470548, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 471792, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 469644, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 12, 0, 22, 0, 98577, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 472008, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 474132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 98577, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 475560, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 473780, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 477336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 12, 0, 24, 0, 98577, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 476988, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99079, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 482612, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 481972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 482320, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480080, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 480888, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 100376, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 480992, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 482508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 100208, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 482844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 100208, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490968, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 18, 0, 34, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 487716, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490348, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 104415, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491224, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 492064, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 18, 0, 18, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 492284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 3.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 20, 0, 60, 0, 98972, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490780, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 100376, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99505, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, 'Terminated abnormally')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Error closing file: %1.\')', false, true)
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/02/2025 15:55:44\', 1, \'Status\', \'Error\')', 2)
	$end 'ProfileGroup'
$end 'Profile'
