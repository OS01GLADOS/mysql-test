select 
client_number,
(select  count(*) 
from event_value e1
inner join bid b1
on b1.play_id = e1.play_id 
where outcome = 'win' and b1.client_number = b.client_number ) as 'all wins',
(select  count(*) 
from event_value e1
inner join bid b1
on b1.play_id = e1.play_id 
where outcome = 'lose' and b1.client_number = b.client_number ) as 'all loses'
from bid b
group by b.client_number
