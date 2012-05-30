drop table if exists foo_with_ts;
create table foo_with_ts ( foo int, bar timestamp with time zone);
insert into foo_with_ts values (1, CURRENT_TIMESTAMP);
SELECT TO_CHAR( bar, 'MM/DD/YYYY HH24:MI:SS.MS TZ' ) from with_ts;
