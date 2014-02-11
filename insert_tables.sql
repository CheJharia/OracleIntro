-- Practical Work 4 : Data Manipulation Language
-- DML


insert into customer values(1, 'Jean Dupont', '1 avenue du parc Cergy', 95011);
insert into customer values(2, 'Philippe Martin', '35 Champ Elysees Paris', 75008);
insert into customer values(3, 'Dupond Pierre', '35 rue st honore fontainebleau', 7730);
insert into customer values(4, 'Dupond François', '35 rue st honore fontainebleau', 7730);
insert into product values(1, 'Evian 2lx6',4000, 2.99);
insert into product values(2, 'Lu Cracotte Framboise',800, 3.99);
insert into product values(3, 'Nectar de Mangue', 4000, 2);
insert into product values(4, 'Contrex',0, 2);	


-- exercice 1
-- 1
insert into customer values(5, 'Jean Dupont', '1 avenue du parc Cergy', 95011);
insert into customer values(6, 'Philippe Martin', '35 Champ Elysees Paris', 75008);
insert into customer values(7, 'Philippe Martin', '35 Champ Elysees Paris', 75008);

-- 2
insert into corder values(1, to_date('30/08/2008', 'DD/MM/YYYY'), 2);
insert into corder(id, id_customer) values(2, 5); --  by default the today's date

insert into corder_item values( 1,1 ,1 ,1 ,5 );
 
-- violating num_item unique constraint 
--insert into corder_item values( 2,1 ,1 ,2 ,53 );

-- violating integrity constaint - parent key not found
-- insert into corder_item values( 3,5 ,2 ,1 ,7 );


update customer set zipcode = 77305 where address = '35 rue st honore fontainebleau';

delete from product where label like '%Cracotte%';
delete from customer where name like 'Dupond%';

select stock from product where lower(label) like '%nectar%' ;

select name from customer where name not like '%e%';

select name from customer where lower(name) like 'p%';

select * from product order by price desc;

select label,stock*price as total_price from product;
select sum(stock*price) as sum_prices from product;
select avg(price) as average_price from product;
select max(price) as most_expensive from product;
select * from corder where to_date(odate,'YYYY') = '2007';
select * from product where price in (select price from product where lower(label) like '%mangue%');
select * from corder where to_date(odate, 'DD/MM/YYYY') like '%08';


select * from product where price > (select avg(price) from product);
select * from product where price > avg(price);