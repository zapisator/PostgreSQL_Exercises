select lpad(zipcode::char(5), 5, '0') as zip
from cd.members
order by zip;