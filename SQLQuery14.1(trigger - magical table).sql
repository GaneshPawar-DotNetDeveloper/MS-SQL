create database magicTrigger
use magicTrigger

-- magic table:
-- we can use magic table insert into triggers only
-- we can't use magic table out of trigger
-- there are two types of magic table 
-- 1.Instead
-- 2. deleted

create trigger Tr_magic_tables
on student
for insert
as 
begin
select * from inserted
select * from deleted
end

create trigger Tr_magic_table
on student
for delete
as 
begin
select * from inserted
select * from deleted
end

select * from student

insert into student values('mahesh','male')

delete from student where id=4

-- it give inserted data and updated data

-- here magic table give there multiple Query simountaniously
-- jab humne insert kiya tab 


-- for update

create trigger Tr_student_updates
on student
for update
as
begin
select * from inserted
select * from deleted 
end

update student set name='pruthviraj' where id=3
-- so here in inserted table it give the new record
-- and in deleted table it give the old record



-- so i want when we insert data on student so simountaniously atudent audit will be executed simountaniously 
-- where that store in another data
-- means jab me table me record insert karunga tab muze student audit me discription me 1 record inserted and
 -- thats time ana chahiye.

 create table studentAudit(
 id int primary key identity,
 discription varchar(1000)
 )
 create table student(
id int identity,
name varchar(40),
gender varchar(10)

)
insert into student values('suraj','male'),('ganesh','male'),('raj','male'),('snehal','female')


alter trigger Tr_student_insertData
 on student
 for insert
 as
 begin
 declare @id int
 Select @id=id from inserted -- but here i want jab me insert karunga tab audit me bhi data automatically add hona chahiye.
 -- but thwew Id ka value dynamic chahiye na hum yek hi id nahi dal sakate so for that hume vriable declre karake 
 -- usame id pass karana hoga
-- declare @decription varchar(200)='person with id = 1 is inserted at time' --  -- but here value are hardcoded
 declare @description varchar(200)='person with   ' + cast(@id as varchar(5) )+ ' id is inserted at  '+ 
 cast(getdate() as varchar(100))

 -- here jab student table me data insert hoga tab uska yek auditEntry automatically studentAudit table me jayega.
   insert into studentAudit values (@description)
   end

   INSERT into student values('mk gandhi','male')
   INSERT into student values('veer savarkar','male')


   select * from student
   select * from studentAudit

   create trigger Tr_Student_Deleted
   on student
   instead of delete
   as
   begin
   declare @id int
   select @id= id  from deleted
   declare @discription varchar(200)= 'person with Id '+ cast(@id as varchar(5)) + 
   '  is deleted at the time '+ cast(getdate() as varchar(200))
   insert into studentAudit values(@discription)
   end

   delete from student where id=2
   select * from student
   select * from studentAudit


   --- so i want to update table and then it give the audit like person with id 1 is updated from name old to new at time

  alter trigger Tr_student_update
   on student
   for update 
   as begin
     declare @id int,@oldname varchar(50), @newname varchar(50) 
	 select @id=id ,@oldname = name from deleted
	 select @newname =name from inserted
	 declare @discription varchar(200)= ' person with Id '+ cast(@id as varchar(5)) + ' is updated  '
  if(@oldname<>@newname)
  set @discription = @discription +' name from '+ @oldname +' to ' +@newname + ' at  '
  set @discription = @discription + ' at '+ cast(getdate() as varchar(50))
  insert into studentAudit values (@discription)
  end
  
  update student set name='ganesh pawar 'where id=2

  select *from student
  select * from studentaudit
