
use sp
select * from student


-- here i give name and get rollnumber
create proc getstudentname	
@name varchar(40)
as
begin
declare @rollnumber int
select @rollnumber=studentId from student where @name=name
return @rollnumber
end 
declare @rn int
 exec @rn= getstudentname	'suraj';
 select @rn

 -- generate rollnumber and return 

 create proc usp_insertstudentAndreturnvalue
 @name varchar(50),@gender varchar(10),@age int ,@city varchar(50)
 as 
 begin
 insert into student values(@name,@gender,@age,@city)
 return scope_identity()

 end

 declare @rollnumber int
 exec usp_insertstudentAndreturnvalue @name='pratik',@gender='male',@age=76,@city='pune'
 select @rollnumber

