
--create database constraints
--  use constraints


-- 1. null constraints 
--create table collegeD(rollnumber int not null,name varchar(40),mobilenumber varchar(10),Email varchar(50),city varchar(20),
--[PAN Number] varchar(50),[adharcard number] varchar (15),Gender varchar(10))
--select * from collegeD
--insert into collegeD (rollnumber ,name) values(null,'mangu')
--select * from collegeD

--insert into collegeD (rollnumber ,name) values(null,'ganesh')
--select * from collegeD
--delete from collegeD
--select * from CollegeD
--drop table collegeD
--select * from collegeD


-- primary key constrints
--create table colleges(rollnumber int primary key ,name varchar(40),mobilenumber varchar(10),Email varchar(50),city varchar(20),
--[PAN Number] varchar(50),[adharcard number] varchar (15),Gender varchar(10))
--select * from colleges
--insert into colleges(rollnumber,name)values(1,'ganesh')
insert into colleges(rollnumber,name)values(1,'ramesh')

select * from colleges