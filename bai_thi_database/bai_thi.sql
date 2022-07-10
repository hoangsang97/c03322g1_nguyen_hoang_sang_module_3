create database if not exists bai_thi;

use bai_thi;

create table class (
class_id int primary key auto_increment,
class_name varchar(45)
);

create table `level` (
level_id int primary key auto_increment,
level_name varchar(45)	
);

create table student (
student_id int primary key auto_increment,
student_name varchar(45),
student_birthday date,
class_id int,
level_id int,
`status` int default 0,
foreign key (class_id) references class(class_id),
foreign key (level_id) references `level`(level_id)
);

create table teacher (
teacher_id int primary key auto_increment,
teacher_name varchar(45),
teacher_id_card varchar(45),
class_id int,
`status` int default 0,
foreign key (class_id) references class(class_id)
);

insert into class(class_name) values ("C-02"), ("C-03"), ("C-04");
insert into `level`(level_name) values ("giỏi"), ("khá"), ("trung bình");
insert into student(student_name, student_birthday, class_id, level_id)
 values ("Học", "1998-10-01", 1, 2), 
 ("Sinh", "2001-12-03", 3, 1), 
 ("Code", "1998-09-16", 2, 3);
 insert into teacher(teacher_name, teacher_id_card, class_id)
 values ("Giáo", "3143524324", 1), 
 ("Viên", "54667675", 3), 
 ("Code", "6754645676", 2);