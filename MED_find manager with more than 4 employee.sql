create table managerid (
           Id int primary key,
		   Name varchar(40) not null,
		   deparment varchar(40) not null,
		   manager_id int

);

insert into managerid(Id, Name, deparment, manager_id) values
(1, 'Alice', 'HR', 1),
(2, 'Bob', 'HR', 3),
(3, 'Charlie', 'Finance', 1),
(4, 'Diana', 'Finance', 2),
(5, 'Edward', 'IT', 3),
(6, 'Fiona', 'IT', 4),
(7, 'George', 'IT', 3),
(8, 'Hannah', 'Marketing', 1),
(9, 'Ian', 'Marketing', 2),
(10, 'Jane', 'HR', 4),
(11, 'Karl', 'Finance', 3),
(12, 'Laura', 'Finance', 104),
(13, 'Mike', 'Sales', 101),
(14, 'Nina', 'Sales', 102),
(15, 'Oscar', 'Sales', 103),
(16, 'Pam', 'Marketing', 104),
(17, 'Quinn', 'Marketing', 103),
(18, 'Rachel', 'IT', 102),
(19, 'Steve', 'IT', 101),
(20, 'Tom', 'Sales', 104);

UPDATE managerid
SET manager_id = CASE
    WHEN manager_id = 101 THEN 1
    WHEN manager_id = 102 THEN 2
    WHEN manager_id = 103 THEN 3
    WHEN manager_id = 104 THEN 4
    WHEN manager_id = 105 THEN 5
    ELSE manager_id  -- Keeps the existing manager_id for other cases
END;


select *from managerid e1 inner join managerid e2
on e1.Id= e2.manager_Id



--****************************my code**********************************************8
--***********************************************************************************



with cte as(
      select e1.name AS manager_name,
	         e1.id AS manager_id,
	         count(e2.manager_id) over(partition by e2.manager_id order by e2.manager_id) as employee_count
      from managerid e1 
	  inner join managerid e2 on e1.Id= e2.manager_Id
	  )
SELECT manager_name,
       COUNT(1) AS no_of_employees
FROM cte
WHERE employee_count >= 5
GROUP BY manager_name
ORDER BY no_of_employees DESC;





	  
	  
--******************************************************************************8
---- chatgpt ************************************************************



SELECT e.name AS manager_name, e.id AS manager_id, subquery.employee_count
FROM (
    SELECT manager_id, COUNT(id) AS employee_count
    FROM managerid
    GROUP BY manager_id
    HAVING COUNT(id) > 4
) AS subquery
JOIN managerid e ON e.id = subquery.manager_id;

