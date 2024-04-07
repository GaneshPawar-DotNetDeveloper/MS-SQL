
-- create database

create database basicSQL

-- using database

use basicSQL

-- Create table

create table student
(
Id int,
Name varchar(50), 
Age int,
Gender varchar(50),
)

--insert into command

insert into student values(1,'Suraj',23,'Male')

-- select command

select*from student

--rename the database 
exec sp_renamedb 'BacisSQL' , 'BasicSql'

-- Update the table

update student set Name='Suraj' where Id = 3

-- Deleting record 

delete from student where Id = 4

-- For Adding New Column

alter table student add Batech 


