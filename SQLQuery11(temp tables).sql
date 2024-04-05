create database tempararyTable
use tempararyTable

-- this is normal table
create table student(
id int,
name varchar(40)
)
insert into student values(1,'ganesh'),(2,'dhiraj'),(3,'pratik'),(4,'ajay'),(5,'akshay'),(6,'abhishek')

select * from student

-- temp table= it similar like permanat table
-- it can automatically deleted when session when we close session

-- there are two types of temp table

-- 1.this is local temp table:
create table #student(
id int,
name varchar(40)
)
insert into #student values(1,'ganesh'),(2,'dhiraj'),(3,'pratik'),(4,'ajay'),(5,'akshay'),(6,'abhishek')

select * from #student

-- prefix with #
-- dyanamic number append to the table name(beacause we can create multiple local temporary table)
-- this table access only one same session not in another session

-- 2. globally temp table
create table ##student(
id int,
name varchar(40)
)
insert into ##student values(1,'ganesh'),(2,'dhiraj'),(3,'pratik'),(4,'ajay'),(5,'akshay'),(6,'abhishek')

select * from ##student

-- select into command
 -- this coomand used when we want to insert a record without creating a table from other table.

 create table course(
 id int,
 courseName varchar(39),
 courseTeatherId int
 )
 drop table course
 -- so here for insert into there is compoursarily create table
insert into course values(1,'marathi',2),(2,'hindi',4),(3,'english',1)
-- but we use select into then it get automatically create schema and insert the records 
--select id int ,name varchar(30),courseTeatherId into course values(1,'marathi',2),(2,'hindi',4),(3,'english',1)

select id,courseName into #course from course
select * from #course

select * into #course2 from course
select * from #course2

-- if we wnat only schema not any value
select * into #course3 from #course2
where 1<>1
select * from #course3

-- if i wnat to store table one database to another database

select * into sample.dbo.#course3 from tempararyTable