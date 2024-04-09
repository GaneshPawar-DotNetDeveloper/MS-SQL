create database TriggerCommands
use TriggerCommands

-- 1. firstly i want to get trigger on create command
-- means me is database me jab bhi create query fire karunga tab vo trigger bhi automatically fire honi chahiye.

create trigger tr_database
on database
for create_table
as
begin
print 'database trigger fired'
end

create table ablsjnw(id int)

drop trigger tr_database

create trigger tr_database
on all server  -- this is server scoped trigger
for create_table
as
begin
print 'database trigger fired'
end

create trigger tr_EventDataFunction
on all server  -- this is server scoped trigger
for create_table,alter_table,drop_table
as
begin
select Eventdata()
end














