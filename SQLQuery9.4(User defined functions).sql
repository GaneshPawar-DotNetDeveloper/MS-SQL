create database [user defined function]
use [user defined function]

-- there are three type of functions
-- 1. scalar function
-- 2. inline table valued function
-- 3. multistatement table valued function

-- 1. scalar function:
 -- hardcoded value:
 create function calculateAge()
  returns varchar(100)
  as
  begin
  return '24 years 6 months 23days'
  end

  select dbo.calculateAge() as studentage

  --dynamic coded:
  alter function calculateAge(@name varchar(100))
  returns varchar(100)
  as
  begin
  return @name
  end

  select dbo.calculateAge('ganesh pawar') as studentName


  -- calculate age in function
  -- this is hardcoded
    alter function calculateAge()
	returns varchar(100)
	as
	begin
	declare @dob date= '1999-08-23'
declare @currentdate date = getdate()
declare @tempdate date =@dob
declare @years int,@months int,@days int
select @years=datediff(year,@dob,@currentdate) -
case 
when month(@currentdate)< month (@dob) or	
month(@currentdate)=month(@dob) and day(@currentdate)<day(@dob) then 1
else 0
end
select @tempdate=DATEADD(year,@years,@tempdate)
select @months= datediff(month,@tempdate,@currentdate) -
case 
when day(@tempdate)>day(@currentdate) then 1
else 0
end
select @tempdate=DATEADD(month,@months,@tempdate)
select @days= datediff(day,@tempdate,@currentdate) 


--select @years
--select @months
--select @days
return cast(@years as varchar (5))+' years '+cast(@months as varchar(10))+' months '+cast(@days as varchar(6))+' days '
	end

select dbo.calculateAge()


 alter function calculateAge(@dob date)
	returns varchar(100)
	as
	begin
	--declare @dob date= '1999-08-23'
declare @currentdate date = getdate()
declare @tempdate date =@dob
declare @years int,@months int,@days int
select @years=datediff(year,@dob,@currentdate) -
case 
when month(@currentdate)< month (@dob) or	
month(@currentdate)=month(@dob) and day(@currentdate)<day(@dob) then 1
else 0
end
select @tempdate=DATEADD(year,@years,@tempdate)
select @months= datediff(month,@tempdate,@currentdate) -
case 
when day(@tempdate)>day(@currentdate) then 1
else 0
end
select @tempdate=DATEADD(month,@months,@tempdate)
select @days= datediff(day,@tempdate,@currentdate) 


--select @years
--select @months
--select @days
return cast(@years as varchar (5))+' years '+cast(@months as varchar(10))+' months '+cast(@days as varchar(6))+' days '
	end

	--select dbo.calculateAge(getdate())
	select getdate()
	select dbo.calculateAge('1997-11-30')
	select dbo.calculateAge('1999-08-23')
	select dbo.calculateAge('2000-10-30')


	-- get full name using function

	create table Student 
(
Id int primary key identity, 
FirstName varchar(50), 
LastName varchar(50)
)
go
insert into Student values ('ganesh', 'pawar'), ('kishore', 'more'), 
('raj', 'pawar'), ('ajay', 'rathod')
go
select Id, FirstName, LastName from Student
select Id, FirstName, LastName, (FirstName + ' ' + LastName) as FullName  from Student

select Id, FirstName, LastName, (Id + '. ' +  FirstName + ' ' + LastName) as FullName  
from Student
-- Conversion failed when converting the varchar value '.' to data type int.

select Id, FirstName, LastName, (cast(Id as varchar(5)) + '. ' +  FirstName + ' ' + LastName) as FullName  
from Student

go

create function fn_FullName(@FN VARCHAR(50),@LN VARCHAR(50))  -- @FN & @LN = Input parameters(we can give any name for parameters)
  returns varchar(100) -- in which datatype you want returns
  as
  begin
  return @FN +' '+@LN
  end

  select dbo.fn_FullName(FirstName, LastName)as FullName from student


  -- 2. inline table valid function:

  create function fn_getstuent()
  returns table -- here table is a type like int,varchar,date
  as
  return select * from student

  select * from fn_getstuent()
 

 -- it use for print table 
 -- they do not allow begin and end body.
 -- so it can not allow multiple statement.




