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
select p.num_cine, p.num_film, p.pdate
	from projection p, film f
	where p.num_film = f.num_film;

select projection.num_cine, projection.num_film, pdate
	from film left outer join projection
	on film.num_film = projection.num_film; 
	
