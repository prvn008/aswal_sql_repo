select *from employees;
select *from product;
select *from student;
-->> studentt able view , modified column name from student_id to ID
select *from studentt;

-->> ALTER MEANS ADD NEW COLUMN ,HERE WE ADD TWO NEW COLUMN MARKS AND GRADES
ALTER TABLE studentt
          ADD marks INT, 
          ADD grade VARCHAR(2);
-->>modified column name from student_id to ID
ALTER TABLE STUDENTT
RENAME COLUMN student_id TO ID;


-->> ADD VALUES IN NEW COLUMN MARKS AND GRADE IN STUDENTT TABLE
UPDATE studentt
SET marks = CASE 
                WHEN ID = 1 THEN 85
                WHEN ID = 2 THEN 78
                WHEN ID = 3 THEN 92
                WHEN ID = 4 THEN 64
                WHEN ID = 5 THEN 88
                WHEN ID = 6 THEN 73
                WHEN ID = 7 THEN 91
                WHEN ID = 8 THEN 80
            END,
    grade = CASE
                WHEN ID = 1 THEN 'A'
                WHEN ID = 2 THEN 'B'
                WHEN ID = 3 THEN 'A'
                WHEN ID = 4 THEN 'C'
                WHEN ID = 5 THEN 'A'
                WHEN ID = 6 THEN 'B'
                WHEN ID = 7 THEN 'A'
                WHEN ID = 8 THEN 'B'
                
            END
WHERE ID IN (1, 2, 3, 4, 5, 6, 7, 8);
--QUERY ******************
SELECT 
     case
         when grade >= 8 then first_name
		 else 'null'
		 end as first_name,
		 grade,
		 marks,
		 from studentt
		 order by grade desc,
		        when grade >= 8
				else marks,
				end asc;

--*************************************************************************************************
--**************************QUESTION 1 HACKER RANK  **********************************************
--select concat(first_name, '(',left(student,1),')')
SELECT CONCAT(first_name, '(', SUBSTRING(first_name, 1, 1), ')')
from student
order by first_name;

SELECT CONCAT(first_name, '(', SUBSTRING(first_name FROM 1 FOR 4), ')')
FROM student
ORDER BY first_name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(brand), '.') 
FROM product 
GROUP BY brand 
ORDER BY COUNT(*) ASC, LOWER(brand);
--**************************************** END ******************************************************
--*************************************** THANKS *************************************************

