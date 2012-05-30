# Identifying slow queries and fixing them

Stephen Frost

http://postgresopen.org/2011/schedule/presentations/71/

# Fixing

* MergeJoin for small data sets?
    * Check `work_mem`
* Nested Loop with a large data set?
    Could be bad row estimates.
* DELETEs are slow?
    * Make sure you have indexes on foreign keys
* Harder items
    * Check over your long-running queries
    * Use stored procedures/triggers
    * Partioning larger items

# Propared queries

* Plan once, run many
* Not as much info to plan with, plans may be more stable
    * No constraint exclusion, though
* How to explain/explain analyze

# Query Review

* Don't do `select count(*)` on big tables
    * Look at `pg_class.reltuples` for an estimate
    * Write a trigger that keeps track of the count in a side table
* `ORDER BY` and `LIMIT` can help Pg optimize queries
* `select *` can be wasteful by invoking TOAST
* Use JOIN syntax to make sure you don't forget the join conditions

# CTE Common Table Expressions

    WITH (
        my_view AS ( select * from my_expensive_view),
        my_sums AS ( select sum(my_view.x)
    )
    SELECT my_view.*, my_sums.sum FROM my_view, my_sums
