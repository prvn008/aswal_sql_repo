
CREATE TABLE Flights (
cust_id INT,
flight_id VARCHAR(10),
origin VARCHAR(50),
destination VARCHAR(50)
);
INSERT INTO Flights (cust_id, flight_id, origin, destination)
VALUES (1, 'SG1234', 'Delhi', 'Hyderabad'),
(1, 'SG3476', 'Kochi', 'Mangalore'),
(1, '69876', 'Hyderabad', 'Kochi'),
(2, '68749', 'Mumbai', 'Varanasi'),
(2, 'SG5723', 'Varanasi', 'Delhi');
select *from Flights

SELECT 
f1.cust_id, 
        f1.origin AS first_origin, 
        f2.destination AS final_destination
    FROM Flights f1
    LEFT JOIN Flights f2 
	ON f1.cust_id = f2.cust_id AND f1.destination = f2.origin




--without joins
SELECT 
    cust_id,
    (SELECT origin FROM Flights f1 
     WHERE f1.cust_id = f.cust_id 
     AND origin NOT IN (SELECT destination FROM Flights WHERE cust_id = f1.cust_id) 
     LIMIT 1) AS first_origin,

	  (SELECT destination FROM Flights f2 
     WHERE f2.cust_id = f.cust_id 
     AND destination NOT IN (SELECT origin FROM Flights WHERE cust_id = f2.cust_id) 
     LIMIT 1) AS final_destination

FROM Flights f
GROUP BY cust_id ;
