--
--
--  NAME
--    td6_queries.sql;
--
-- DESCRIPTION
--   Practical Work 6: SQL queries
--  USAGE
--       SQL> START <filepath>td6_queries.sql

-- 1 the titles of movies that have the same kind and the same year as 'Crash'
select *
	from film f
	where f.kind = (select kind from film where lower(title) = 'crash')
		and f.fyear = (select fyear from film where lower(title) = 'crash')
		and lower(title) != 'crash';

select * 
	from film f
	where (kind, fyear) = 
		(select kind, fyear
			from film
			where lower(title) = 'crash'
		)
		and lower(title) != 'crash';

-- film whose release year is greater than or equal to years of the projection of different movies
select f.title,f.fyear 
	from film f
	where f.fyear >= all(select to_char(pdate,'YYYY') from projection);

-- how many movies played by nicole kidman
select count(p.num_film) as kidman_num_of_film
	from individual i, play p
	where i.num_ind = p.num_ind 
		  and 
		  lower(i.name) = 'kidman';

-- first screening of pulp fiction
select f.title, min(pr.pdate) as first_screening
	from film f,
		 projection pr
    where f.num_film = pr.num_film
    	  and
    	  lower(f.title) like '%pulp%'
    group by f.title;

-- how many  movies per actor
select i.name, i.surname, count(p.num_ind) as numberOfFilms
	from play p, individual i
	where p.num_ind = i.num_ind
	group by i.name, i.surname;

-- actors with more than 1 movie
select i.name, i.surname, count(p.num_ind) as numberOfFilms
	from play p, individual i
	where p.num_ind = i.num_ind
	group by i.name, i.surname
	having count(p.num_ind) > 1; -- having clause should be after "group by"
								 -- because it is applied to "group by"

-- film name and oldest projection
select f.title, min(p.pdate)
	from film f, projection p
	where f.num_film = p.num_film
	group by f.title; 