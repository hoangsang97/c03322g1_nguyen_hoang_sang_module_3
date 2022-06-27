create database if not exists quan_ly_ban_hang_2;

use quan_ly_ban_hang_2;

create table customer (
c_id int auto_increment primary key,
c_name varchar(50),
c_age int
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

insert into customer (c_name, c_age) 
values ('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into `order` (c_id, o_date, o_totalprice) 
values (1, '2006-03-21', null),
(2, '2006-03-23', null),
(1, '2006-03-16', null);

insert into product (p_name, p_price) 
values ('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into order_detail
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select o_id, o_date, o_totalprice from `order`;

select c.c_name as danh_sach_kh_da_mua, p.p_name as danh_sach_sp_duoc_mua from product p
join order_detail o on o.p_id = p.p_id
join `order` on o.o_id = `order`.o_id
join customer c on `order`.c_id = c.c_id;

select customer.*, count(`order`.c_id) as so_luong from customer 
left join `order` on `order`.c_id = customer.c_id
group by c_id having so_luong = 0;

select `order`.o_id, `order`.o_date,  sum(order_detail.od_qty * product.p_price) as gia_tien from `order`
join order_detail on order_detail.o_id = `order`.o_id
join product on order_detail.p_id = product.p_id
group by o_id;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));