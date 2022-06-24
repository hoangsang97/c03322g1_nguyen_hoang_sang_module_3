CREATE DATABASE quan_ly_sinh_vien_3;
USE quan_ly_sinh_vien_3;
CREATE TABLE class
(
    class_id   INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60),
    start_date DATETIME,
    `status`    BIT
);
CREATE TABLE student
(
    student_id   INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30),
    address     VARCHAR(50),
    phone       VARCHAR(20),
    `status`      BIT,
    class_id     INT,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE `subject`
(
    sub_id   INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30),
    credit  TINYINT DEFAULT 1 CHECK ( Credit >= 1 ),
    `status`  BIT DEFAULT 1
);

CREATE TABLE mark
(
    mark_id    INT AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT,
    student_id INT,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    examtimes TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'A3', '2008-09-22', 1);

INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Anh', 'HCM', '0123123123', 0, 2);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, examtimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT * FROM student;
SELECT * FROM student WHERE `status` = true;
SELECT * FROM `subject` WHERE credit < 10;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on s.class_id = c.class_id
WHERE c.class_name = 'A1';

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join `subject` sub on m.sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';

select * from student where student_name like 'h%'; 

select * from class where month(start_date) = 12;

select * from `subject` where credit >= 3 and credit <= 5;
 
SET SQL_SAFE_UPDATES = 0;
update student set class_id = 2 where student_name = 'Hung';

select m.mark, s.student_name, sub.sub_name from mark m
join student s on m.student_id = s.student_id 
join `subject` sub on m.sub_id = sub.sub_id
order by mark desc, s.student_name;