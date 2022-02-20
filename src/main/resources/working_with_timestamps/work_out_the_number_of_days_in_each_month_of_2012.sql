with
    month as (
        select generate_series(
                       '2000-01-01'::timestamp,
                       '2000-12-01'::timestamp,
                       '1 month')
                   as number
    )
select
    extract(month from number),
    number + '1 month'::interval - number as lenght
from month;