//%attributes = {}
C_TEXT:C284($req; $1; $0)

// Creation of the request and replacement of "<" by "&lt;" for the display in graphical object
$req:=Replace string:C233($1; "<"; "&lt;")

$0:=Replace string:C233(_TabLineCode{8}; "#query"; $req)