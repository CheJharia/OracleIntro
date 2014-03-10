--
--
--  NAME
--    td8_views.sql;
--
-- DESCRIPTION
--   Practical Work 8: Views
--  USAGE
--       SQL> START <filepath>td8_views.sql

-- ## Tips ##
-- list all the available views
select view_name from user_views;


-- 1. Directors of drama films
-- a) create a view for directors of drama films with their name, surname,
--    the title and the year of films
-- b) verify its contents with a select

-- a)
create or replace view directors_drama_films as
	select i.surname, i.name, f.title, f.fyear
	from film f, individual i
	where f.num_ind = i.num_ind
		and lower(f.kind) = 'drame';
-- b)
select * from directors_drama_films;

-- 2) Films of the 902
-- a) create a view that allows updating the column year of the film table.
-- We only want the films of the 90s;

create or replace view films_from_the_90s as
	select * 
	from film
	where fyear like '199%';
-- b) check the contents of the view with a select
select * from films_from_the_90s;

-- c) verify that you can change the year of the movies Pulp Fiction to 2000
update films_from_the_90s set fyear = '2000' where title = 'Pulp Fiction';

-- d) perfom a select on the view, and we see that ...
select * from films_from_the_90s;
-- we see that the film disappears from the view

-- e) change the year back to 1994
update film set fyear = '1994' where title = 'Pulp Fiction';

-- f) Give a solition that allows updating the years of films by
--    checking if the entry year is between 1990 and 1999. 
--    Try to update the film Crash by putting the year value to 2010.

-- modification to the definition of the view to
--  allow with check option constraint;
create or replace view films_from_the_90s as
	select * 
	from film
	where fyear >= 1900 and fyear <= 1999
	with check option 
	constraint film_90s;

update films_from_the_90s set fyear = '2010' where title = 'Crash';
-- now we can't update because of the 'with check option' clause inside
--  the definition of the view films_from_the_90s

