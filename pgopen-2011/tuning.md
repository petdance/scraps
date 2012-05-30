# Greg Smith

Tuning is a lifecycle.

Deploy / Monitor / Tune / Design

You may have a great design up front, but then after a while you
have more data than you did before, so you have to redesign.

# Survival basics

* Monitor before there's a problem
* Document healthy activity
* Watch performance trends
    * "The site is bad.  Is it just today, or has it been getting worse over time?"
* Good change control: Minimize changes, document heavily
    * Keep your config files in version control like any other part of your app.
* Log bad activity
* Capture details during a crisis

# Monitoring and trending

* Alerting *and* trending
* Alerts: Nagios + check\_postgres

# Trending

* Watch database and operating system on the same timeline
* Munin: Easy, complete, heavy
    * Generates more traffic, may not scale up to hundreds of nodes
* Cacti: Lighter, but missing key views
    * Not Greg's first choice
    * Harder to get started with the Postgres plugins
    * Missing key views, which he'll cover later
* Various open-sourc and proprietary solutions

# Munin: Load average

* Load average = how many processes are active and trying to do something.
* Load average is sensitive to sample rate. Short-term spikes may
disappear when seen at a long-term scale.

# Munin: CPU usage

* Best view of CPU usage of the monitoring tools.
* If your system is running a lot of system activity, often for
connection costs, look at a pooler like pg\_bouncer.

# Munin: Connection distribution

* Greg wrote this in Cacti because it's so useful.
* Graph shows a Tomcat app that has built-in connection pool.
* The graph shown isn't actually a problem.
* Better to have a bunch of idle connections because of a pooler,
rather than getting hammered by a thousand unpooled connections.

# Munin: Database shared_buffers usage

* If `shared_buffers` goes up without the same spike in disk IO, it
must be in the OS's cache.
* If `shared_buffers` is bigger than 8GB, it can be a negative,
rather than letting the OS do the buffering.  derby's is at 5GB.
* There is some overlap between Pg's buffers and the OS's, but Pg
tries to minimize this.  Seq scan and VACUUM won't clear out
`shared_buffers`, for example.
* There's nothing wrong with using the OS cache.
* SSDs are great for random-read workloads.  If the drive doesn't
know to sync the data, and is not honest with the OS about it, you
can have corrupted data.
* SSDs best use is for indexes.

# Munin: Workload distribution

* Shows what kind of ops are done on tuples.
* Sequential scans may not necessarily be bad.  Small fact tables
that get cached are sequentially scanned, but that's OK because
they're all in RAM.

# Munin: Long queries/transactions

* Watch for oldest transaction.  Open transactions block cleanup
activities like VACUUM.
* Open transaction longer than X amount of time is Nagios-worthy.

# Using pgbench

* pgbench can do more than just run against the pgbench database.
It can simulate any workload.  It has its own little scripting
language in it.

# OS monitoring

* top -c
* htop
* vmstat 1
* iostat -mx 5
* watch

# Long queries

What are 5 long running queries?

    psql -x -c 'select now() - query_start as runtime, current_query from pg_stat_activity order by 1 desc limit 5'

It's safe to `kill` query processes, but not to `kill -9` them.

# Argument tuning

* Start monitoring your long-running queries.
* Run an EXPLAIN ANALYZE on slow queries showing up in the logs.
* Sort to disk is using 2700K, so we update `work_mem` to 4MB.
However, that still doesn't fix it.  Memory use is bigger in RAM
than on disk.
* If you're reading more than 20% of the rows, Pg will switch to a
sequential scan, because random I/O is so slow.
* Indexing a boolean rarely makes sense.

# The dashboard report

* Sometimes you want to cache your results and not even worry about the query speed.
* Use window functions for ranking.

# The OFFSET 0 hack

* Adding an `OFFSET 0` in a subquery forced a certain `JOIN` order
on the subquery.  Something about making the subquery know that it
is limited in some way.
