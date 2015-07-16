****READ ME****

Hi, You will need to perfom a couple of steps to configure correctly the Book Library Application,

1. Configure connection String.

* On folder \BookLibrary\BookLibrary.Web open the Web.Config file
* Find the value "connectionStrings" on the xml file
* Update parameter data source on the connection string with name BookModelContainer

2. Execute DataBase Scripts

* On folder \BookLibrary\Data you will find three (3) scripts files
	1. Schema.sql -> This file contains only the database creation and related tables, no data 
	2. Data.sql -> This file contains only the dummy data used on development
	3. SchemaAndData.sql -> This file contains database creation structe and dummy data.

3. Execute WebSite

* On Visual Studio open the BookLibrary solution and press F5. The application will de deloyed and ready
for your testing.

I Hope you enjoy it =D

Any comment please contact me on nelson.barrer@gmail.com
 

