//%attributes = {"invisible":true}
// Fill the database with data
// ---------------------------   
// This has already run - DO NOT RUN AGAIN
// --------------------------------------- 

// The Employee table should contain between 9 and 84 employees
//

FakeData_ArraysInit

C_COLLECTION:C1488($createdComps)
C_LONGINT:C283($nbLevels; $nb)
//C_OBJECT($ok)
C_OBJECT:C1216(vNull)
C_OBJECT:C1216($templateCompany; $company)
C_COLLECTION:C1488($empCreatedList; $empLastCreatedList)

// Test if the DB is already filled --> if not, fill it

ds:C1482.Employee.all().drop()
ds:C1482.Company.all().drop()

If ((ds:C1482.Company.all().length)=0)
	
	$templateCompany:=New object:C1471
	$templateCompany.name:="company"
	
	
	If (Count parameters:C259>0)
		$nbCompToCreate:=$1
	Else 
		$nbCompToCreate:=5  // We create 3 companies
	End if 
	
	$createdComps:=New collection:C1472
	
	For ($i; 1; $nbCompToCreate)
		
		$company:=ds:C1482.Company.new()
		
		FakeData_FillObjectTemplate($templateCompany; $company)
		
		
		$ok:=$company.save(); 
		//$createdComps:=$createdComps.add($company)
		$createdComps:=$createdComps.push($company)
	End for 
	
	For each (vComp; $createdComps)
		$nbLevels:=2  // We manage 2 hierarchy levels
		$nb:=3  // Each manager has 3 directReports 
		
		$empCreatedList:=New collection:C1472
		$empLastCreatedList:=New collection:C1472
		
		$empCreated:=createRandomEmpFINAL(vComp; vNull)
		$empCreatedList.push($empCreated)
		
		For ($i; 1; $nbLevels)
			For each (vEmp; $empCreatedList)
				For ($j; 1; $nb)
					$empCreated:=createRandomEmpFINAL(vComp; vEmp)
					$empLastCreatedList.push($empCreated)
				End for 
			End for each 
			$empCreatedList:=New collection:C1472
			$empCreatedList:=$empLastCreatedList
		End for 
		
	End for each 
	
	ALERT:C41("The database has been successfully filled")
	
Else   // The DB is already filled - Do nothing
	ALERT:C41("The database was already filled, nothing has been loaded")
End if 

FakeData_ArraysDeinit