//%attributes = {"invisible":true}

C_OBJECT:C1216($1; $2)

C_OBJECT:C1216($comp; $manager; $emp)
C_OBJECT:C1216($ok)
C_OBJECT:C1216($templateEmployee)

$comp:=$1
$manager:=$2

$templateEmployee:=New object:C1471

$templateEmployee.firstName:="firstname"
$templateEmployee.lastName:="lastname"


$emp:=ds:C1482.Employee.new()

FakeData_ArraysInit

FakeData_FillObjectTemplate($templateEmployee; $emp)

$emp.salary:=rangedRandom(220; 800)*100
$emp.employer:=$comp
$emp.manager:=$manager
$ok:=$emp.save()

FakeData_ArraysDeinit

$0:=$emp