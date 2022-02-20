select date_trunc('month', stamp) + '1 month' - date_trunc('day', stamp) as remaining
from (
         select '2012-02-11 01:00:00'::timestamp as stamp
     ) as main;