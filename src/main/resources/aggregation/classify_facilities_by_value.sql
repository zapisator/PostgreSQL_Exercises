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
     ),
     name_revenue_class as (
         select name, ntile(3) over(order by "total cost" desc) as revenue
         from name_cost
     )
select name,
       case
           when revenue = 1 then 'high'
           when revenue = 2 then 'average'
           else 'low'
           end as revenue
from name_revenue_class
order by name_revenue_class.revenue, name;