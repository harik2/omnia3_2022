--- les jointures externes : 
liste des department_name et first_name et last_name
select d.department_name , e.first_name , e.last_name from employees e  join  departments d on e.department_id=d.department_id

liste de TOUS LES DEPARTEMENT department_name et leurs EVENTUELS EMPLOYEES first_name et last_name 
=> LES JOINTURES EXTERNES 
select d.department_name , e.first_name , e.last_name from employees e RIGHT  join  departments d on e.department_id=d.department_id
LISTE DE TOUS LES EMPLOYES ET LEURS EVENTUELS DEPARTEMENTs 
select d.department_name , e.first_name , e.last_name from employees e full OUTER  join  departments d on e.department_id=d.department_id

select d.department_name , e.first_name , e.last_name from employees e , departments d 
where  e.department_id=d.department_id(+)
