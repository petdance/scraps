# Mastering PostgreSQL Administration

Bruce Momjian

http://postgresopen.org/2011/schedule/presentations/89/

http://momjian.us/presentation

http://momjian.us/main/writings/pgsql/administration.pdf

Most of this stuff I knew already, so the notes are short.

# Connections

* local -- Unix sockets
    * Significantly faster than going through host
* host -- TCP/IP, both SSL and non-SSL
* hostssl -- only SSL
    * Can delay connection startup by 25-40%
* hostnossl -- never SSL

# Template databases

* You can use template databases to make a standard DB for when you
create new ones.  For example, if you want to always have a certain
function or table, put it in `template1`.  This works with extensions
and contrib like `pg_crypto`.

# Data directory

* `xxx_fsm` files are freespace map
* `pg_xlog` is the WAL log directory
* `pg_clog` is compressed status log

# Config file settings

* `shared_buffers` should be 25% of total RAM for dedicated DB
servers. Don't go over 40-50% or machine will starve.  Also, overhead
of that many buffers is huge.
* If you can get five minutes of your working set into `shared_buffers`,
you're golden.
* Going over a couple hundred connections, it's worth it to look
at a pooler.

# Analyzing activity

* Heavily-used tables
* Unnecessary indexes
* Additional indexes
* Index usage
* TOAST usage

