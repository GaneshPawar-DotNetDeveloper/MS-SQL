 create database storedprocedure
 use storedprocedure
 create table student (
 
	rollnumber int IDENTITY (1,1) NOT NULL,
	studentName varchar(40) NULL,
	studentEmail varchar(50) NULL,
	studentgender varchar(10) NULL,
	courseId int
 
 
 )
 insert into student values ('ganesh','g@g.com','male',2),
   ('suraj','s@s.com','male',4),('raj','p@p.com','male',1),('ujawala','u@u.com','female',5)
    select * from student
  --create procedure usp_GetStudents

   create proc usp_getstudent
 as
 begin
   select rollnumber,studentname,studentemail,studentgender,courseid
   from student
 end 

 execute usp_getstudent
 --exec usp_getstudent

 

 -- for editing we use alter 
   alter procedure usp_getstudent
   as
   begin
   select * from student
  end 

  exec usp_getstudent

  alter proc usp_getstudent
  as
  begin
  select rollnumber,studentName,studentemail,studentgender,courseid
   from student where studentgender='male'
   end
   exec usp_getstudent
  
  -- parameterized stored procedure 
   -- sp having parameter
   -- parameter start with @ symbol.
   -- parameter write in between procedure and as keyword

   alter proc usp_getstudent
   @studentgender varchar (10)
   as
   begin
   
     select rollnumber,studentname,studentemail,studentgender,courseid
   from student where studentgender=@studentgender

   end
   exec usp_getstudent 'female'
   exec usp_getstudent 'male'

   -- multiple parameters
   alter proc usp_getstudent 
   @rollnumber int,@studentgender varchar(10)
   as begin 
   select rollnumber,studentname,studentemail,studentgender,courseid
--   from student where rollnumber=@rollnumber or studentgender=@studentgender
     from student where rollnumber=@rollnumber and studentgender=@studentgender

  end
   exec usp_getstudent 1,' male' 
 --  exec usp_getstudent 'female' ,1
   exec usp_getstudent @studentgender='male',@rollnumber=4

   --stored proceedure with return statement
   -- if we want to name when we give any rollnumber to procedure


   alter proc usp_getstudent
   @rollnumber int
   as
   begin
   declare @name varchar(50)
   select @name=studentName from student
   where rollnumber=@rollnumber
   return @name
   end

   declare @name varchar(50)
   exec @name=usp_getstudent @rollnumber=1
   print @name
   -- here they give conversion error because return statement can only return int value

-- if we want rollnumber when we gives name to procedure 
   alter proc usp_getstudent
   @name varchar(50)
   as
   begin
   declare @rollnumber int 
   select @rollnumber=rollnumber from 
   student where studentName=@name
   return @rollnumber
   end

   declare @RN int
   exec @RN =usp_getstudent @name='ganesh'
   print @RN

  -- if we want to name when we gives any rollnumber to procedure.

  alter proc usp_Getstudent
  @rollnumber int
  as
  begin
  declare @name varchar(10)
  select @name=studentName from student
  where rollnumber =@rollnumber
  return @name
  end
  declare @name varchar(10)
  exec @name=usp_Getstudent @rollnumber=1
  print @name
  -- Conversion failed when converting the varchar value 'ganesh' to data type int.

  alter proc usp_getstudent
  @rollnumber int 
   as
 begin
   select studentname 
   from student
   where rollnumber=@rollnumber
 end 
 declare @result int 
 exec usp_getstudent @rollnumber=1
 print @result

 -- output parameter (return se hum sirf int value hi le sakate he per output se hum multiple value return kar sakate he)
 alter proc usp_getstudent
 @rollnumber int,@name varchar(50) output 
 as
 begin
 select @name =  studentname from student where rollnumber=@rollnumber
 end
 declare @nameO varchar(50)
 exec usp_getstudent @rollnumber=1,@name=@nameO output
 print @nameO








