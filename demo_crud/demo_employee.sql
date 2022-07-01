create database demo_employee;

use demo_employee;

create table `level` (
	id_level int primary key auto_increment,
	`level` varchar(50)
);

create table employee (
	id int primary key auto_increment,
    `name` varchar(50),
    gender varchar(2),
    id_level int,
    foreign key (id_level) references `level`(id_level)
);

delimiter //
create procedure display_information()
begin
SELECT e.id, e.name, e.gender, lv.level FROM employee e join `level` lv on e.id_level = lv.id_level ORDER BY e.id ;
end
// delimiter ;

delimiter //
create procedure update_infomation(in employee_name varchar(50), in employee_gender varchar(2),in employee_id_level int, in employee_id int)
begin
UPDATE employee SET name = employee_name, gender = employee_gender, id_level = employee_id_level WHERE id = employee_id;
end
// delimiter ;

delimiter //
create procedure delete_infomation(in employee_id int)
begin
DELETE FROM employee WHERE id = employee_id;
end
// delimiter ;

insert into `level`(`level`) values ("good"), ("rather"), ("medium");
insert into employee(`name`, gender, id_level) 
values ("Nguyen Van A", "1", 1),
("Nguyen Van B", "0", 2),
("Nguyen Van C", "1", 3);

select e.id, e.`name`, e.gender, lv.`level` from employee e
join `level` lv on e.id_level = lv.id_level;