with october as (select '2012-10-01 00:00'::timestamp as first)
select generate_series(
               october.first,
               october.first + '1 month'::interval - '1 day'::interval,
               '1 day'
           )
from october;