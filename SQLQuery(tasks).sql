create database tasks
use tasks

--task 1 : create Employee table with id and column and put name in marathi 
create table Employee(
id int identity,
name nvarchar(100)
)
--insert into Employee values('ganesh'),('suraj'),('raj')
delete Employee
insert into employee values(N'suraj'),(N'ganesh'),(N'raj')
truncate table employee
insert into Employee values(N'सूर्य '),(N' गणेश '),(N'राज')
select * from Employee

create table student (
rollnumber int identity,
name varchar(30)

)
insert into student values(N'suraj'),(N'ganesh'),(N'raj')
delete student
insert into student values(N'सूर्य '),(N' गणेश '),(N'राज')
select * from student -- its give ????? 

-- how to store image in sql
 -- use varbinary

 CREATE TABLE Images (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ImageData VARBINARY(MAX)
);
INSERT INTO Images (ImageData)
SELECT BulkColumn
FROM OPENROWSET(BULK 'C:\Users\DELL\Downloads\National-Youth-Day.jpg', SINGLE_BLOB) AS Image

select * from Images
INSERT INTO Images (ImageData)
VALUES ('C:\Users\DELL\Downloads\Untitled.png');
--Implicit conversion from data type varchar to varbinary(max) is not allowed. Use the CONVERT function to run this query.

SELECT ImageData
FROM Images
WHERE ID = 1