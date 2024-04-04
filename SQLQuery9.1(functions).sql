create database [function for computational logic]
use [function for computational logic]
-- we use for write computational logic

--three types of function 
--1.scalar function
--2. table valued function
--3.multistatement table valued function.

-- there are some built in functions like ageregate functions-- count,min,max,avg,sum

 select ascii('#')
 select ascii('g') as assciiCode
 select char(24)
 select char(35)

 declare @name varchar (40)='      ganesh       '
select @name as normalname
  select ltrim( @name) as ltrimName
  select rtrim(@name) as rtrimname
  select trim(@name) as bothtrim 

  declare @name varchar(50)= 'GaneSH PaWaR'
  select upper(@name) as uppper
  select lower (@name) as lowers

  declare @name varchar(40)='ganesh pawar'
  select reverse(@name) as reverseFun  -- it give rversed charachters
  select len(@name) as LEnFun   -- total character number
  select left(@name,2) as LeftFun -- selecting numbers of characher from left side
  select right(@name,2)as RightFun -- selecting number of chracter from right site

   create table student(
   rollnumber int primary key identity,
   name varchar(50),
   EmailId varchar(50),
   city varchar(30)
   ) 
   insert into student values('ganesh','ganeshkp@gamil.com','solapur'),
   ('suraj','surajcool9623@gmail.com','mohol'),
   ('raj','pruthvi007@gmail.com','Ankoli'),
   ('rohan','rohandada@gamil.com','barshi'),
   ('arbaj','arbi111@outlook.in','solapur'),
   ('ashvini','ash@wikipidia.org','nagpur'),
   ('shunham','shubhu@.org','ahillyanagar')
	selEct * from student

	-- Q. find number of student which start from character 'a'
       -- there are two ways to find that 
	   -- 1. use like operator
	   -- 2. use left function
	   select name from student where name like 'a%'
	   select name from student where left(name,1)='a'

	   declare @name varchar(40)='ganesh pawar'
	   select CHARINDEX(' ',@name) as spacevalue
	   select CHARINDEX('a',@name) as firstvalue

	   -- substring
	   declare @name varchar(50)='ganeshpawar99@gmail.com'
	   select substring (@name,0,14)
	   -- @name=string name,0=starting index,14= how much position index

	   -- i wnat separate username an domain
	   declare @name varchar(50) = 'surajcool9823@gmail.com'
	   select substring (@name ,1,(charindex('@',@name)-1)) as username
	   select substring (@name,(charindex('@',@name)+1),len(@name)) as domain
	    select substring (@name,(charindex('@',@name)+1),len(@name)-CHARINDEX('@',@name))

		select name,emailId,substring (emailId ,1,(charindex('@',emailId)-1)) as username,
		substring(emailid,(CHARINDEX('@',emailid)+1),len(emailid)),city from student

		-- see count of domain
		select substring(emailid,(CHARINDEX('@',emailid)+1),len(emailid)) as domain ,count(rollnumber)from student
		 group by substring(emailid,(CHARINDEX('@',emailid)+1),len(emailid))

		 select REPLICATE('*',10)
		 declare @name varchar(30) ='ganeshpawar'
		 select replicate('*', len(@name))

		 select 'ganrsh'+space(30)+'pawar'

		 declare @name varchar(30) ='ganeshpawar'
		 select  PATINDEX('%sh%',@name)  -- to check pattern index

		 		 declare @name varchar(30) ='ganeshpawar'
                  select replace(@name,'pawar','dada')

				  		 declare @name varchar(30) ='ganeshpawar'
						 select STUFF(@name,2,3,'@@@') -- @name= kis me se, 2= kaha se ,3= kaha tak,'@@@'=kis se
						 select stuff(@name,2,8,replicate('*',8)) --	

						 declare @mobile varchar(10)= 9011542579
						 select stuff(@mobile,3,6,replicate('*',6))