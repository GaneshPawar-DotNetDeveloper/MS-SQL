create database QuestionsAndAnswers
use QuestionsAndAnswers

--1. how we get alter index
    --first how we create index -- we create index when we face slowness of our query.
	-- it is only analysis not a develope , we can only find way to improvement.
	 
	 create index Ix_IndexName
	 on tableName(which col.)

	 create index Ix_IndexName
	 on table(col1,col2)
	 include (col2) with (drop existing on) -- it firstly drop insex and then it recreate it with using the same name	

	 -- 2. when we see our created table then there first we see like
	 SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 -- so what is mwaning:
   SET ANSI_NULLS ON -- mean when we compare any value with null it return alway 0
   SET QUOTED_IDENTIFIER ON-- it say that the meaning of [] and "" is same 
   -- means jab hum [student rollnumber] aise likhate he tab vo use error nahi deta kyuki vo use "student rollnumber" 
   --  ise consider karata he.

   3. what is dbo 
   -- schema owner name or database owner name 
    dbo.user == bydefault
	odd.user
	even.user == here we can get same table do bar le sakate he with different schema.

  4.decimal datatype
  declare @amount int = 1234.455 --> 1234  it's give only integers value only
   print @amount

   -- so for that we have 2 sub types 
   a. decimal(p,s)
   b. numeric(p,s)

   -- here p= precision  -- ye point ke left me or right me kitane number he ye dicide karata he.
                         -- its mimimuum value is 1 and maximum value is 38.
						 -- ex: 22345.244  total decimal = 8 here so pricision is 8

    -- s= scale  -- maximum stored digits to the right side of digit he vo kitane he o batata he 
	-- defauilt value of ecimal is(18,0)

	declare @salary decimal(8,3)= 12345.678
	print @salary

	declare @salary money = $36677
	 print @salary

	 5. char and nchar()

	 char - multiple character likhane ke liye , isme fix value hoti he. -- it always take 6 byte memory 
	 nchar - isme hum marathi,hindi any language likh akate he . it take 2 byte memory.

	 declare @name char(6)= 'ganesh pawar'
	 print @name
	 -- here they give only 6 characters becuse it has fix size.
		 declare @name nchar(10)= 'ganesh pawar'
	 print @name
	 -- here diff is like only memory like it takes 10+1 byte
	   declare @name varchar(10)= 'ganesh pawar'
	 print @name







