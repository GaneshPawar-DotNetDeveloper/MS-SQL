create database student
use student
create table study(
id int ,
name varchar (40))


if(not exists (select * from sys.schemas where name='ganesh'))
begin
exec ('create schema [ganesh] AUTHORIZATION [Dbo]')
end

alter schema ganesh transfer dbo.study
