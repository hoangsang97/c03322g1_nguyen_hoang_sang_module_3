create database if not exists test_database;

use test_database;

create table student (
id int primary key auto_increment,
`name` varchar(50),
birthday date,
address varchar(50)
);

drop table student;

alter table student 
add class varchar(50);

insert into student
values(1, 'sang', '1997-01-01', 'QN', 'c03');

insert into student(id, `name`) 
values (2, 'dan');

delete from student where id = 1;
	
select id, `name` from student;

select * from student;