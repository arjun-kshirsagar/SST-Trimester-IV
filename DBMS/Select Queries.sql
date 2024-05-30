use sakila;
select * from film;
select * from city;
select * from country;
select * from film_actor;

select title, description from film;
select country_id, country from country;
select title, "title", 100 from film;
select "hello world";


select title, description, length from film; -- only get the title and description as output from table film
select title, description, length/60 from film; -- convert the length in mins to hrs
select title, description, ROUND(length/60, 2) from film; -- ROUND BY Function to round off the output
select title, description, ROUND(length/60, 2) as length_in_hrs from film; -- alias
-- SQL aliases are used to give a table, or a column in a table, a temporary name. 
select title as film_name, description as story, ROUND(length/60, 2) as length_in_hrs from film;

select * from film
ORDER BY title;
--  ORDER BY function helps us to sort using the title in increasing order


select * from film
ORDER BY title desc;
--  ORDER BY function helps us to sort using the title in decreasing order

select title, description, ROUND(length/60, 2) as length_in_hrs from film
ORDER BY title;

-- we can also use alias to sort the database, instad or writing the formula again

select * from film_category ORDER BY category_id;
select title from film ORDER BY rental_duration;
select * from film ORDER BY rental_duration, title;
select title, rental_duration, rating from film ORDER BY rental_duration, rating;
--  the above query is not sorting lexicographically, this is because the datatype of rating is enum and not string

select distinct rental_duration from film;
select distinct rating from film;
select distinct release_year from film;
select distinct rental_duration, rating from film;
select distinct rental_duration from film ORDER BY rental_duration DESC;
select title from film ORDER BY rental_duration DESC;
-- this throws error bcoz we are selecting something but order by something else which we have not selected
select distinct title from film;

select * from film 
where film_id = 100;

select * from film 
where rating = "PG-13";

select * from film 
where rating = "PG-13" OR rating = "R";

select * from film 
where rental_duration = 4 AND rating = "PG-13" 
ORDER BY title;

select * from film
where rating = "NC-17" 
OR (rating = "PG" AND rental_duration = 5);

select * from film
where (rental_duration = 3 or rental_duration = 5) 
-- where (rental_duration = 3 or 0) 0. is condiered to be false and 1 is true
-- where (rental_duration = 3 or 1) 0. is condiered to be false and 1 is true
and (rating= 'NC-17' or rating = 'PG-13');
 
update film set release_year = 2003 where title like "A%";
select * from film ORDER BY rental_duration, title;

