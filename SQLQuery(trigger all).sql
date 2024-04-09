use B22DB
go
select * from Student
go
exec sp_help Student
go

-- Student Audit Table
-- this table contains all logs of admissions

create table StudentAudit
(
Id int primary key identity,
Description varchar(500),
AuditDate date
)
go
select * from StudentAudit

-- when a new student gets added then add a new entry in audit table
-- student with rollnumber 1 and name ajay taken admission on 11 september 2023

exec sp_helptext [Tr_Student_Insert]

go

alter trigger Tr_Student_Insert  
on Student  
for insert  
as  
begin  
 declare @Id int, @Name varchar(50)
 select @Id = Id, @Name = Name from inserted  

 declare @Description varchar(500) = 'student with rollnumber '
 set @Description = @Description + cast(@Id as varchar(5)) + ' and name ' + @Name + 
 ' taken admission on ' + cast(getdate() as varchar(100))

 insert into StudentAudit values (@Description, getdate())

end

go

select * from Student
select * from StudentAudit

insert into Student values (10, 'sushant', 'pune', 1)

go

select * from Student
select * from StudentAudit
go

-- on delete student from student table
-- student with rollnumber 1 and name ajay cancelled admission on 11 september 2023

exec sp_helptext [Tr_Student_Delete]
go
alter trigger Tr_Student_Delete  
on Student  
for delete  
as  
begin  
 declare @Id int, @Name varchar(50)
 select @Id = Id, @Name = Name from deleted  

 declare @Description varchar(500)
 set @Description = 'student with rollnumber ' + cast(@Id as varchar(5))+ ' and name ' + 
 @Name + ' cancelled admission on ' + cast(getdate() as varchar(100))

 insert into StudentAudit values (@Description, getdate())
end
go

select * from Student
select * from StudentAudit

delete from Student where Id = 10
go

-- if any student updates data
-- student with rollnumber 1 updated name from ajay to vihaan city from pune to mumbai on 11 september 2023

exec sp_helptext [Tr_Student_Update]
go

alter trigger Tr_Student_Update  
on Student  
for update  
as  
begin  
 declare @Id int, @OldName varchar(50), @NewName varchar(50), @OldCity varchar(50),
 @NewCity varchar(50)
 select @Id = Id, @OldName = Name, @OldCity = City from deleted  
 select @NewName = Name, @NewCity = City from inserted  

 declare @Description varchar(500) = 'student with rollnumber ' + cast(@Id as varchar(5)) + 
 ' updated '

 if @OldName <> @NewName
  set @Description = @Description + 'name from '+ @OldName + ' to ' + @NewName

 if @OldCity <> @NewCity
	set @Description = @Description + ' city from ' + @OldCity + ' to ' + @NewCity

set @Description = @Description + ' on ' + cast(GETDATE() as varchar(100))

insert into StudentAudit values (@Description, GETDATE())

end
go

select * from Student
select * from StudentAudit

update Student set Name = 'vikram pawar', City = 'narhe' where Id = 9

go

select * from [dbo].[Vw_StudentTrainer]

select * from Trainer
select * from Student

update Trainer set Name = 'vikul' where Id = 1

exec sp_help Trainer

-- query not giving correct output
update [Vw_StudentTrainer] set TrainerName = 'usha' where Id = 1

create trigger Tr_VwStudentTrainer_Update
on Vw_StudentTrainer
instead of update
as
begin
	-- find trainer id from trainer name
	-- update student table with trainer id

	declare @StudentId int, @TrainerName varchar(50), @TrainerId int
	select @StudentId = Id, @TrainerName = TrainerName from inserted

	select @TrainerId = Id from Trainer where Name = @TrainerName

	update Student set TrainerId = @TrainerId where Id = @StudentId

end

select * from [Vw_StudentTrainer]
update [Vw_StudentTrainer] set TrainerName = 'usha' where Id = 1

go

create trigger Tr_B22_Restrict_Table_Creation
on database
for create_table
as
begin
	print 'B22 database table creation is restricted'
	rollback
end

go

create table v2 (Id int)

use B22_ArchivedDB
create table v2 (Id int)

use B22DB
create table v2 (Id int)

go

create trigger Tr_B22_Restrict_Table_Creation_Server
on all server
for create_table
as
begin
	print 'B22 database table creation is restricted'
	rollback
end

go

use B22_ArchivedDB
create table v3 (Id int)

use B22DB
create table v3 (Id int)
go

alter trigger Tr_B22_Restrict_Table_Creation_Server
on all server
for create_table, alter_table, drop_table
as
begin
	print 'B22 database table creation is restricted'
	rollback
end

go

select ORIGINAL_LOGIN() -- VHT-VIKUL-RATHO\user

select top 10 * from sys.dm_exec_sessions where is_user_process = 1 and 
login_name = ORIGINAL_LOGIN()

select count(1) from sys.dm_exec_sessions where is_user_process = 1 and 
login_name = ORIGINAL_LOGIN()

go

alter trigger Tr_B22_Restrict_Table_Creation
on database
for create_table
as
begin
	print 'B22 database table creation is restricted'
	select eventdata()
end

go

create table v5(Id int)

go

declare @Name varchar(50), @MName nvarchar(50)
set @Name = 'vihaan'
print @Name
set @MName = N'?????'
print @MName

print coalesce('v@v.com', 'v1@v.com', cast(0 as varchar(5)))