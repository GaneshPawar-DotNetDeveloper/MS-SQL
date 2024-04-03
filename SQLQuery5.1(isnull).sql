--create database replaceNullValue
--use replaceNullValue

create table employee(
id int ,
name varchar(40),
managerId int
)
insert into employee values(1,'vishal',3),(2,'ashish',null),(3,'vikul',2),(4,'ganesh',3),(5,'amit',5),(6,'jyoti',1)
--delete from employee
select id,name, managerid from employee

-- so in that table there is ashish have a null value so we can replace that value with some meaningfull sentance



--select emp.name as employeename ,isnull( mrg.name,'boss') as managername
-- from employee emp left join employee mrg
-- on emp.managerId=mrg.id

--select emp.name as employeename ,coalesce( mrg.name,'manager','owner') as managername
-- from employee emp left join employee mrg
-- on emp.managerId=mrg.id

 select emp.name as employeename , 
 (case 
 when mrg.name is null then 'ganesh pawar'
 when mrg.name='vikul' then 'vikul rathod'
 else mrg.name 
 end 
 ) as managername
 from employee emp left join employee mrg
 on emp.managerId=mrg.id


 create table gender(
 id int,
 sex varchar(10)
 )
 insert into gender values(1,'male'),(2,'female'),(3,'male'),(4,'female'),(5,'male'),(6,'male'),(7,null)

 select * from gender

select id, sex,
(case when sex='male' then 'man'
      when sex='female'then 'women'
	  else 'transgender'
	  end
)as changedsex  
  from gender


  -- for update 
  update gender 
  set sex=( case when sex= 'male' then 'man'
                 when sex= 'female' then 'women'
				 else 'notge'
				 end
  )

  select * from gender


