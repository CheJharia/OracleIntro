--
-- Copyright (c) Oracle Corporation 1988, 1999.  All Rights Reserved.
--
--  NAME
--    td3_order_tables.sql
--
-- DESCRIPTION
--   This script contains the DDL as defined in practical work 3
--
--  USAGE
--       SQL> START <filepath>td3_order_tables.sql
--
--
drop table corder_item;
drop table corder;
drop table customer;
drop table product;

create table customer(
	id number constraint pk_customer primary key,
	name varchar2(30) not null,
	address varchar2(30),
	zipcode number check (zipcode between 00001 and 99999) 
	);

create table corder(
	id number constraint pk_corder primary key,
	odate date default sysdate,
	id_customer constraint fk_customer references customer(id)
	);

create table product(
	id number constraint pk_product primary key,
	label varchar2(30) not null,
	stock integer default 0 check(stock >=0),
	price number(5,2) not null check(price >=0)
);
	
create table corder_item(
	id number constraint pk_corder_item primary key,
	id_corder constraint fk_corder references corder(id) on delete cascade,
	num_item integer not null,
	id_product constraint fk_product references product(id),
	quantity integer default 1 check(quantity>=1),
	constraint num_item unique(id_corder, num_item)
	);	

