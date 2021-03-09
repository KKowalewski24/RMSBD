# RMSBD

## Task1
* In order to create schema run `dotnet run`
* Then go to Database in Rider -> tables -> SQL scripts -> generate DDL
* Then go to Database in Rider -> DB_NAME -> Export to file -> go to generated files and copy to chosen file 
* Create file with command to create DB and run this
* Open file with Schema and run - remember to set proper database - select on left top corner
* Open file with Insert data and run - remember to set proper database - select on left top corner

### Code Style Rules and Formatter

Formatter for Schema Generators: [dotnet-format](https://github.com/dotnet/format)

```
dotnet tool install -g dotnet-format
```

In order to format run

```
dotnet format -w -a info -s info
``` 
