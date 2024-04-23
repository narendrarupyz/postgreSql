-- #Connecting to database
psql - U myuser - d mydatabase - h localhost - p 5432
-- #Creating account table
CREATE TABLE accounts(
    user_id serial PRIMARY KEY,
    username varchar(50) UNIQUE NOT NULL,
    password varchar(50) NOT NULL,
    email varchar(250) UNIQUE NOT NULL,
    created_at timestamp NOT NULL,
    last_login timestamp
);

--  #Use the IF NOT EXISTS option to create the new table only if it does not exist.
-- #To view the accounts table
\d accounts
-- #To drop table
DROP TABLE accounts
-- #creating employees table.
CREATE TABLE employees(
    id serial PRIMARY KEY, first_name varchar(50) NOT NULL, last_name varchar(50), department varchar(50), salary decimal(10, 2)
);

-- #inserting values.
INSERT INTO employees(first_name, last_name, department, salary)
    VALUES ('Navin', 'Kumar', 'Sales', 150000.00),
('Abhinav', 'Singh', 'IT', 50000.00),
('Ravi', 'Raushan', 'HR', 30000.00),
('Gautam', 'Gupta', 'Sales', 23000.00);

-- *Multiple Select Operations.
-- # selecting all employees.
SELECT
    *
FROM
    employees;

-- #using DISTINCT clause, select unique department in employees table.
SELECT DISTINCT
    department
FROM
    employees;

-- #using WHERE clause, selecting employee whom salary is greater than 30000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 30000;

-- #using WHERE clause with AND operator, selecting employee whom salary is greater than 30000 and last name Singh.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 30000
    AND last_name = 'Singh';

-- #using WHERE clause with OR operator, selecting employee whom salary is greater than 30000 or last name Kumar.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 30000
    OR last_name = 'Kumar';

-- #using ORDER BY and LIMIT clause, selecting first_name in ascending order and first 3 record.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    first_name
LIMIT 3
-- #using ORDER BY, OFFSET and LIMIT clause, order by first_name and after 2nd record fetching 3 records.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    first_name offset 2 ROWS
LIMIT 3
-- #using IN operator, finding 3 record whom id is 2,3,4.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    id IN (2, 3, 4);

-- #using BETWEEN operator, finding record whom salray range 15000 to 30000.
SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 15000 AND 30000;

-- #using LIKE operator, finding record whom first_name start with 'R'/ end with 't'.
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE 'R%';

SELECT
    *
FROM
    employees
WHERE
    first_pgsqlname LIKE '%t';

-- #using LIKE operator as wildcard, finding record whom first_name contain 'Ra'/ end with 'am'.
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%Ra%';

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%_am';

-- #using IS NULL operator, finding recod whom last_name is null.
SELECT
    *
FROM
    employees
WHERE
    last_name IS NULL;

