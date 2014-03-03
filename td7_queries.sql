--
--
--  NAME
--    td7_queries.sql;
--
-- DESCRIPTION
--   Practical Work 7: SQL queries
--  USAGE
--       SQL> START <filepath>td7_queries.sql

-- count the number of projections of each film, including films that have not been projected

select f.num_film, f.title, count(f.num_film) as NumberOfProjections
	from film f, projection p
	where f.num_film = p.num_film(+)
	group by f.num_film, f.title;

-- name and surname ranked from best to worst actor
select i.name, i.surname, count(num_film)
	from individual i, play p
	where i.num_ind = p.num_ind(+)
	group by i.name, i.surname
	order by count(num_film) desc;

-- individuals played in all movies
select i.name, i.surname, count(p.num_film) as numberOfFilms
	from play p, individual i
	where p.num_ind = i.num_ind
	group by i.num_ind, i.name, i.surname
	having count(p.num_film) = 
			(select count(*) 
			from film);


-- individuals played in all films of Lars von Trier
select i.name, i.surname
	from individual i, play p, film f
	where i.num_ind = p.num_ind
		and p.num_film = f.num_film
		and f.num_film IN ( select num_film
						from film f, individual i 
						where f.num_ind = i.num_ind 
							and i.name = 'von Trier' 
							and i.surname = 'Lars')
		group by i.num_ind, i.name, i.surname
		having count (distinct f.num_film) = 
				(select count(*)
				from film NATURAL JOIN individual
				where name = 'von Trier' 
				and surname = 'Lars');


-- actors played in a number of films that is greteer than the average number
select i.name, i.surname, count(p.num_film) as numberOfFilms
	from play p, individual i
	where p.num_ind = i.num_ind
	group by i.num_ind, i.name, i.surname
	having count(p.num_film) > 
			(select avg(count(num_film))
			from play
			group by num_ind
			);

-- cinemas that have projected movies in which Nicole Kidman has played

select c.name
	from cinema c, projection p, individual i, play pl
	where c.num_cine = p.num_cine
		and p.num_film = pl.num_film
		and pl.num_ind = i.num_ind
		and lower(i.name) = 'kidman'
		and lower(i.surname) = 'nicole'
		group by c.name, c.num_cine
		having count(distinct p.num_film) 
				= (select count (num_film)
				    from individual i, play p
				    where i.num_ind = p.num_ind
				    and lower(name) = 'kidman' and lower(surname) = 'nicole');

-- next week MCD (at least 5)

-- TG316 for question
















