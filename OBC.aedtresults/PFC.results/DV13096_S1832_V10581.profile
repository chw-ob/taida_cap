$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/02/2025 11:26:48')
			I(1, 'Host', 'CHW')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2024.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:14:02')
			I(1, 'ComEngine Memory', '100 M')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 98900, true)', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 11:26:49')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:07')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 34712, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 950, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 36480, 'I(2, 2, \'Tetrahedra\', 950, false, 2, \'Cores\', 1, false)', true, true)
			ProfileItem('Manual Refine', 4, 0, 3, 0, 60912, 'I(3, 2, \'Tetrahedra\', 19578, false, 2, \'Cores\', 1, false, 0, \'Length1\')', true, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 11:26:57')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:13:52')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 148, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 193, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 2, 0, 2, 0, 305652, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96615, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 449328, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 457292, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91247, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 460632, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 88515, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 462152, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90813, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 4, 0, 461744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 462072, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92807, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 464616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94292, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 466540, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 2, 0, 466444, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 467032, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 470204, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92193, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 470504, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 472688, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91030, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 473160, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 477620, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 477092, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 476056, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 476288, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90964, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 477412, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 93975, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 4, 0, 477776, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 483976, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 482860, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 483680, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 483936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 483308, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480112, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93091, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481708, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 481604, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 483520, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 91217, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 492320, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 492040, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91598, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490896, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491404, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 493712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94132, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491492, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93686, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 490320, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 491436, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 492172, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96205, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 492028, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94165, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 491908, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 498124, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94292, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 506340, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 505844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 508196, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 507412, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 95326, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 507920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 506280, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93726, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 507456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 507568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 509144, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505404, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93488, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 505952, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 507132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 506852, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 506328, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96205, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 506624, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 507032, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 90964, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 505808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 506576, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92997, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 507188, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93262, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 508612, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 518768, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93876, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526504, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527132, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90071, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527868, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 528500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527172, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93119, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 526408, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526572, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527916, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 529096, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 529000, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94292, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 526424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 528356, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527576, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93726, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 528260, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 90327, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 527300, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 527904, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 529596, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 530044, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 529536, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 529096, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 529020, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 530460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91239, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 527920, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 526272, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94292, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 529332, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96205, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 550668, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93876, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558148, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559568, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 559976, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559980, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560116, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94292, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560116, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 560148, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 91239, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560168, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559292, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559496, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 89655, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 558844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96615, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 559184, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 558952, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 559304, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559680, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560304, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560440, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 90179, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 560244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560460, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560504, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 558456, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90327, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560192, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560740, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 90964, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560364, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90327, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 560932, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560616, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560384, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 560776, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 90327, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 560768, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96205, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91692, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 559844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 97507, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 561748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 562676, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 93876, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561020, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 561252, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91598, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 560884, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 561924, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561664, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 561728, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561584, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561644, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92586, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 561324, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 91452, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 561712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 561592, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 94548, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 562064, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 597428, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 607392, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 91602, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 605500, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606596, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 606380, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97483, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606068, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606724, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606400, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93488, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607000, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607484, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 605808, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606256, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 607184, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606624, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 93072, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606492, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 606244, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606560, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606780, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606508, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92997, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606432, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94132, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606472, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93876, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606748, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 606076, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 93380, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606360, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607224, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93119, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 607164, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 607416, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 607620, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607632, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606804, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 606548, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 606744, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 606844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90964, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 5, 0, 3, 0, 606604, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 93488, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 607084, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92680, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 607232, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 609936, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610396, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96205, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610656, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 610872, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 91559, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 608764, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 609960, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91030, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 610128, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 609884, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92893, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610068, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 610712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91849, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610784, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610788, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92860, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610848, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96045, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 608040, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 92212, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 609988, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93488, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 609892, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 94259, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 610144, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 90964, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 610336, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 92265, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 610532, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 91030, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 611064, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 90534, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 611116, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 92400, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 611112, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 93726, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 611120, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 91707, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26479, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 611212, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19578, false)', true, true)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 3, \'Completed\', 2e-05, \'%.5gs\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/02/2025 11:40:50\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
