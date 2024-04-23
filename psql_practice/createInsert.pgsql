-- #Connecting to database
psql -U myuser -d mydatabase -h localhost -p 5432

-- #Creating account table
Create table accounts (user_id serial primary key,
 username varchar(50) unique not null,
 password varchar(50) not null,
 email varchar(250) unique not null,
 created_at timestamp not null,
 last_login timestamp);
 
--  #Use the IF NOT EXISTS option to create the new table only if it does not exist.

-- #To view the accounts table
 \d accounts

-- #To drop table
drop table accounts

-- #creating employees table.
 create table employees(id serial primary key, 
 first_name varchar(50) not null,
 last_name varchar(50),
 department varchar(50), 
 salary decimal(10,2));
 
-- #inserting values.
 insert into employees(first_name, last_name, department, salary) 
 values('Navin', 'Kumar', 'Sales', 150000.00),
 ('Abhinav','Singh','IT',50000.00),
 ('Ravi','Raushan','HR',30000.00),
 ('Gautam','Gupta','Sales',23000.00)
 ;