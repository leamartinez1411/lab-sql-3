/*  Lab SQL 3 */


/*  How many distinct (different) actors' last names are there? */
select count(distinct last_name) from actor;

/*  In how many different languages where the films originally produced? */
select count(distinct sakila.language.name) from sakila.language;

/*  How many movies were not originally filmed in English? */
select count(distinct title) from sakila.film where language_id<>1;

/*  Get 10 the longest movies from 2006.*/
select title, length, release_year 
from film 
where release_year='2006' 
order by length desc 
limit 10;

/*  How many days has been the company operating (check DATEDIFF() function)? */
select datediff(max(last_update), min(payment_date)) 
from payment;

/*  Show rental info with additional columns month and weekday. Get 20. */
select *, month(rental_date) as month_rental_date, weekday(rental_date) wd_rental_date from rental limit 20 ; 

/*  Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. */
select rental_id, rental_date, month(rental_date) as month_rd, weekday(rental_date) as day_rd,
case
when weekday(rental_date)<=4 then 'workday'
else 'weekend' 
end
from rental ; 

/*  How many rentals were in the last month of activity?*/
select count(*) as nbr_rentals from rental where rental_date like '2006-02%';
