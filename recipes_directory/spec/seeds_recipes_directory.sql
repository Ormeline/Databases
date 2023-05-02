-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Maggi special', '20', '4');
INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Chicken fajita', '60', '3');
INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('spag bowl', '15', '2');