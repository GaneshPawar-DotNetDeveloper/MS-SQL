create database timefunctions
use timefunctions

select getdate()
select CURRENT_TIMESTAMP
select SYSDATETIME()
select SYSDATETIMEOFFSET ()
select SYSUTCDATETIME()

create table timedate(
times time ,
dates date ,
smalldatetimes smalldatetime,
datetimes datetime,
datetime2s datetime2 (3),  -- 3 is the pression means how many milisecond you want
datetimeoffsets datetimeoffset
)
delete from timedate
 insert into timedate values('12:55:12.535',getdate(),getdate(),getdate(),getdate(),getdate())
select * from timedate

select isdate(getdate())
select isdate(getdate())

select day(getdate())
select month(getdate())
select year(getdate())
select year('1977-08-23')
--select year('23-09-1999')
--select datetime('datapart','actual date')
--select datetime(qq,'26-03-2024')
select datename(qq,getdate())
select datename(dw,getdate())
--select datename(dw,'23-08-1999')
select datepart(dw,getdate())
select dateadd(day,1,getdate())
select dateadd(year,1,getdate())
select datediff(day,'1999-08-23',getdate())
select datediff(month,'1999-08-23',getdate())
select datediff(year,'1999-08-23',getdate())

-- find age in year
declare @dob date= '1999-08-23'
declare @currentdate date = getdate()
select datediff(year,@dob,@currentdate) -
case 
when month(@currentdate)< month (@dob) or	
month(@currentdate)=month(@dob) and day(@currentdate)<day(@dob) then 1
else 0
end

--for find months
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
select @months= datediff(month,@tempdate,@currentdate) 

select @years
select @months


--for days also

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
select cast(@years as varchar (5))+' years '+cast(@months as varchar(10))+' months '+cast(@days as varchar(6))+' days '