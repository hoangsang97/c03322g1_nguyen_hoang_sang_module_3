create database if not exists product;

use product;

create table product(
id int primary key auto_increment,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status int default 0
);

insert into product(product_code, product_name, product_price, product_amount, product_description)
values (12121, 'samsum', 100, 10, 'vip'),
(2322, 'apple', 200, 9, 'normal'),
(32121, 'nokia', 150, 2, 'normal');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index key_product_code on product(product_code);
select * from product where product_code = 12121;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index key_product on product(product_name, product_price);
select * from product where product_name = 'nokia' and product_price = 150;

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from product;

-- So sánh câu truy vấn trước và sau khi tạo index
-- giúp tăng tốc độ truy vấn

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select product_code, product_name, product_price, product_status from product;
select * from product_view;

-- Tiến hành sửa đổi view
update product_view set product_price = 200 where product_code = 12121;

-- Tiến hành xoá view
delete from product_view where product_code = 12121;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure view_product()
begin
	select * from product; 
end
// delimiter ;

call view_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(product_code int, product_name varchar(50), product_price double, product_amount int, product_description varchar(50))
begin
	insert into product (product_code, product_name, product_price, product_amount, product_description) 
    values (product_code, product_name, product_price, product_amount, product_description);
end
// delimiter ;

call add_product(12121, 'samsum', 100, 10, 'vip');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(edit_product_price double)
begin
	update product set product_price = edit_product_price where id = 2;
end
// delimiter ;

call edit_product(300);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(delete_product_id int)
begin
	delete from product where id = delete_product_id;
end
// delimiter ;

call delete_product(2);