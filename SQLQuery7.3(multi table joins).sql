--create database multitableRelationship
use  multitableRelationship
-- design tables for acadamy.
--  there are student, trainer,courses,batches

--condition :
-- 1. one student can have one course. -- for that we make foreign key in student table which is on courseId.
-- 2. one trainer can teach multiple courses. -- for that we create a table trainercourse
-- 3. one course can have multiple batches.


create table course(
courseId int primary key identity,
courseName varchar(50),
courseDurationInMonth int,
courseFees int
)
insert into course values('dotnet',6,40000),('java Backend',4,8000),('python',5,60000),('java frontend',4,7000)

create table trainer(
trainerId int primary key identity,
trainerName varchar(30),
trainerExpInYear int

)
insert into trainer values('vikul',12),('ashish',10),('suraj',5),('usha',6)
create table Batch(
batchId  int primary key identity,
batchName varchar(50),
batchstarttime time,
batchendtime time
)
select * from Batch
insert into Batch values('b21','8:00','10:00',1),('b22','11:00','1:00',1),('t22','8:00','11:00',2)
create table student(
rollnumber int primary key identity,
studentName varchar(40),
studentEmail varchar(50),
studentgender varchar(10),
courseId int foreign key references course(courseId )

)
insert into student values('ganesh','g@g.com','male',1),('mahesh','m@m.com','male',1),('swati','s$s.com','female',2),
('aniket','A@A.com','male',3),('raj','r@r.com','male',null),('archana','Ar@Ar.com','female',3)

create table trainercourse(
trainercourseId int primary key identity,
trainerId int foreign key references trainer(trainerId),
courseId int foreign key references course(courseId)
)
insert into trainercourse values(1,2),(2,1),(2,2),(3,3),(3,4)
select * from trainer
select * from course
create table coursebatch(
courseBatchId int primary key identity,
courseId int foreign key references course(courseId)

)
select * from student  
select * from course
select * from trainer
select * from batch
select * from trainercourse
select * from coursebatch

alter table batch
 add courseId int foreign key references course(courseId)


 -- so we want student name and trainer name
 -- but here we can't give direct relation 
 -- so we need first student name to courseId, courseId to trainercourseId,trainercourseId to trainerId

 select student.studentName,course.courseName
 from student join course on student.courseId=course.courseId
 join trainercourse on trainercourse.courseId=course.courseId
 join trainer on trainercourse.trainerId=trainer.trainerId

 select student.studentName,course.courseName
 from student left join course on student.courseId=course.courseId
 left join trainercourse on trainercourse.courseId=course.courseId
left join trainer on trainercourse.trainerId=trainer.trainerId


create table studentbatch(
id int primary key identity,
rollnumber int foreign key references student(rollnumber),
batchId int foreign key references batch(batchId)

)
select * from student
select * from batch
select * from studentbatch
insert into studentbatch values(1,3),(2,2),(3,2),(4,4)

select student.studentName,batch.batchname,
 batch.batchstarttime,batch.batchendtime
 from student join studentbatch on student.rollnumber=studentbatch.rollnumber
 join batch on batch.batchId=studentbatch.batchid



