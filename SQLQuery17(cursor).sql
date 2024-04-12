-- cursor:
use CTEandDERIVEDtable
create table #temptable (name varchar(50),totalcharacter int)


declare @name varchar(100)
-- so i want one by one row with find length of name
declare employeecorsor cursor for
select name from tblEmployee
-- this is declaration of cursor, means hum kispe cursor bana raahe he.
open employeecorsor 
-- means our
fetch next from  employeecorsor into @name
While(@@FETCH_STATUS = 0) -- it is there are row available in table (jab ye line by line jata he tab last use row khatam 
                             -- hone ka @@FETCH_STATUS  batata he)
Begin
insert into #temptable values(@name,len(@name))
fetch next from studentcursor into @name
end
close studentcursor
deallocate studentcursor



select * from #temptable



select name,len(name) from tblEmployee
select * from tblEmployee


      

