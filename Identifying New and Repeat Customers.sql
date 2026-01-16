create table buyer
(
    orderid INT PRIMARY KEY, 
    orderdate date,
    orderamount  decimal(10,2),
    customer varchar(50)
);
insert into buyer(orderid,orderdate,orderamount,customer)values
    (1, '2024-02-01', 150, 'John Doe'),
    (2, '2024-02-02', 200, 'Jane Smith'),
    (3, '2024-02-05', 99, 'Alice Johnson'),
	(4, '2024-03-01', 155, 'rahul Doe'),
    (5, '2024-03-06', 200, 'amit Smith'),
    (6, '2024-04-01', 959, 'me Johnson'),
	(7, '2024-02-14', 158, 'pran Doe'),
    (8, '2024-02-14', 285, 'jga Smith'),
    (9, '2024-02-15', 929, 'suit Johnson');


	update buyer
	set customer  = 'amit Smith'
	where orderid = 7;

	update buyer
	set customer  = 'Alice Johnson'
	where orderid = 8;

	update buyer
	set customer  = 'Jane Smithh'
	where orderid = 9;

----query---
-------------------------------------
select 
    customer,
    sum(case when name=1 then 1 else 0 end) as newcustomer,
    sum(case when name<>1 then 1 else 0 end) as oldcustomer
from(
        SELECT 
        customer,
        orderdate,
       dense_rank()over(partition by customer order by orderdate)as name
       from buyer
       )as A
       GROUP BY customer;




	   
	select *from buyer


	