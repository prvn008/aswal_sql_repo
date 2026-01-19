CREATE TABLE ProductSpend (
    category VARCHAR(50),
    product VARCHAR(100),
    user_id INT,
    spend DECIMAL(10, 2)
);

INSERT INTO ProductSpend (category, product, user_id, spend) VALUES
('appliance', 'refrigerator', 165, 26.00),
('appliance', 'refrigerator', 123, 3.00),
('appliance', 'washing machine', 123, 19.80),
('electronics', 'vacuum', 178, 5.00),
('electronics', 'wireless headset', 156, 7.00),
('electronics', 'vacuum', 145, 15.00),
('electronics', 'laptop', 114, 999.99),
('fashion', 'dress', 117, 49.99),
('groceries', 'milk', 243, 2.99),
('groceries', 'bread', 645, 1.99),
('home', 'furniture', 276, 599.99),
('home', 'decor', 456, 29.99);

select *from productspend

--find the top 1 product of each category  which have highest spend 
with cte as
      (SELECT 
        category, 
        product, 
        spend,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY spend DESC) AS rn
    FROM productspend)
select category,
       product,
	   spend  
from cte
where rn = 1;
