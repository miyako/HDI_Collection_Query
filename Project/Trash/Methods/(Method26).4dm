//%attributes = {"invisible":true}
C_OBJECT:C1216($obj)
C_COLLECTION:C1488($col)
$obj:=Process activity:C1495
$col:=$obj.processes

$result:=$col.query("type=:1"; Main process:K36:10)

//ARRAY OBJECT($result;0)
//For ($i;0;$col.length-1)
//If ($col[$i].type=Main process)
//APPEND TO ARRAY($result;$col[$i])
//End if 
//End for