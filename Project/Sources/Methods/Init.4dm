//%attributes = {"invisible":true}
var $employeesCsv : Text
var $rows : Collection

$employeesCsv:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"Employees.csv"; "UTF-8"; Document with CR:K24:21)

$rows:=Split string:C1554($employeesCsv; "\r")

AllEmployees:=$rows.map("EmployeeObj")

