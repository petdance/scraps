Robert Treat, OmniTI, who are basically scalability consultants

http://www.slideshare.net/xzilla/pro-postgres9

pgfoundry.org is other stuff around postgres.

pgxn.org is for 9.1+ extensions

Use package management rather than build from source

* Consistent
* Standardized
* Simple

Versions

* Production level work, use 9.0
* Any project not due to launch for 3 months from today, use 9.1

`pg_controldata` gives you all sorts of awesome details

recovery.conf is in the PGDATA dir for standby machines

`pg_clog`, `pg_log` and `pg_xlog` are the main data logging files.
You can delete under `pg_log` and that's OK.

Trust contrib modules more than your own code from scratch.  Try
to install contrib modules into their own schemas.

# Configuration

* `work_mem`
    * How much memory for each individual query
    * Mostly for large analytical queries
    * OLTP is probably fine with the defaults
    * 2M is good for most people

* `checkpoint_segments`
    * Number of WAL files emitted before a checkpoint.
    * Smaller = more flushing to disk
    * Minimum of 10, more like 30

* `maintenance_work_mem`
    * 1G is probably fine

* `max_prepared_transactions`
    * Is NOT prepared statements
    * Set to zero unless you are on two-phase commit

* `wal_buffers`
    * Always set to 16M and be done with it.

* `checkpoint_completion_target`
    * default is .5
    * Set to .9.  Avoid hard checkpoint spikes at the expense of some overall IO being higher.

# Hardware for Postgres

* Multiple CPUs work wonders, up to 32 processors.  See http://tweakers.net
* Put WAL on its own disk, RAID 1
* Put DATA on its own disk, RAID 10
* More spindles is good
* More controllers even gooder.
* Go with SSDs over more spindles.
* No NFS, no RAID 5

Don't replace multiple spindles with a single SSD.  You still want redundancy.

# Backups

Logical backups

* slow to create and restore
* "pure", no system-level corruption
* susceptible to database-level corruption
* `pg_dump` is your friend, and `pg_dumpall` for global settings

Physical backups

* replication/failover machine
* tarball (pitr)
* filesystem snapshots (pitr)

Tarball

* Basic idea is to copy all database files and relevant xlogs
* Use multiple machines if able
* Use rsync if able
* Copy the slave if able
