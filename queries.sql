select c.cname
from customer c,booking b,tickets t, movie_details m,show_details s
where c.cid=b.cid and b.ticket_id=t.ticket_id and t.show_id =s.show_id and s.movie_id=m.movie_id and m.title='Stree';


select *
from booking b,tickets t
where b.ticket_id=t.ticket_id;


select t.theater_id,sum(b.no_of_tickets)
from tickets t,booking b
where b.ticket_id=t.ticket_id
group by t.theater_id;


select a.a_name
from admin a
inner join booking_admin b
on a.a_id=b.a_id;


select b.username 
from booking_admin b
where exists(select *
             from financia_admin f
             where b.a_id=f.a_id);


select c.c_name
from company c
where c.com_id=(select p.com_id
                               from payment p
                               where adc_name='mudra');


select c1.c_name
from company c1,payment p,ad_company a
where c1.com_id=p.com_id and p.adc_name='mudra';
union
select c2.c_name
from company c2,payment p1,ad_company a1
where c2.com_id=p1.com_id and p1.adc_name='avani';


select c1.c_name
from company c1,payment p,ad_company a
where c1.com_id=p.com_id and p.adc_name='mudra';
intersect
select c2.c_name
from company c2,payment p1,ad_company a1
where c2.com_id=p1.com_id and p1.adc_name='avani';
 
 
 Create view a_company
As select .c.c_name
From company c
Where com_id<103;


Create view b_company
As select c.c_name
From company c
Where com_id>103;
