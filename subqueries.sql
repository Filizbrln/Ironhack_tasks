use sakila;
-- Lab | SQL Subqueries
-- How many copies of the film Hunchback Impossible exist in the inventory system?
select count(film_id) from inventory where film_id= (select film_id from film where title="Hunchback Impossible");
-- List all films whose length is longer than the average of all the films.
select avg(`length`) from film;
select film_id, title from film where `length`>(select avg(`length`) from film);
-- Use subqueries to display all actors who appear in the film Alone Trip.
select film_id from film where title="Alone Trip";
select actor_id from film_actor where film_id=(select film_id from film where title="Alone Trip");
select concat(first_name, "   ", last_name) as full_name from actor where actor_id in (select actor_id from film_actor where film_id=(select film_id from film where title="Alone Trip"));
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.
select category_id from category where `name`="Family";
select film_id from film_category where category_id=(select category_id from category where `name`="Family"); 
SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id = (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    `name` = 'Family'));
-- Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, 
-- you will have to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.
select country_id from country where country="Canada";
select city_id from city where country_id=(select country_id from country where country="Canada");
SELECT 
    address_id
FROM
    address
WHERE
    city_id IN (SELECT 
            city_id
        FROM
            city
        WHERE
            country_id = (SELECT 
                    country_id
                FROM
                    country
                WHERE
                    country = 'Canada'));

select first_name, last_name, email from customer where address_id in (SELECT 
    address_id
FROM
    address
WHERE
    city_id IN (SELECT 
            city_id
        FROM
            city
        WHERE
            country_id = (SELECT 
                    country_id
                FROM
                    country
                WHERE
                    country = 'Canada')));
                    
-- Which are films starred by the most prolific actor? 
-- Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id 
-- to find the different films that he/she starred.
select actor_id from film_actor group by actor_id order by count(film_id) desc limit 1;
select film_id from film_actor where actor_id = (select actor_id from film_actor group by actor_id order by count(film_id) desc limit 1);
SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_actor
        WHERE
            actor_id = (SELECT 
                    actor_id
                FROM
                    film_actor
                GROUP BY actor_id
                ORDER BY COUNT(film_id) DESC
                LIMIT 1)); 
                
-- Films rented by most profitable customer. 
-- You can use the customer table and payment table to find the most profitable customer ie the customer 
-- that has made the largest sum of payments.
select customer_id from payment group by customer_id order by sum(amount) desc limit 1;
select inventory_id from rental where customer_id=526;
select film_id from inventory where inventory_id in (select inventory_id from rental where customer_id=526);
SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            inventory
        WHERE
            inventory_id IN (SELECT 
                    inventory_id
                FROM
                    rental
                WHERE
                    customer_id = 526));
                    
 -- Customers who spent more than the average payments.
 select  avg(amount) from payment;
 select distinct(customer_id) from payment where amount>(select  avg(amount) from payment);
 
 
