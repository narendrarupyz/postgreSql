-- #PostgreSQL supports inner join, left join, right join, full outer join, cross join, natural join,
--  and a special kind of join called self-join.
-- # creating products AND orders table.
-- #products
CREATE TABLE products(
    id serialpgsql PRIMARY KEY,
    name varchar(40) NOT NULL,
    price decimal(10, 2) NOT NULL,
    category_id int
);

-- #orders
CREATE TABLE orders(
    id serial PRIMARY KEY,
    product_id int,
    quantity int,
    total_price decimal(10, 2),
    order_date date,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- #insert values for products
INSERT INTO products(name, price, category_id)
    VALUES ('mouse', 650.00, 001),
('headphone', 800.00, 002),
('smartwatch', 5600.00, 003),
('laptop', 45500.00, 004),
('speaker', 3000.00, 005),
('bike', 100000.00, 006);

-- #insert values for orders
INSERT INTO orders(product_id, quantity, total_price, order_date)
    VALUES (1, 2, 1300.00, '2024-04-23'),
(2, 1, 800.00, '2024-04-22'),
(3, 3, 16800.00, '2024-04-21'),
(4, 1, 45500.00, '2024-04-17'),
(5, 4, 12000.00, '2024-04-15'),
(6, 1, 100000.00, '2024-04-16');

-- #inner join return only matched data from both table.
SELECT
    o.id AS order_id,
    p.name AS product_name,
    p.price AS product_price,
    o.quantity AS order_quantity,
    o.total_price AS order_total_price,
    o.order_date AS order_order_date
FROM
    orders o
    INNER JOIN products p ON o.product_id = p.id;

--#left join: return all data from left table and matched data from right table.
SELECT
    o.id AS order_id,
    p.name AS product_name,
    p.price AS product_price,
    o.quantity AS order_quantity,
    o.total_price AS order_total_price,
    o.order_date AS order_order_date
FROM
    products p
    LEFT JOIN orders o ON p.id = o.product_id;

--left join with where clause, return data based on price is greater than 5000.
SELECT
    o.id AS order_id,
    p.name AS product_name,
    p.price AS product_price,
    o.quantity AS order_quantity,
    o.total_price AS order_total_price,
    o.order_date AS order_order_date
FROM
    products p
    LEFT JOIN orders o ON p.id = o.product_id
WHERE
    p.price > 5000;

--RIGHT JOIN(with where clause): return all data from right table and matched from left table.
SELECT
    o.id AS order_id,
    p.name AS product_name,
    p.price AS product_price,
    o.quantity AS order_quantity,
    o.total_price AS order_total_price,
    o.order_date AS order_order_date
FROM
    products p
    RIGHT JOIN orders o ON p.id = o.product_id where p.price >5000;

--Full OUTER JOIN : return all data from both table either matched or not.
SELECT
    o.id AS order_id,
    p.name AS product_name,
    p.price AS product_price,
    o.quantity AS order_quantity,
    o.total_price AS order_total_price 
FROM                                
    products p
    FULL OUTER JOIN orders o ON p.id = o.product_id;
    
order_id | product_name | product_price | order_quantity | order_total_price 
----------+--------------+---------------+----------------+-------------------
        1 | mouse        |        650.00 |              2 |           1300.00
        2 | headphone    |        800.00 |              1 |            800.00
        3 | smartwatch   |       5600.00 |              3 |          16800.00
        4 | laptop       |      45500.00 |              1 |          45500.00
        5 | speaker      |       3000.00 |              4 |          12000.00
        6 | bike         |     100000.00 |              1 |         100000.00
