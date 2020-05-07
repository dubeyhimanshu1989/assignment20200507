-- Executed in on RS, but generic even to run on any db provided row_number function is available

drop table public.events;
create table public.events(id int, event_name varchar(50), num_of_people int);

insert into events values (1, 'A',10);
insert into events values (2, 'B',5);
insert into events values (3, 'C',5);
insert into events values (4, 'D',12);
insert into events values (5, 'A',15);
insert into events values (6, 'A',91);
insert into events values (7, 'B',2);
insert into events values (8, 'D',10);
insert into events values (9, 'D',20);
insert into events values (10, 'D',30);
insert into events values (11, 'D',40);
insert into events values (12, 'C',3);
insert into events values (13, 'E',56);
insert into events values (14, 'A',50);
insert into events values (15, 'A',50);
insert into events values (16, 'B',30);
insert into events values (17, 'B',40);
insert into events values (18, 'B',30);
insert into events values (19, 'A',40);
insert into events values (20, 'A',40);
insert into events values (21, 'A',70);

select event_name, count(grp) num_of_cons_event, sum(num_of_people) total_num_of_people
from (select t.*,
             (row_number() over (order by id) -
              row_number() over (partition by event_name order by id)
             ) as grp
      from public.events t
     ) t
group by grp, event_name
having count(grp)>=3 and sum(num_of_people)>=100;