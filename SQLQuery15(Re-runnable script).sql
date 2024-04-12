create database GetAllData
use getalldata

create table std(id int)
-- Q. how to get all  tables,sp,triggers etc from a database.

-- 1. Get the list of tables only

Select * from SYSOBJECTS where XTYPE='U'
-- here SYSOBJECTS stands for table name
-- XTYPE='U' stands for user defined table

-- 2. Gets the list of tables only
Select * from  SYS.TABLES


-- 3. Gets the list of tables and views
Select * from INFORMATION_SCHEMA.TABLES

-- then why we use that 
--> for rerunnable script. matlab hm check karakare script bana rahe he,isme error nahi aa raha he.
 --> ex. uper humne std ka table create kiya he per agar maine vo firse banane ki koshish ki to vo error dega.
 
 
--Executing the above query on my SAMPLE database returned the following values for XTYPE column from SYSOBJECTS
--IT - Internal table
--P - Stored procedure
--PK - PRIMARY KEY constraint
--S - System table 
--SQ - Service queue
--U - User table
--V - View
Create table tblEmployee
(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
)
 

if not exists(select table_name from INFORMATION_SCHEMA.TABLES where TABLE_NAME='tblpEmployee')
begin
print 'table not exist and crreate a new table'
create table tblpEmployee(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
)
end
else
begin
print 'table exist so it deleted and recreated a new table'
drop table tblpEmployee
create table tblEmployee(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
) end

select * from tblpEmployee

 -- for cloumns
  if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME ='EmailAddress' and TABLE_NAME = 'tblEmployee' and TABLE_SCHEMA='dbo') 
Begin
 ALTER TABLE tblEmployee
 ADD EmailAddress nvarchar(50)
End
Else
BEgin
 Print 'Column EmailAddress already exists'
End

select * from tblEmployee

--Col_length() function can also be used to check for the existence of a column

If col_length('tblEmployee','EmailAddress') is not null
Begin
 Print 'Column already exists'
End
Else
Begin
 Print 'Column does not exist'
End 


-- Sql server built-in function OBJECT_ID(), can also be used to check for the existence of the table

IF OBJECT_ID('tblEmployee') IS NULL
Begin
   -- Create Table Script
   Print 'Table tblEmployee created'
End
Else
Begin
   Print 'Table tblEmployee already exists'
End



