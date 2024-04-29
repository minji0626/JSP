CREATE TABLE smember(
num number not null,
id varchar2(12) unique not null,
name varchar2(30) not null,
passwd varchar2(12) not null,
email varchar2(50) not null,
phone varchar2(15),
reg_date date default SYSDATE not null,
constraint smember_pk primary key (num)
);
CREATE sequence smember_seq;