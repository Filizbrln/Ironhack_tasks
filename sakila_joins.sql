use sakila;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query
select count(f.film_id), c.name from film as f inner join film_category as fc on f.film_id = fc.film_id inner join category as c on fc.category_id = c.category_id group by fc.category_id;
-- Which actor has appeared in the most films?
SET sql_mode = '';
SELECT concat(a.first_name, ' ', a.last_name) as "actor name", count(fa.film_id)  from film as f inner join film_actor as fa on f.film_id=fa.film_id inner join actor as a on fa.actor_id=a.actor_id group by fa.actor_id order by count(fa.film_id) desc limit 1;
-- Most active customer (the customer that has rented the most number of films)
select concat(c.first_name, ' ', c.last_name) as full_name, count(r.rental_id) from rental as r inner join customer as c on r.customer_id=c.customer_id group by c.customer_id order by count(r.rental_id) desc limit 1;
select customer_id from customer where first_name = "ELEANOR" and last_name = "HUNT";
select count(rental_id) from rental where customer_id = 148;
-- List number of films per category.
select count(fc.film_id), c.`name` from film as f inner join film_category as fc on f.film_id = fc.film_id inner join category as c on fc.category_id = c.category_id group by fc.category_id;
-- Display the first and last names, as well as the address, of each staff member.
use sakila;
select concat(s.first_name, ' ', s.last_name) as full_name, a.address from staff as s left join address as a on s.address_id=a.address_id group by s.staff_id;
-- Display the total amount rung up by each staff member in August of 2005.
use sakila;
select s.staff_id, sum(p.amount) from payment as p inner join staff as s on p.staff_id=s.staff_id where p.payment_date>= '2005-08-01 00:00:00.000'and p.payment_date<'2005-09-01 00:00:00.000'group by s.staff_id;
-- List each film and the number of actors who are listed for that film.
select fa.film_id, f.title, count(fa.actor_id) from film as f inner join film_actor as fa on f.film_id=fa.film_id inner join actor as a on fa.actor_id=a.actor_id group by fa.film_id;
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name. 
SELECT 
    CONCAT(c.first_name, '  ', c.last_name) AS full_name,
    SUM(p.amount)
FROM
    customer AS c
        INNER JOIN
    payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;
-- Lab | SQL Joins on multiple tables
-- Write a query to display for each store its store ID, city, and country.
SELECT 
    CONCAT(s.store_id, '-', c.city, '-', co.country) AS 'Store Information'
FROM
    store AS s
        LEFT JOIN
    address AS a ON s.address_id = a.address_id
        LEFT JOIN
    city AS c ON c.city_id = a.city_id
        LEFT JOIN
    country AS co ON c.country_id = co.country_id
GROUP BY s.store_id;
-- Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as total_amount from store as s inner join customer as c on s.store_id=c.store_id inner join payment as p on p.customer_id=c.customer_id group by s.store_id order by s.store_id;





