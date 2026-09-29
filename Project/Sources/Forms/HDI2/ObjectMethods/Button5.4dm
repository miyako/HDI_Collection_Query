
var $params : Object

$params:=New object:C1471
$params.parameters:=New collection:C1472(vSalary2; vSalary3)

EmployeeToArrays(AllEmployees.query("salary >= :1 and salary <= :2"; vSalary2; vSalary3))




