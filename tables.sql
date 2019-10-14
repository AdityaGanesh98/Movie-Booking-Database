create table company
( 
com_id number,
c_name char(20)
);
alter table company
add primary key(com_id);

insert into company values(101,'book my show');
insert into company values(102,'just tickets');
insert into company values(103,'paytm');
insert into company values(104,'phone pay');
insert into company values(105,'online tickets');

create table admin
(
a_id number,
a_name char(20),
qualification char(20)
);
alter table admin
add primary key(a_id);
insert into admin values(1,'aditya','ms');
insert into admin values(2,'pavan','btech');
insert into admin values(3,'sasi','bcom');
insert into admin values(4,'dheeraj','ms');
insert into admin values(5,'anudeep','ms');
insert into admin values(6,'pavan krish','btech');
insert into admin values(7,'manoj','ma');

create table booking_admin
(
username char(20),
password char(20)
);
alter table booking_admin
add primary key(username);
insert into booking_admin values('pavandindu','pavan143',1);
insert into booking_admin values('adityaganesh','aditya143',2);
insert into booking_admin values('sasib','sasi143',3);
insert into booking_admin values('dheerajkishore','dheeraj143',4);
insert into booking_admin values('pavankrish','pavan143',6);

create table financia_admin
(
acnt_records char(20),
position char(20)
);
insert into financia_admin values('10000','poor',1);
insert into financia_admin values('50000','good',2);
insert into financia_admin values('100000','very good',3);
insert into financia_admin values('1000000','excellent',4);
insert into financia_admin values('100000','very good',5);


create table ad_company
(
ad_type char(20),
adc_name char(20)
);
insert into ad_company values('R15','mudra');
insert into ad_company values('new R15','mudra');
insert into ad_company values('duke','amrutha');
insert into ad_company values('rx100','amulya');

create table tickets (
ticket_id int primary key,
show_id int references show_details(show_id),
theater_id int references theater(theater_id)
);
insert into tickets values(1014,22,706);
 insert into tickets values(1015,22,706);
 insert into tickets values(1016,24,707);
 insert into tickets values(1017,22,709); 
 insert into tickets values(1018,23,710);
 insert into tickets values(1019,23,705);
 insert into tickets values(1020,22,705);
 insert into tickets values(1021,24,709);
 insert into tickets values(1022,24,710);
 insert into tickets values(1023,22,720); 
 insert into tickets values(1024,23,720); 
 insert into tickets values(1025,22,707);
 
 create table discount
(
offer_id number,
price float(3)
);
alter table discount
add primary key(offer_id);
insert into discount values(99,101.50);
insert into discount values(999,111.50);
insert into discount values(9999,121.50);
insert into discount values(9,131.50);

create table theater(
theater_id int primary key,
theater_name char(200),
tlocation char(200)
);
insert into theater values(707,'Vijay Laxmi','LB Nagar');
 insert into theater values(720,'INOX','Himayath Nagar');
 insert into theater values(709,'IMAX','TankBund');
 insert into theater values(710,'Miraj','Kothapet');
 insert into theater values(705,'Ganga','Kothapet');
 insert into theater values(706,'Asian','Uppal');
 insert into theater values(703,'Asian Shiva','Champapet');

create table seats (
  no_of_seats int not null,
  theater_id int references theater(theater_id),
  unique(theater_id)
  );
insert into seats values(150,703);
insert into seats values(150,705);
insert into seats values(150,706);
insert into seats values(150,707);
insert into seats values(150,709);
insert into seats values(150,710);
insert into seats values(150,720);

create table show_details
(
show_id int primary key,
movie_id int references movie_details(movie_id)
);
insert into show_details
values(22,1);
insert into show_details
values(23,4);
insert into show_details 
values(24,3);

create table movie_details(
movie_id int primary key,
title char(200),
director char(200),
mcast char(255));
insert into movie_details
values(1,'Satyameva Jayathe','Milap Zaveri','John Abraham');
insert into movie_details
values(2,'Gold','Reema Kagti','Akshay Kumar');
insert into movie_details
values(3,'Geetha Govindam ','Parasuram','Vijay Devarkonda Rashmika');
insert into movie_details
values(4,'Stree','Amar Kaushik','Shradha Kappor Rajkumar');

create table customer (
cid int primary key,
cname char(200) ,
email char(200),
cage int,
cphno int);
insert into customer
values(252,'Aditya','adi@gmail.com',20,78945621);
insert into customer
values(209,'Pavan','pavan@gmail.com',20,78945621);
insert into customer
values(204,'Sasi','sasi@gmail.com',20,78945621);
insert into customer
values(260,'Dheeraj','Dheeraj@gmail.com',20,78945621); 

create table payment
(
com_id number references company,
adc_name char(20)
on delete cascade
);

create table look_after
(
a_id number references admin,
com_id number references company,
ad_type char(20)
);
insert into look_after values(1,101,'r15');
insert into look_after values(2,102,'new r15');
insert into look_after values(3,103,'duke');
insert into look_after values(4,104,'ktm');

create table booking (
booking_id int primary key,
cid int references customer(cid),
ticket_id int references tickets(ticket_id),
no_of_tickets int,
unique(ticket_id),
check(no_of_tickets <= 6) 
);
 insert into booking values(825,252,1021,2);
 insert into booking values(826,204,1023,1);
 insert into booking values(827,209,1022,3);
 insert into booking values(828,252,1025,4);
 insert into booking values(829,260,1024,2);



