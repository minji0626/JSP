 -- 사원 관리
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

-- 사원 게시판
CREATE TABLE story(
snum number not null,
title varchar2(150) not null,
content clob not null,
ip varchar2(30) not null,
num number not null,
reg_date date default sysdate not null,
constraint story_pk primary key (snum),
constraint stork_fk foreign key (num) references semployee (num)
);
CREATE sequence story_seq;