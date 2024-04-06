create database views
use views
-- view is a virtual table or saved sql  query
create table student(
id int identity,
name varchar(50),
age int,
paisfees int
)
insert into student values('ganesh',24,40000),('suraj',26,50000),('mahesh',27,20000),('rupesh',28,70000)

select * from student

create table trainer(
trid int identity,
trname varchar (49) not null,
trmobile bigint unique,
trpayment int

)

insert into trainer values ('vikul',9011542578,40000),('usha',9011542579,30000),('schin',90111542574,20000)


select * from student
select * from trainer

-- so in that sinario 
-- here student wants to see his details and trainer details
select name,age,paisfees,trid,trname,trmobile,trpayment
from student join trainer 
on student.id=trainer.trid

--  so here i want to store data in table so for that i use view 
-- why view ? we cn create sp,function()
-- so there are two benifits of veiw.
--  so here that example there we want student name and his trainer but there is not mendatory to see trainer payment
 --  there is not mendatory to see payment
 --  trainer as monthly salary so why his interested in student paid fees
 -- 1. column level security.
 -- agar dot net trainer wants to see all student data ,tab unhe java,python ke bhi dhikhakar kya fayada.
  -- 2. row level security.
	
	-- so user ko hum veiw ka access dekhar uska reqirement jaisa dekha sakate he . sp, function user ko samaj hi nahi ayaga.

	create view VW_studentdetail
	as
	(
	select name,age,paisfees,trname,trmobile
from student join trainer 
on student.id=trainer.trid
	)
	-- here we dont want trainer payment and trainer id so we can hide it .
	select * from VW_studentdetail

	create view vw_trainerData 
	as(
	select name,age,trid,trname,trmobile,trpayment
from student join trainer 
on student.id=trainer.trid
	)
	-- here trainer can skip student payment
	select * from vw_trainerData 

	-- here veiwdoes not save data .
	-- here we we jion the student and trainer data so that call like underline base table (ubt)
 
 -- hum query linkh ke bhi skip/hide kar sakate he to hume view likhane ki kya jarurat?
   --> ya  per  uske liye user ko ye puri query likhani padegi. or user nonIT ka ho to kaise likhega.
    
	-- don't go update,insert,--- data throught view.
	-- to update data through view correctly we use trigger.

	--schemabinding :

	-- if we try to drop view table then it drop original table. for solving/aviod this problem we can use schemabinding.



































