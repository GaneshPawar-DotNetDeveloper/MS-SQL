create database sp
use sp
create table student(
studentId int primary key identity,
name varchar (50),
gender varchar(10),
age int,
city varchar(30)
)
insert into student values('suraj','male',27,'solapur'),('amar','male',28,'dharashiv'),
('gayatri','female',26,'nagpur'),('saurabh','male',30,'latur'),
('gauri','female',27,'ahhilyanagar'),('dhiraj','male',26,'pandharpur')

select * from student

-- 1. simple sp
create  proc spgetstudent
as
begin
select name,gender,city from student
end

spgetstudent;
execute spgetstudent
exec spgetstudent


-- 2. single parameter sp
create proc getStudentById
@id int -- declare variable
as
begin
select name,gender from student 
 where studentId=@id -- here @id id parameter which we give dyanamically when we execute the sp
 end

 exec  getStudentById 1
 exec  getStudentById 3
 exec  getStudentById 6

 --  sp with multiple parameter
 create procedure spGetStudentByIdAndName
 @id int,
 @name varchar(40)
 as
 begin
 select studentId,name,gender from student
 -- where studentId=@id and name=@name
  where studentId=@id or name=@name
 end
 select * from student
spGetStudentByIdAndName 1,'suraj';
 -- here when we change the arrangement of parameter then it give us error like can't converting int to string

 alter procedure spGetStudentByIdAndName
 @id int,
 @name varchar(40)
 as
 begin
 select studentId,name,gender,city from student
 -- where studentId=@id and name=@name
  where studentId=@id or name=@name
 end
 exec spGetStudentByIdAndName 3,'dhiraj'

 -- to see our sp which code therfore we us sp_helpText
 sp_helptext  spGetStudentByIdAndName

 -- drop sp we use drpo cammand
 drop procedure  spGetStudentByIdAndName


-- for secure our sp for that we use encryption 

 alter procedure spGetStudentByIdAndName
 @id int,
 @name varchar(40)
 with encryption
 as
 begin
 select studentId,name,gender,city from student
 -- where studentId=@id and name=@name
  where studentId=@id or name=@name
 end

 sp_helptext  spGetStudentByIdAndName -- when we normally call that query to ye code dega 
                                      -- but here we alter with encryption
--> The text for object 'spGetStudentByIdAndName' is encrypted. 
  -- when we see sp tab hume usper call laga milega.

  --there two sp 
  -- 1. sp with input parameter == mean jise hume execute ke time parameter value dena padega. ye user se value lega
  -- 2. sp with output parameter == calling sp ko value dega.

  create proc spGetStudentByGender
  @gender varchar(10),
  @GetGount int output
  as
  begin
  select  @GetGount	=count(studentId) from student
  where gender=@gender
  end

  -- here we find total male and felmale in gender column.
  -- jab hum gender value male/female denge to vo hume count dega , per yaha do parameter he to jab hum sirf male denge 
  --  to uske sath out parameter dene ke liye hum variable declare karenge.
  declare @Totalstudent int
  exec spGetStudentByGender 'male', @Totalstudent out
  select @Totalstudent as malestudents
 
  declare @Totalstudent int
  exec spGetStudentByGender 'female', @Totalstudent out
 -- select @Totalstudent as femalestudents
  --  print @Totalstudent  --as femalestudents -- it give like only value not a table format. 
  -- out parameter always return int value.
  -- so it can return bydefault so there is no need to declare return statement.

  -- jyada tar hum input parameter use karate he ,per jo system sp he vo output parameter ki hoti he , isi liye hume uski
  -- value hume catch karani padati he.

 
