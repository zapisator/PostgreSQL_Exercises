delete from cd.members as mbs
where
    not exists (
            select 1
            from cd.bookings as bks
            where memid = mbs.memid
        );