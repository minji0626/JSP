create table product(
num number primary key,
name varchar2(30) not null,
price number(9) not null,
stock number(9) not  null,
origin varchar2(30) not null,
reg_date date not null
);
create sequence product_seq;