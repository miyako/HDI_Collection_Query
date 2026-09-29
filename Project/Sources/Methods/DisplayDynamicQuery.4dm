//%attributes = {"invisible":true}
#DECLARE($query : Text)->$result : Text
var $req : Text

// Creation of the request and replacement of "<" by "&lt;" for the display in graphical object
$req:=Replace string:C233($query; "<"; "&lt;")

$result:=Replace string:C233(_TabLineCode{8}; "#query"; $req)