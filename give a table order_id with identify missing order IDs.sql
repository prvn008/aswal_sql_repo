CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE
);
INSERT INTO orders (order_id, order_date) VALUES
(1, '2024-07-01'),
(2, '2024-07-02'),
(3, '2024-07-03'),
(5, '2024-07-05'),
(6, '2024-07-06'),
(7, '2024-07-07'),
(9, '2024-07-09'),
(10, '2024-07-10'),
(11, '2024-07-11'),
(13, '2024-07-13'),
(14, '2024-07-14'),
(15, '2024-07-15'),
(16, '2024-07-16'),
(18, '2024-07-18'),
(19, '2024-07-19'),
(20, '2024-07-20');
select *from orders

--give a table order_id with identify missing order IDs
