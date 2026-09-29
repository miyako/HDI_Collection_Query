//%attributes = {"invisible":true}

$entSel:=ds:C1482.Employee.query("employer.name=Tan@")

$department:=1000
$i:=1
For each ($emp; $entSel)
	
	$emp.department:=$department
	$i:=$i+1
	
	$emp.save()
	
	If ($i>=4)
		$department:=$department+10
		$i:=1
	End if 
	
End for each 


$entSel:=ds:C1482.Employee.query("employer.name=Zou@")

$department:=2000
$i:=1
For each ($emp; $entSel)
	
	$emp.department:=$department
	$i:=$i+1
	
	$emp.save()
	
	If ($i>=4)
		$department:=$department+10
		$i:=1
	End if 
	
End for each 

