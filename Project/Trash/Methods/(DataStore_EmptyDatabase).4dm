//%attributes = {"invisible":true}

//This method empties the database
//--------------------------------  

ds:C1482.Employee.all().drop()
ds:C1482.Company.all().drop()

ALERT:C41("The database is now empty")