use B16DB
create table trainer(Id int primary key identity(1,1),TrainerName varchar(50) )
insert into trainer values('Vikul'),('Ashish'),('Deepika')

create table Student 
(
RollNumber int primary key,Name varchar(50),Age int,TrainerId int foreign key references trainer(Id) on delete cascade
)

insert into Student values(1,'Suraj',23,1),(2,'Ganesh',25,2),(3,'Raj',20,1),(4,'Khanderao',35,3)

--select name from student where Name like 's%'
--select Name from student where Age in (20,21,22,23,24,25,26)
select Name,COUNT(RollNumber) from student group by Name having max(Age)>20
select distinct* from student
select * from student order by Age
select * from student
select * from trainer
--update student set Name='Vidyadevi' where RollNumber=4
--select name from student where rollnumber= 4
--update trainer set trainerName='Varsha' where id=3
--select TrainerName from trainer where id= 3
--select Name from Student having max(Age) >20
--Drop table Student
--drop table trainer

set identity_insert trainer ON
insert into trainer ( Id,TrainerName) values(2,'Ashish')



