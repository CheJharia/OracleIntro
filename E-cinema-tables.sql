drop table play;
drop table projection;
drop table film;
drop table individual;
drop table cinema; 


create table individual(
num_ind number constraint pk_individual primary key,
name varchar2(30),
surname varchar2(30));

create table film(
num_film number constraint pk_film primary key,
num_ind constraint fk_film references individual(num_ind),
title varchar2(60),
kind varchar2(20),
fyear number(4));

create table play(
num_ind constraint fk1_play references individual(num_ind),
num_film constraint fk2_play references film(num_film),
role varchar2(30),
constraint pk_play primary key (num_ind,num_film));

create table cinema(
num_cine number constraint pk_cinema primary key,
name varchar2(30),
address varchar2(50));

create table projection(
num_cine constraint fk1_projection references cinema(num_cine),
num_film constraint fk2_projection references film(num_film),
pdate date,
constraint pk_projection primary key (num_cine,num_film,pdate));

insert into individual values(01,'Kidman','Nicole'); 
insert into individual values(02,'Bettany','Paul');
insert into individual values(03,'Watson','Emily'); 
insert into individual values(04,'Skarsgard','Stellan'); 
insert into individual values(05,'Travolta','John'); 
insert into individual values(06,'L. Jackson','Samuel'); 
insert into individual values(07,'Willis','Bruce');
insert into individual values(08,'Irons','Jeremy');
insert into individual values(09,'Spader','James');
insert into individual values(10,'Hunter','Holly'); 
insert into individual values(11,'Arquette','Rosanna'); 
insert into individual values(12,'Wayne','John');
insert into individual values(13,'von Trier','Lars'); 
insert into individual values(14,'Tarantino','Quentin'); 
insert into individual values(15,'Cronenberg','David'); 
insert into individual values(16,'Mazursky','Paul'); 
insert into individual values(17,'Jones','Grace');
insert into individual values(18,'Glen','John');

insert into film values(05,13,'Dogville','Drame',2002);
insert into film values(04,13,'Breaking the waves','Drame',1996);
insert into film values(03,14,'Pulp Fiction','Policier',1994);
insert into film values(02,15,'Faux-Semblants','Epouvante',1988);
insert into film values(01,15,'Crash','Drame',1996);
insert into film values(06,12,'Alamo','Western',1960);
insert into film values(07,18,'Dangereusement vôtre','Espionnage',1985);

insert into play values(01,05,'Grace');
insert into play values(02,05,'Tom Edison'); 
insert into play values(03,04,'Bess');
insert into play values(04,04,'Jan');
insert into play values(05,03,'Vincent Vega');
insert into play values(06,03,'Jules Winnfield');
insert into play values(07,03,'Butch Coolidge');
insert into play values(08,02,'Beverly "&" Elliot Mantle');
insert into play values(09,01,'James Ballard');
insert into play values(10,01,'Helen Remington');
insert into play values(11,01,'Gabrielle');
insert into play values(04,05,'Chuck');
insert into play values(16,07,'May Day');

insert into cinema values(02,'Le Fontenelle','78160 Marly-le-Roi');
insert into cinema values(01,'Le Renoir','13100 Aix-en-Provence');
insert into cinema values(03,'Gaumont Wilson','31000 Toulouse');
insert into cinema values(04,'Espace Cine','93800 Epinay-sur-Seine');

alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

insert into projection values(02,05,'01/05/2002');
insert into projection values(02,05,'02/05/2002');
insert into projection values(02,05,'03/05/2002');
insert into projection values(02,04,'02/12/1996');
insert into projection values(01,01,'07/05/1996');
insert into projection values(02,07,'09/05/1985');
insert into projection values(01,04,'02/08/1996');
insert into projection values(04,03,'08/04/1994');
insert into projection values(03,06,'02/12/1990');
insert into projection values(02,02,'25/09/1990');
insert into projection values(03,03,'05/11/1994');
insert into projection values(04,03,'06/11/1994');
insert into projection values(01,06,'05/07/1980');
insert into projection values(02,04,'02/09/1996');
insert into projection values(04,06,'01/08/2002');
insert into projection values(03,06,'09/11/1960');
insert into projection values(01,02,'12/03/1988');

commit;