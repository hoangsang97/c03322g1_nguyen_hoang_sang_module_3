create database if not exists quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer (
c_id int auto_increment primary key,
c_name varchar(50),
c_age date
);

create table `order` (
o_id int auto_increment primary key,
c_id int,
o_date datetime,
o_totalprice int,
foreign key (c_id) references customer (c_id)
);

create table product (
p_id int auto_increment primary key,
p_name varchar(50),
p_price int
);

create table order_detail (
o_id int,
p_id int,
od_qty int,
primary key (o_id, p_id),
foreign key (o_id) references `order` (o_id),
foreign key (p_id) references product (p_id)
);