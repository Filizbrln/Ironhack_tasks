use sakila;
-- Get release years.
select distinct(release_year) from film;
-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE "ARMAGEDDON%";
-- Get all films which title ends with APOLLO.
select * from film where title like "%APOLLO";
-- Get 10 the longest films.
select title, `length` from film order by `length` desc limit 10;
-- How many films include Behind the Scenes content?
SELECT * FROM film WHERE special_features LIKE "%Behind the Scenes%";
-- Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. Hint: 
-- Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select i.inventory_id from inventory as i inner join customer as c on i.store_id=c.store_id where c.store_id=1;
-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
-- and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer
create table backup_table(
customer_id int, email varchar(250), deleted_date datetime 
);









