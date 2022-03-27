select  d.* from departments d join locations l on d.location_id=l.location_id

 where d.department_id not >= any(

select  department_id from employees where job_id = 'SA_REP' and department_id is not null

)


create view depa_no_sa_rep as  
select distinct  d.department_id , d.department_name, d.location_id,e.job_id from departments d
 join employees e on d.department_id = e.department_id
join locations l on l.location_id=d.location_id
where e.job_id != 'SA_REP'
select * from depa_no_sa_rep


select d.department_id, d.department_name , count(e.employee_id)  from departments d join employees e on d.department_id=e.department_id

group by d.department_id, d.department_name

having count(e.employee_id) =( select max(count(e.employee_id) ) from departments d join employees e on d.department_id=e.department_id

group by d.department_id, d.department_name
)


select d.department_id, d.department_name , count(e.employee_id)  from departments d join employees e on d.department_id=e.department_id

group by d.department_id, d.department_name

having count(e.employee_id) <3
 =( select (count(e.employee_id) ) from departments d join employees e on d.department_id=e.department_id

group by d.department_id, d.department_name
)

select * from (
select  to_char(hire_date,'yyyy') as annee, count(*) as  nombre, max(salary) as  max,min(salary) as min from employees e
group by  to_char(hire_date,'yyyy') 
)  

where min>5000

select c.country_name, count(location_id) from locations l
join countries c on l.country_id = c.country_id 
group by c.country_name

select * from (
select country_id, count(location_id)  from locations
group by country_id
having count(location_id) >= any (select max(count(location_id)) from locations
group by country_id)
)


create table managers as select employee_id,first_name,last_name from employees where employee_id in (
select manager_id from departments
)

select * from managers
view = table logique liee a une requete select 

create view vmanagers as  select employee_id,first_name,last_name from employees where employee_id in (
select manager_id from departments
)
select * from vmanagers
