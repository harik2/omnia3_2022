create table depart (
id number ,
nom varchar2(50) not null  ,
constraint pk_depart primary key (id) ,
constraint uniq_nom_depart unique(nom)
)

create table empl(
id INTEGER,
nom varchar2(50) not null  ,
prenom varchar2(60) ,
salaire float ,
com number(4,2) default 0,
dep_id number ,
constraint pk_depart_1 primary key (id) ,
constraint uniq_nom_prenom_emp_1 unique(nom,prenom),
constraint fk_depart_emp_1 foreign key(dep_id) references depart(id) 

)

alter table empl drop column com
alter table empl add com number(4,2) default 0
alter table empl  add constraint ck_slalaire_min check (salaire>=1000)

create sequence sq_depart start with 10 increment by 10
select sq_depart.currval from dual

desc depart


LMD :
-- ajouter un departement : 
insert into depart(id,nom) values(sq_depart.nextval,'ADMIN')
insert into depart values(sq_depart.nextval,'ADMIN')
select * from depart
-- creation de sequence 
create sequence sq_emp start with 1 increment by 1 

insert into empl(id,nom,prenom,salaire,dep_id) values(sq_emp.nextval,'john','doe',2500,40)
-- maj
update empl set dep_id=60 where id=1
alter table empl enable constraint CK_SLALAIRE_MIN 

insert into depart values(sq_depart.nextval,'ADMIN')
select * from depart
create sequence sq_emp start with 1 increment by 1 
alter table empl enable constraint CK_SLALAIRE_MIN 
insert into empl(id,nom,prenom,salaire,dep_id) values(sq_emp.nextval,'Alain','david',400,40)
select * from empl
update empl set salaire=4000 where id=11
--unlock user hr
alter user hr identified by hr  account unlock;

-- emp ayant un salaire entre 5000 and 1000
select * from employees 
where salary between 5000 and 10000

ou
select * from employees 
where salary >= 5000 and salary<= 10000
