with name_cost_slots as (
    select name,
           case when memid > 0 then membercost else guestcost end as cost,
           sum(slots) as sum
    from cd.bookings
             inner join cd.facilities
                        using(facid)
    group by cost, name
    order by sum
),
     name_cost as (
         select name, sum(cost * sum) as "total cost"
         from name_cost_slots
         group by name
     )
select name, rank() over(order by "total cost" desc) as rank
from name_cost
limit 3;