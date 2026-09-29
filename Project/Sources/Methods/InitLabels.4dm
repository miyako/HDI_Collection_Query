//%attributes = {"invisible":true}
var $n; $i : Integer

READ ONLY:C145([INFO:1])
//ALL RECORDS([INFO])
QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "<"; 6)
ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)

SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)

QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "="; 9)
mainDescription:=[INFO:1]Description:2

QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; ">="; 10)
ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)

SELECTION TO ARRAY:C260([INFO:1]Description:2; _TabLineCode)



If (Is Windows)
	$n:=Size of array:C274(_TabLineCode)
	For ($i; 1; $n)
		ST SET ATTRIBUTES:C1093(_TabLineCode{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12; Attribute italic style:K65:2; 1)
	End for 
End if 