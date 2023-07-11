
use employee;
select * from data_science_team;
select *from  emp_record_table;
select * from proj_table;

select emp_id,first_name,last_name,gender,dept from emp_record_table;
select emp_id,first_name,last_name,gender,dept,emp_rating from emp_record_table where emp_rating < 2;
select emp_id,first_name,last_name,gender,dept,emp_rating from emp_record_table where emp_rating > 4;
select emp_id,first_name,last_name,gender,dept,emp_rating from emp_record_table where emp_rating between 2 and 4;

select concat(first_name,' ',last_name) as Alias,dept from emp_record_table where dept = "Finance";
select * from proj_table;

SELECT m.emp_id, m.first_name, m.last_name,m.role,m.exp ,count(e.emp_id) as "emp_count"
FROM emp_record_table m
Inner JOIN emp_record_table m ON m.emp_id = e.manager_id
GROUP BY m.emp_id;

SELECT m.EMP_ID,m.FIRST_NAME,m.LAST_NAME,m.ROLE,
m.EXP,COUNT(e.EMP_ID) as "EMP_COUNT"
FROM emp_record_table m
INNER JOIN emp_record_table e
ON m.EMP_ID = e.MANAGER_ID
GROUP BY m.EMP_ID
ORDER BY m.EMP_ID;

select first_name,last_name,dept from emp_record_table where dept ="Healthcare"
union
select first_name,last_name,dept from emp_record_table where dept ="Finance";

select emp_id,first_name,last_name,role,dept,max(emp_rating) from emp_record_table group by dept,emp_rating,first_name,last_name,role,emp_id;
select max(emp_rating),dept from emp_record_table group by dept;

SELECT  m.EMP_ID,m.FIRST_NAME,m.LAST_NAME,m.ROLE,m.DEPT,m.EMP_RATING,max(m.EMP_RATING)
OVER(PARTITION BY m.DEPT)
AS "MAX_DEPT_RATING"
FROM emp_record_table m
ORDER BY DEPT;


select max(salary),min(salary) ,role from emp_record_table group by role;
select min(salary),role from emp_record_table group by role;

select first_name,exp,rank() over(order by exp desc) as 'rank 'from emp_record_table;

select first_name,dept,exp from emp_record_table where exp > 10;
call employee.new_procedure();

create view emp_details as
select first_name,country,salary from emp_record_table where salary > 6000;

select * from emp_details;
SELECT EMP_ID,FIRST_NAME,LAST_NAME,EXP FROM emp_record_table
WHERE EMP_ID IN(SELECT manager_id FROM emp_record_table);

create index idx_first_name
on emp_record_table(first_name(20));
select * from emp_record_table where first_name = "Eric";
set sql_safe_updates=0;


update  emp_record_table set Bonus=(select Salary + (select salary*.05*Emp_rating));
select * from emp_record_table;
select emp_id,(0.05*salary*emp_rating) as bonus from emp_record_table;

select avg(salary),country,continent from emp_record_table group by country,continent;
















