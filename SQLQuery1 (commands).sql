--create database AllCollegeData
--use Allcollegedata
--exec sp_renamedb cpplege,college
--create table studenty(
--rollnumber int,age int,name varchar(50),isindian bit
--)
--select * from studenty
--select rollnumber,name from studenty
--insert into studenty (rollnumber,age,name,isindian)values(1,26,'suraj',1)
--insert into studenty (rollnumber,age,name,isindian)values(2,24,'ganesh',1)
--insert into studenty (rollnumber,age,name,isindian)values(3,23,'raj',1)
--insert into studenty (rollnumber,age,name,isindian)values(4,24,'padmraj',1)
--insert into studenty (rollnumber,age,name,isindian)values(5,24,'udayraj',1)

--select * from studenty
--truncate table studenty
--delete from studenty
--select * from studenty
 --insert into studenty values(1,26,'suraj',1)
 --insert into studenty values(2,24,'somraj',1) 
 --insert into studenty values(3,22,'ganraj',1)
 --insert into studenty values(4,21,'meghraj',1)
 --insert into studenty values(5,25,'raj',1)
 --insert into studenty values(6,28,'Aniket',1)
--delete from studenty
 --select * from studenty
 --update studenty set age=30
 --update studenty set age = 26 where rollnumber=3
 --update studenty set age=23,name='big brother',isindian=0 where rollnumber=1
 --select * from studenty

 --delete from studenty
  -- drop table studenty
  --truncate table studenty
  --delete from studenty where rollnumber=6
  --select * from studenty

 -- alter table studenty
  --drop column isindian
  --select * from studenty

 -- alter table studenty
  --add collegename varchar(50)
  --select * from studenty

  --alter table studenty
  --alter column collegename varchar(100)

 -- alter table studenty
 -- add isindian bit not null default 1
  select * from studenty

