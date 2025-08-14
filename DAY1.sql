create database day1;
use day1;

create table departments (
deptid int primary key,
deptname varchar(20)
);

create table employee (
emp_id int primary key,
empname varchar(20),
deptid int,
salary int,
hiredate date,
foreign key (deptid) references departments (deptid)
);

insert into departments values
(1,'HR'),
(2,'IT'),
(3,'SALES');
select * from departments;

insert into employee values
(101,'john',1,50000,'2018-02-12'),
(102,'alice',2,60000,'2019-07-10'),
(103,'bob',1,55000,'2020-05-05'),
(104,'carol',3,45000,'2017-09-20');
select * from employee;
---------------------------------------------------------------------------------------------
1.select * from employee;

2.select empname,salary from employee;

3.select e.empname,d.deptname from employee e
join departments d on e.deptid=d.deptid
where deptname='it';

4.select empname from employee where salary>50000;

5.select empname from employee where hiredate<'2020-01-01'; 

6.select empname,salary from employee order by salary desc;

7.select count(empname) from employee;

8.select avg(salary) from employee;

9.select max(e.salary),d.deptname from employee e
join departments d on e.deptid=d.deptid
group by d.deptname;

10.select d.deptname,count(e.empname) from employee e
join departments d on e.deptid=d.deptid
group by d.deptname
having count(e.empname)>1;