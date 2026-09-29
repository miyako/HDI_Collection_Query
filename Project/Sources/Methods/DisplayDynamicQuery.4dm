//%attributes = {"invisible":true}
#DECLARE($query : Text)->$0 : Text
var $req : Text

// Creation of the request and replacement of "<" by "&lt;" for the display in graphical object
$req:=Replace string:C233($query; "<"; "&lt;")

$0:=Replace string:C233(_TabLineCode{8}; "#query"; $req)