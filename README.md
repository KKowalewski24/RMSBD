# RMSBD

## Task1
* In order to create schema run `dotnet run`
* Then go to Database in Rider -> tables -> SQL scripts -> generate DDL
* Then go to Database in Rider -> DB_NAME -> Export to file -> go to generated files and copy to chosen file 
* Create file with command to create DB and run this
* Open file with Schema and run - remember to set proper database - select on left top corner
* Open file with Insert data and run - remember to set proper database - select on left top corner

#### Code Style Rules and Formatter - For C# Schema and Data Generator
Formatter for Schema Generators: [dotnet-format](https://github.com/dotnet/format)
```
dotnet tool install -g dotnet-format
```
In order to format run
```
dotnet format -w -a info -s info
``` 

## Task2

## Task3
In case of using DataGrip or embedded DataGrip in IntelliJ remember 
to set in combobox public schema and ALSO xml-mapping schema.
Table that are used for mapping xml to sql are stored xml-mapping schema - it is 
required for exporting xml because it would be weird to export whole public schema

All of the paths to xml files should be adapted to local machine, `C:\Coding` should be 
change to path where RMSBD repo is stored
```
'C:\Coding\RMSBD\Task3\car-showroom-minified.xml'
```

In all places the minified xml file is used - it is required because Postgres 
cannot read xml file with blank line
 
## Task4
For Geography data type PostGis is used. In order to install in non-docker 
Postgres go to stack builder, select Spatial extensions and install.

After creating database choose proper schema and run 
```
CREATE EXTENSION postgis;
``` 
When you drop the DB you have to run this command again
