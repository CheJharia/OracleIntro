-- find actors who are also directors
select num_ind from play
	intersect
select num_ind from film;

-- numbers of actors and directors
select count(num_ind) from play;
select count(num_ind) from film;

-- individuals that begin with the letter 
-- t or w and the surname is not john

-- using minus operator
select name from individual
	where (lower(name) like 't%' or
	      lower(name) like 'w%')
	minus
	select name from individual
	where lower(surname) like '%john%';
-- not using minus
select name from individual 
	where (lower(name) like 't%' or
	      lower(name) like 'w%') and
	      lower(surname) not like '%john%';
-- note that AND takes precedence over OR
-- so we put () to change the precedence 



-- the director of pulp fiction
select i.name, i.surname, f.title
	from individual i, film f
	where i.num_ind = f.num_ind 
		  and
		  lower(f.title) like '%pulp%';
select name, surname 
	from individual 
	where num_ind =(
		select num_ind 
			from film 
			where lower(title) like '%pulp%');



-- films by Lars Von Trier
select f.title
	from individual i, film f
	where i.num_ind = f.num_ind 
		  and
		  lower(name) = 'von trier'
		  and 
		  lower(surname) = 'lars';

select title 
	from film 
	where num_ind = (
		select num_ind 
			from individual 
			where lower(name) = 'von trier' and 
		  		  lower(surname) = 'lars');




-- films screened in 2002
select distinct f.title
	from film f, projection p
	where f.num_film = p.num_film
	      and
	      to_date(p.pdate,'DD/MM/YYYY') like '%2002';

select title
	from film
	where num_film in (
		select distinct num_film 
		from projection 
		where to_date(pdate,'DD/MM/YYYY') like '%2002');




-- never played in dramatic film

select name, surname from individual
	where num_ind in (
		select p.num_ind	
			from film f, play p
			where p.num_film = f.num_film
			minus
			select p.num_ind
			from film f, play p
			where p.num_film = f.num_film 
				  and
				  lower(f.kind) = 'drame');




-- at least in one non-dramatic film
-- in other words, other film except drama





-- films in which nicole kidman played a role
-- and were screened at Fontenelle

select distinct f.title
	from individual i,
		 play p,
		 projection pr,
		 film f
    where i.num_ind = p.num_ind
          and
          i.num_ind = (select num_ind from individual where lower(name) = 'kidman')
          and
          p.num_film = pr.num_film 
          and
          pr.num_cine = (select num_cine from cinema where lower(name) = 'le fontenelle')
          and
          p.num_film = f.num_film;



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

-- invent 5 queries



