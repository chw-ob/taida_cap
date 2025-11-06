$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/05/2025 10:05:49')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:12:10')
			I(1, 'ComEngine Memory', '98.7 M')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 97244, true)', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 10:05:50')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 33712, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 950, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 35360, 'I(2, 2, \'Tetrahedra\', 950, false, 2, \'Cores\', 1, false)', true, true)
			ProfileItem('Manual Refine', 3, 0, 3, 0, 60976, 'I(3, 2, \'Tetrahedra\', 19487, false, 2, \'Cores\', 1, false, 0, \'Length1\')', true, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 10:05:54')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:12:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 148, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 185, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 2, 0, 2, 0, 303696, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 445832, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 456972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96223, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 458352, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 459360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 460644, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 460452, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 460664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 464532, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 466980, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 466392, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 469132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 468752, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 468496, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 469420, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 473896, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 471772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 474812, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 474268, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 473820, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 475808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480520, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481216, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480056, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480056, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 478932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481196, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 479304, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 479568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 481452, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490788, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489184, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490496, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 488916, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 490216, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 489648, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94787, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 489568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490056, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489224, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489728, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489504, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 489280, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 489640, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 495384, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504552, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95126, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 504060, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 502516, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95065, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505324, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505060, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505208, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 504732, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 502708, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 504752, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 503920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96201, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504324, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 503508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504040, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505220, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 503288, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504308, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505304, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 502668, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504328, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 515504, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97883, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 523860, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 524832, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 525868, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96072, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 525088, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 525364, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 527100, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 525408, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96223, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 525292, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525884, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526032, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526496, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 525444, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 525600, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 522772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 525992, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 528052, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526312, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 523456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96429, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 526192, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 523908, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 526520, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 524368, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 524280, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 523412, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 524844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 526712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 524800, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 548188, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 555012, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 555260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 555072, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94787, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 555140, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 555656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 554880, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.01e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 555460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.02e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 555660, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.03e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557688, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.04e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97018, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556440, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.05e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556008, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.06e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556380, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.07e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556416, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.08e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.09e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 555016, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 555512, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.11e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556668, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.12e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558312, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.13e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558812, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.14e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558184, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.15e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99746, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558308, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.16e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.17e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 100498, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.18e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559208, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.19e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559436, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.2e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.21e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97018, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.22e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558732, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.23e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 559276, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.24e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 558580, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.25e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 558880, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.26e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.27e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99777, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557464, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.28e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.29e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 558184, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.3e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558640, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.31e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 101810, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 559312, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.32e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558476, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.33e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 557916, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.34e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558836, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.35e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559092, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.36e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558960, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.37e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 558476, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.38e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558124, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.39e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558084, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.4e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559372, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.41e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 595464, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.42e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 602672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.43e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604352, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.44e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.45e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.46e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603140, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.47e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604332, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.48e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 601944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.49e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 602024, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.5e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.51e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604364, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.52e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603812, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.53e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 605008, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.54e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95065, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.55e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604576, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.56e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604820, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.57e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 603376, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.58e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605140, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.59e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604172, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.6e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606036, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.61e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605152, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.62e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 605336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.63e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93238, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605488, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.64e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95065, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605524, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.65e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 100213, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 606264, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.66e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 100213, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.67e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.68e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101312, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.69e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.7e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603888, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.71e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99085, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603048, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.72e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.73e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.74e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603740, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.75e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 603928, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.76e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 100498, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 603660, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.77e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606652, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.78e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602736, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.79e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 602012, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.8e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603820, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.81e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 602516, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.82e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606420, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.83e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96223, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604216, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.84e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 99085, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 602608, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.85e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603912, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.86e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606296, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.87e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 606624, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.88e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.89e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.9e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605752, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.91e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603108, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.92e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605612, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.93e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 606892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.94e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605984, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.95e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 2, 0, 606944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.96e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 606944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.97e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607212, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.98e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607740, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.99e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606300, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 607904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 3, \'Completed\', 2e-05, \'%.5gs\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/05/2025 10:18:00\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/05/2025 10:56:47')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(0, 'Terminated abnormally')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:02\', 2, \'Memory\', 96660, true)', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 10:56:51')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, 'Terminated abnormally')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 148, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 185, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 2, 0, 2, 0, 303656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96061, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 445068, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 16, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 456108, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 456324, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 462228, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 463112, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 32, 0, 94, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 463256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 469360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 467972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 10, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 468376, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 470892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 9, 0, 3, 0, 470572, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 471124, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 14, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 470720, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93238, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 472324, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 473688, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 10, 0, 3, 0, 475820, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 42, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 475532, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97904, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 474944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 475152, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 12, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 482356, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 100390, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 481596, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/05/2025 11:16:22')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:13:31')
			I(1, 'ComEngine Memory', '96.8 M')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 95052, true)', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 11:16:24')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:13:27')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 2.4e-06, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 2, 0, 2, 0, 301468, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 442796, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 451520, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 14, 0, 2, 0, 95142, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 455036, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 457472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 458108, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 458748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95379, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 462752, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 8, 0, 18, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 466972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 465096, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98582, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 467544, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 469156, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 467540, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96397, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 469272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 469120, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94787, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 473260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 472344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 471748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 472628, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 475024, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 474228, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 479264, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 479964, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 478392, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480104, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480116, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 479604, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 479744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 479168, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 480012, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97440, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 490284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 489084, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 489336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 489208, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 489236, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 487156, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490192, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 489364, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 487452, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97883, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93238, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 487360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 104224, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 494244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 500352, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504100, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504708, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504528, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505000, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 502444, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94984, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504724, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 503920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 101810, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 503916, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 504620, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 502672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505632, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96837, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 502932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504320, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 101312, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504464, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 504708, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 503888, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504032, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 515508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 524344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 524808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 523144, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 524268, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525552, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 521700, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 524892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526448, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525008, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95142, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525940, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 525596, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526020, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.01e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 96223, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526752, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.02e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527376, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.03e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526392, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.04e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 526212, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.05e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526296, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.06e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98754, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 525756, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.07e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.08e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 526196, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.09e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 94765, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 525976, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526484, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.11e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 525772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.12e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525928, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.13e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 95145, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526436, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.14e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526452, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.15e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 524264, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.16e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526828, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.17e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525180, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.18e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 547972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.19e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99085, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 555360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.2e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 556520, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.21e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556160, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.22e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.23e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557988, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.24e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557648, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.25e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557380, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.26e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101810, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 557296, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.27e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556412, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.28e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557584, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.29e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557704, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.3e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 558216, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.31e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96679, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557948, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.32e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.33e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.34e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.35e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 556808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.36e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.37e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557052, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.38e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 556876, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.39e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557112, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.4e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 555832, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.41e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556028, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.42e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 556164, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.43e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96201, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.44e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 557156, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.45e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 94534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.46e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97241, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557232, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.47e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557400, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.48e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 557180, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.49e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557008, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.5e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94726, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557144, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.51e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556984, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.52e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 556400, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.53e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557524, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.54e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557088, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.55e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 556792, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.56e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 556772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.57e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557024, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.58e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 556628, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.59e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558136, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.6e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557560, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.61e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 94534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 557776, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.62e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 557948, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.63e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557436, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.64e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557388, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.65e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 96223, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 594284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.66e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95065, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 603332, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.67e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604136, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.68e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 603616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.69e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603684, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.7e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604064, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.71e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 603060, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.72e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603016, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.73e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602440, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.74e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 602972, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.75e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 602756, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.76e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94852, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 601692, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.77e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 602992, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.78e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.79e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 602760, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.8e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 603508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.81e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 602072, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.82e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 601700, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.83e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 601560, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.84e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 601648, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.85e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 602448, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.86e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 602104, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.87e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 602612, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.88e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 602592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.89e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 94342, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 602804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.9e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 603308, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.91e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602160, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.92e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603388, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.93e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604276, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.94e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 603820, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.95e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602896, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.96e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 602720, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.97e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 4, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 603124, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.98e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95379, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 602884, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.99e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603536, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 2e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 604192, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 3, \'Completed\', 2e-05, \'%.5gs\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/05/2025 11:29:53\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/05/2025 11:41:00')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(0, 'Terminated abnormally')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:02\', 2, \'Memory\', 96852, true)', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 11:41:05')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, 'Terminated abnormally')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 152, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 185, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 3, 0, 2, 0, 303592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 444588, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 16, 0, 4, 0, 95379, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 459316, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 459472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 459956, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 10, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 461456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 34, 0, 98, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 463372, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 464664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95956, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 467168, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 8, 0, 2, 0, 101525, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 466808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 469224, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 468480, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 471980, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 10, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 471456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 474740, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 474616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 8, 0, 3, 0, 474316, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 42, 0, 42, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 475804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 474240, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 475856, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 14, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 477668, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 479332, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 478664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96483, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 479536, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 14, 0, 4, 0, 95394, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 479208, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93274, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 12, 0, 3, 0, 480004, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 477664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 20, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480584, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489468, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97241, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 489796, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 11, 0, 3, 0, 488576, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 58, 0, 58, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 488344, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 490092, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93917, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 22, 0, 4, 0, 101312, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 490568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 491196, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 488656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 22, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 489936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 490516, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 16, 0, 3, 0, 496432, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 58, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 504764, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 503288, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 24, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 502616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 72, 0, 212, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 501932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 503608, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 4.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 503748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 22, 0, 4, 0, 96009, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504980, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 504768, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 503580, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 15, 0, 2, 0, 504672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 38, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 504396, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505604, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 507404, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 30, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 506316, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 86, 0, 250, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 507600, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 5.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 504440, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 506436, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 30, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 504836, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505464, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 518876, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98582, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 526376, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 34, 0, 2, 0, 93646, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 527236, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 526500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97883, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526880, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 19, 0, 3, 0, 528148, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 6.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 94, 0, 92, 0, 94534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527812, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525548, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 525312, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 36, 0, 4, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526644, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 526044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 526240, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526556, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 38, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 527044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94852, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 527480, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 7.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 20, 0, 3, 0, 527004, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 44, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527912, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 527432, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527596, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 114, 0, 218, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526812, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95551, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527348, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93274, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526888, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 42, 0, 4, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 526872, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 8.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 528800, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 527804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.1e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 44, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 528340, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.2e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 528828, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.3e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 527680, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.4e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 26, 0, 3, 0, 549880, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.5e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 54, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557296, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.6e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97599, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 558272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.7e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558180, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.8e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97883, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 27, 0, 3, 0, 557124, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 9.9e-06s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 118, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 557244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99060, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557188, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.01e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557636, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.02e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 46, 0, 2, 0, 99080, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.03e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 128, 0, 372, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557240, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.04e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558004, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.05e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94984, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 558780, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.06e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 50, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557140, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.07e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.08e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559112, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.09e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 557452, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.1e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 54, 0, 4, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 557472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.11e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 560284, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.12e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93872, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559012, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.13e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 30, 0, 2, 0, 558272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.14e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 126, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.15e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94586, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559248, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.16e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95359, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559148, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.17e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 56, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558392, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.18e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.19e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97904, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 560220, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.2e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 560440, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.21e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 60, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559704, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.22e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 558892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.23e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.24e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 30, 0, 2, 0, 560448, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.25e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 66, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 561080, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.26e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559732, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.27e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.28e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 62, 0, 2, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560196, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.29e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 162, 0, 476, 0, 95664, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.3e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97069, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 559144, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.31e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 559804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.32e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 66, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 559260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.33e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 558964, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.34e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 37, 0, 3, 0, 559968, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.35e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 559240, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.36e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 76, 0, 2, 0, 94548, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559552, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.37e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96124, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.38e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 560044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.39e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 37, 0, 3, 0, 560512, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.4e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 178, 0, 346, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559040, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.41e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94345, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 596096, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.42e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 101312, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604492, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.43e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 64, 0, 4, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603660, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.44e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604772, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.45e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 604364, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.46e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 603968, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.47e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 70, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604328, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.48e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604384, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.49e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.5e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95491, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 38, 0, 3, 0, 604500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.51e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 170, 0, 168, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 604336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.52e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99159, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604832, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.53e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97904, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 604076, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.54e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 74, 0, 4, 0, 101312, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605032, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.55e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97354, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604488, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.56e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 605588, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.57e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 2, 0, 605300, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.58e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 70, 0, 2, 0, 97897, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.59e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94852, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606640, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.6e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101597, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606000, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.61e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94933, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 605712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.62e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 74, 0, 4, 0, 106377, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 2, 0, 605896, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.63e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93793, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 605456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.64e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96949, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 605904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.65e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 43, 0, 3, 0, 604544, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.66e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 88, 0, 4, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.67e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605408, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.68e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 604472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.69e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96005, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 43, 0, 3, 0, 604788, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.7e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 190, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605696, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.71e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605860, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.72e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97547, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605560, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.73e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 84, 0, 2, 0, 98340, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.74e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 216, 0, 638, 0, 95154, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605660, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.75e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605236, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.76e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94248, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605280, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.77e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 84, 0, 2, 0, 95394, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.78e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 104534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606660, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.79e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96370, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 45, 0, 3, 0, 606360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.8e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95098, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.81e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 94, 0, 2, 0, 92992, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606084, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.82e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97869, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 605544, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.83e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96099, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606908, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/05/2025 14:06:58')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 94748, true)', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/05/2025 14:07:01')
			$end 'StartInfo'
			$begin 'TotalInfo'
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 1.84e-05, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 1, 0, 2, 0, 301256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.84e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96436, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 444088, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.85e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 95886, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 455556, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.86e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 94, 0, 2, 0, 97004, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 456164, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
			$begin 'ProfileGroup'
				MajorVer=2024
				MinorVer=2
				Name='Time - 1.87e-05s'
				$begin 'StartInfo'
				$end 'StartInfo'
				$begin 'TotalInfo'
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
	$end 'ProfileGroup'
$end 'Profile'
