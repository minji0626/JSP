CREATE TABLE semployee(
num number primary key,
id varchar2(12) unique not null,
name varchar2(30) not null,
passwd varchar2(12) not null,
salary number(8) not null,
job varchar2(30) not null,
reg_date date default sysdate not null
);
CREATE sequence semployee_seq;