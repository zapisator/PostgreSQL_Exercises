with
    august_days as (
        select
            generate_series(
                    date '2012-08-01',
                    date '2012-08-31',
                    '1 day'
                ) :: date
                as date
    )
select august_days.date,
       (select sum(case
                       when memid = 0 then slots * guestcost
                       else slots * membercost
           end) / 15 as revenue
        from cd.bookings
                 inner join cd.facilities
                            using (facid)
        where starttime
                  between august_days.date - interval '14 days'
                  and august_days.date + interval '1 day'
       )
from august_days;