//%attributes = {"invisible":true}

$department:=1010

$es:=ds:C1482.Employee.all().orderBy("employer.name asc")

$companyName:=$es[0].employer.name

$i:=1
For each ($emp; $es)
	
	If (($i>=4) & ($emp.employer.name=$companyName))
		$i:=1
		$department:=$department+10
	Else 
		
		If ($emp.employer.name=$companyName)
		Else 
			$department:=$department+100
			$companyName:=$emp.employer.name
		End if 
		
		$emp.department:=$department
		$emp.save()
		$i:=$i+1
		
	End if 
	
	
	
End for each 


