-- Oracle allows the developer to partition the table data
-- Thi smeans that the data can reside in one or more tablespaces.
-- This has some advanages, especially for large databases with a lot of activity
-- A common partition value is a date.

-- Example
create table consultant
	(employee_id       number,
	 first_name        varchar2(15),
	 last_name         varchar2(25),
	 specialty         varchar2(30))
	 partition by range (employee_id)
	 (  partition t1 values less than (250) tablespace realistic_employee1,
  		partition t2 values less than (500) tablespace realistic_employee2,
  		partition t3 values less than (750) tablespace realistic_employee3,
  		partition t4 values less than (10000) tablespace realistic_employee4);