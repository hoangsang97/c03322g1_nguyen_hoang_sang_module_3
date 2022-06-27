create database student_management;

use student_management;

create table student (
id int not null,
`name` varchar(50) null,
age int null,
county varchar(50)
);

create table class (
id int not null,
`name` varchar(50)
);

create table teacher (
id int not null,
`name` varchar (50),
age int null,
county varchar(50)
);