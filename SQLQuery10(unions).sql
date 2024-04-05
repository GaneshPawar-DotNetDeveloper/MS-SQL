create database Unions
use unions

create table dotnet(
rollnumber int,
name varchar(50),
city varchar(10)

)
insert into dotnet values(1,'ganesh','solapur'),(2,'dhiraj','pandharpur'),(3,'vasudha','nashik'),(4,'kishore','latur')
,(5,'ajay','burhanpur'),(6,'chaitanya','yavatmal')

create table java(
rollnumber int,
name varchar(50),
Email varchar(20)
)
insert into java values(1,'jyoti','j@j.com'),(2,'ganesh','g@g.com'),(3,'manasi','m@m.com'),(4,'sana','s@s.com')

select * from dotnet
select * from java


select * from dotnet
union all
select * from java

select * from dotnet
union 
select * from java

select rollnumber,name from dotnet
union
select rollnumber,name from java

update  java
set rollnumber=1 where name='ganesh'

select rollnumber,name from dotnet
except
select rollnumber,name from java

select rollnumber,name from dotnet
intersect
select rollnumber,name from java

select * from dotnet
union
select * from java

select rollnumber,name,null as email,city from dotnet
union all
select rollnumber,name , email,null as city from java