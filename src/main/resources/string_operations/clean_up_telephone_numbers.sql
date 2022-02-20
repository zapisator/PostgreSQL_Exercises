select memid, regexp_replace(telephone, '\(|\)| |-', '', 'g')
from cd.members;