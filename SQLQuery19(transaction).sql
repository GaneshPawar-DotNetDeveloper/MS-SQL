
create database transactions
use transactions

-- it is block of sql statement
-- if those sql querie are dependent on each other, transaction make sure for executing all queries or none of the queries.
-- transaction gets completed either with commit or with rollback.

create table physicalAdreess(
id int,
name varchar(20),
adress varchar(40)
)
create table mailingadress(
id int,
name varchar(50),
adress varchar(10)
)

select * from physicalAdreess
select * from mailingadress

create procedure sp_insert
as
begin
insert into physicalAdreess values(1,'ganesh','solapur')
insert into mailingadress values(1,'ganesh','solapur')
end

exec sp_insert

--but i make some mistake on mailing adrees so only physical record will inserted but
-- we want insert into both table or nothing in any one.
alter procedure sp_insert
as
begin
insert into physicalAdreess values(1,'ganesh','solapur')
insert into mailingadress values(1,'ganesh','solapur solapur solapur')
end

exec sp_insert
select * from physicalAdreess
select * from mailingadress

-- so for that we use transaction.
alter procedure sp_insert
as
begin
begin try
insert into physicalAdreess values(4,'swapnil','solapur')
insert into mailingadress values(4,'swapnil','solapur solapur solapur')
end try
begin catch
 print 'you get error ' 
 end catch

end

sp_insert;

-- so we want all or none

alter procedure sp_insert
as
begin
begin try
begin transaction
insert into physicalAdreess values(6,'rahul','solapur')
insert into mailingadress values(6,'rahul','solapur solapur solapur')
commit
end try
begin catch
rollback
 print 'you get error ' 
 end catch
end

sp_insert;

select * from physicalAdreess
select * from mailingadress