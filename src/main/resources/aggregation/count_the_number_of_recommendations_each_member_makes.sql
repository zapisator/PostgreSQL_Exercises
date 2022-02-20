select recommendedby, count(recommendedby)
from cd.members
where recommendedby is not null
group by recommendedby
order by recommendedby;