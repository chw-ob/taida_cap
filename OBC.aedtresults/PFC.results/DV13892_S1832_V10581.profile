$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2024
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/02/2025 12:03:48')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 97000, true)', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 12:03:48')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:05')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 33708, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 950, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 35348, 'I(2, 2, \'Tetrahedra\', 950, false, 2, \'Cores\', 1, false)', true, true)
			ProfileItem('Manual Refine', 4, 0, 3, 0, 60904, 'I(3, 2, \'Tetrahedra\', 19487, false, 2, \'Cores\', 1, false, 0, \'Length1\')', true, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2024
			MinorVer=2
			Name='Transient Solution'
			$begin 'StartInfo'
				I(1, 'Time', '11/02/2025 12:03:54')
			$end 'StartInfo'
			$begin 'TotalInfo'
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Matrix Solve', 0, 0, 0, 0, 148, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 185, false, 1, \'Disk\', \'0KB\', 0, \'Hp Assignment\')', true, true)
			ProfileItem('Solver Progress', 0, 0, 0, 0, 0, 'I(2, 3, \'From\', 0, \'%.5gs\', 3, \'To\', 2e-05, \'%.5gs\')', false, true)
			ProfileItem('Solve', 3, 0, 2, 0, 303624, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97675, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 446712, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 98160, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 455944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97437, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 4, 0, 458020, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97437, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 460992, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 98371, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 460120, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 464424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 4, 0, 3, 0, 465696, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 97437, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 467700, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 100208, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 467380, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 466844, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96990, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 469424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 470672, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 100013, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 471476, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 469836, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 100208, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 476768, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 475952, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 97438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 475368, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 97438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 477080, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 99505, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 475996, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 4, 0, 99438, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 476944, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 1, 0, 3, 0, 482128, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 483580, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Solve', 3, 0, 4, 0, 484136, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 102322, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 480576, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99505, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 482376, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 4, 0, 101538, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 480424, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 481556, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 2, 0, 2, 0, 96939, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 3, 0, 3, 0, 479980, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Solve', 4, 0, 4, 0, 482624, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
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
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 99505, 'I(5, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 26354, false, 1, \'Disk\', \'0KB\', 2, \'Iteration\', 1, false)', true, true)
				ProfileItem('Solve', 2, 0, 3, 0, 492872, 'I(2, 2, \'Cores\', 4, false, 2, \'Tetrahedra\', 19487, false)', true, true)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
	$end 'ProfileGroup'
$end 'Profile'
