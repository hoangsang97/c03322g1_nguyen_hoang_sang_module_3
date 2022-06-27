create database if not exists quan_ly_diem_thi;

use quan_ly_diem_thi;

create table hocsinh (
ma_hs varchar(20) primary key,
ten_hs varchar(50),
ngaysinh date,
lop varchar(20),
gt varchar(20)
);

drop table hocsinh;

create table monhoc (
ma_mh varchar(20) primary key,
ten_mh varchar(50)
);

drop table monhoc;

create table bangdiem (
ma_hs varchar(50),
ma_mh varchar(50),
diemthi int,
ngaykt datetime,
primary key (ma_hs, ma_mh),
foreign key (ma_hs) references hocsinh(ma_hs),
foreign key (ma_mh) references monhoc(ma_mh)
);

create table giaovien (
ma_gv varchar(20) primary key,
ten_gv varchar(50),
sdt varchar(10)
);

alter table monhoc
add ma_gv varchar(50);

alter table monhoc
add constraint fk_magv foreign key (ma_gv) references giaovien(ma_gv);