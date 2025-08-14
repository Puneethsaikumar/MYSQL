11.select * from employee where empname like 'A%';

12.select * from employee where salary between 45000 and 60000;

13.select e.empname,d.deptname from employee e
join departments d on e.deptid=d.deptid;

14.select d.deptname,count(e.empname) from employee e
join departments d on e.deptid=d.deptid
group by deptname;

15.select e.empname,d.deptname from employee e
left join departments d on e.deptid=d.deptid;