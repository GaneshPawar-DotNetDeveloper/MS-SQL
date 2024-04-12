create database errorhandling
use errorhandling

create table customer(
id int primary key,
name varchar(20)
)
insert into customer values ('ganesh')
-- yaha per humne id ka value put nahi kiya so that is syntax error. or colon nahi diya 
-- so syntax error hum query likhate kar sakate he.

insert into customer values(1,'ganesh')

insert into customer values(1,'suraj')  -- it gives error
-- here Violation of PRIMARY KEY constraint 'PK__customer__3213E83FB4FB6B2D'. 
--Cannot insert duplicate key in object 'dbo.customer'. The duplicate key value is (1).
 
 alter proc sp_insertcustomer
 @id int , @name varchar(40)
 as
 begin
 insert into customer values(@id,@name)
 select * from customer
 end
 exec sp_insertcustomer 2,'suraj'
 exec sp_insertcustomer 3,'raj'
 exec sp_insertcustomer 3,'mahesh'
 -- Violation of PRIMARY KEY constraint 'PK__customer__3213E83FB4FB6B2D'.
 -- Cannot insert duplicate key in object 'dbo.customer'. The duplicate key value is (3).
 select * from customer
  exec sp_insertcustomer 4,'ramesh'

  exec sp_insertcustomer 3,'swati'

  -- here when i try inter to duplicate value then it give error massage but after error line it caan execute 
  -- so here it give result .
  -- so i want handle that error for that i use try catch block

  alter proc sp_insertcustomer
  @id int ,@name varchar(50)
  as
  begin
   begin try
   insert into customer values(@id,@name)
   select * from customer
   end try
   begin catch
   print 'error while make when you inter duplicate value'
   end catch
  end
  
  sp_insertcustomer 3,'rekha';
  -- error while make when you inter duplicate value
  -- so here it give a meaningful massage and it ignore after error lines

  -- so yaha ye to normal error dikha raha he to muze isko error format me dikhana he yane ki
  --   (mgs,severaty level,state)
 -- to uske liye hume raiserror(message,severity level,state) use karenge
  alter proc sp_insertcustomer
  @id int ,@name varchar(50)
  as
  begin
   begin try
   insert into customer values(@id,@name)
   select * from customer
   end try
   begin catch
 raiserror( 'error while make when you inter duplicate value',16,1)
   end catch
  end
  
  sp_insertcustomer 3,'usha';
  -- Msg 50000, Level 16, State 1, Procedure sp_insertcustomer, Line 10 [Batch Start Line 71]
  -- error while make when you inter duplicate value

  -- i want to all detail about error
   alter proc sp_insertcustomer
  @id int ,@name varchar(50)
  as
  begin
   begin try
   insert into customer values(@id,@name)
   select * from customer
   end try
   begin catch
   select ERROR_PROCEDURE()
   select ERROR_MESSAGE()
   select ERROR_SEVERITY()
   select ERROR_STATE()
   select ERROR_LINE()
   select ERROR_NUMBER()
-- raiserror( 'error while make when you inter duplicate value',16,1)
   end catch
  end
  
  sp_insertcustomer 3,'meena';


  -- so i want atore all sp detail as adiut record 
   alter proc sp_insertcustomer
  @id int ,@name varchar(50)
  as
  begin
   begin try
   insert into customer values(@id,@name)
   select * from customer
   end try
   begin catch
   insert into sperror values(ERROR_PROCEDURE(),ERROR_MESSAGE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_STATE(),getdate() )
 raiserror( 'error while make when you inter duplicate value',16,1)
   end catch
  end

  create table sperror(
  errorId int identity,
  errorspname  varchar(200),
  errormessage varchar(1000),
  errorseverity int,
  errorline int,
  errorstate int,
  errortime datetime


  )
  sp_insertcustomer 3,'mosin';
  
  select * from sperror
  -- is table data hume life time dekhane milega.

