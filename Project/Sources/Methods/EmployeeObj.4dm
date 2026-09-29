//%attributes = {}
C_OBJECT:C1216($1)
C_COLLECTION:C1488($tmp)

$tmp:=Split string:C1554($1.value; ";")

$1.result:=New object:C1471("ID"; Num:C11($tmp[0]); "firstName"; $tmp[1]; \
"lastName"; $tmp[2]; \
"salary"; Num:C11($tmp[3]); \
"department"; $tmp[4]; \
"managerID"; Num:C11($tmp[5]); \
"employer"; New object:C1471("ID"; Num:C11($tmp[6]); "name"; $tmp[7]); \
"email"; Replace string:C233($tmp[1]+"."+$tmp[2]+"@"+$tmp[7]+".com"; " "; ""))

