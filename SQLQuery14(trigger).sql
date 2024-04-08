create database triggers
use triggers

-- it is a speacial time sp.
-- trigger get automatically fired against action with which trigger is created (means humane jiske liye trigger banaya he 
--vo action jab call hogi tab trigger automatically run ho jayega.)

-- here we have a table 
create table student(
id int identity,
name varchar(40),
gender varchar(10)

)
insert into student values('suraj','male'),('ganesh','male'),('raj','male'),('snehal','female')

select * from student
-- here hume jab isme kuch add karana hoga to hume insert ko separate  or logic bhi separate call karana padega
-- to vo hume automatically call karana hoga to hum trigger ka use karenge.

insert into student values('somnath','male')
select * from student
-- there are two types of trigger
-- 1. after or for trigger.
-- 2. instead of trigger.

create trigger TR_Student_Insert
on student
for insert 
as begin
print 'trigger executed'
end
insert into student values('rahul','male')
select * from student
-- so here Query as well as trigger both are executed  therefore that is After or for trigger
-- 2. instead  of trigger.
 -- in insted of trigger Query are not executed but trigger will Executed.

 create trigger tr_insert_data
  on student
 instead of insert 

 as 
 begin
 print 'this trigger is instead of trigger'
 end

 insert into student values('uma','female')
 select * from student

 -- we see n view there are some issue for the update command so that command we can write in the trigger 
  -- trigger give the logistic message for that so we write query in trigger with update command.

  create trigger tr_student_update
  on student
  for update
  as 
  begin 
  print ' Query will be updated'
  end

  update student
  set name='ganraj' where id=2
  select * from student







