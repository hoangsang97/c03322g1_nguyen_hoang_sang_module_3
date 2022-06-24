create database if not exists erd_sang_mo_hinh;

use erd_sang_mo_hinh;

create table phieu_xuat (
so_px int auto_increment primary key,
ngayxuat date
);

create table vat_tu (
ma_vtu int auto_increment primary key,
ten_vtu varchar(50)
);

create table phieu_nhap (
so_pn int auto_increment primary key,
ngaynhap date
);

create table nha_cc_sdt (
ma_ncc int auto_increment primary key,
sdt varchar(20)
);

create table nha_cc (
ma_ncc int auto_increment primary key,
ten_ncc varchar(50),
diachi varchar(50),
id_ma_ncc int,
foreign key (id_ma_ncc) references nha_cc_sdt (ma_ncc)
);

create table don_dh (
so_dh int auto_increment primary key,
ngay_dh date,
ma_ncc int,
foreign key (ma_ncc) references nha_cc (ma_ncc)
);

create table chi_tiet_px (
dg_xuat int,
sl_xuat int,
so_px int,
ma_vtu int,
primary key (so_px, ma_vtu),
foreign key (so_px) references phieu_xuat (so_px),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);

create table chi_tiet_pn (
dg_nhap int,
sl_nhap int,
so_pn int,
ma_vtu int,
primary key (so_pn, ma_vtu),
foreign key (so_pn) references phieu_nhap (so_pn),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);

create table chi_tiet_dh (
ma_vtu int,
so_dh int,
primary key (ma_vtu, so_dh),
foreign key (ma_vtu) references vat_tu (ma_vtu),
foreign key (so_dh) references don_dh (so_dh)
);