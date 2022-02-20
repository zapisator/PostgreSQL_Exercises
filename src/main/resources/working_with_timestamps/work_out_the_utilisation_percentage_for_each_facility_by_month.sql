with facid_usage as (
    select facid, date_trunc('month', starttime) as month, sum(slots) as sum_slots
    from cd.bookings as bks
    group by facid, month
    order by facid, month
)
select name, month,
       round (
                       sum_slots::numeric
                       / (
                               date_part(
                                       'day'
                                   , month
                                         + '1 month'::interval
                                           - '1 day'::interval
                                   )
                               * 25
                           )::numeric
                   * 100
           , 1
           ) as utilisation
from facid_usage
         inner join cd.facilities
                    using (facid)
order by name, month;