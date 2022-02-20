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
select name, initialoutlay / ("total cost" / 3 - monthlymaintenance) as months
from name_cost
         inner join cd.facilities
                    using(name)
order by name;