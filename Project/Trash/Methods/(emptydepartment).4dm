//%attributes = {"invisible":true}
$es:=ds:C1482.Employee.all().orderBy("employer.name asc")

For each ($emp; $es)
	$emp.department:=0
	$emp.save()
End for each 