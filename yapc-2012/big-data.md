# Perl and Big Data

http://act.yapcna.org/2012/talk/163

Martin Holste (This is the guy who was at Madison.PM talking about Sphinx)

Signs it is getting big
* Distributed insert/select too slow for work load
* too many record to iteratoe over
* You can't control how much data you're getting
    * 52 billion rows

ELSA goals
* Centralized logging for unlimited data
* Ad-hoc Google-fast searches
* Splunk was too expensive

Challenge: Input
* Couldn't even receive syslog traditionally
* Regex too slow, does not scale

Solution: PatternDB
* Syslog-NG with PatternDB
* Uses pattern matching state engine
* Parses 100k+/sec into fields/value
* Robust test framework

Challenge: Insert into DB
* Basic INSERT is too slow
* Traditional DBCS tops out at around 5k/sec
* All DBMSes fairly equal (MS, Oracle, Pg, MySQL)

Solution: Batch load
* LOAD DATA on any DBMS 100k+/sec

Challenge: Indexing
* Even simple integer indexing was too slow
* Way too slow for text columns
* Tried special strage engines (TokuDB)
* Tried NoSQL: Cassandra, Mongo, Couch, etc
* All way too slow (less than 5k/sec)

Solution: Sphinx
* Indexes 100k rows/sec
* Slurps rows in batches
* Provides MySQL-compatible DB handle
* Multi-threaded searches take advantage of cores

Syslog-NG -> MySql -> Sphinx -> Web
* Perl glues these together
* 1.0 used Syslog->NG -> MySQL -> Sphinx -> POE -> m iddlware -> CGI::Application
* 2.0 used Syslog->NG -> MySQL -> Sphinx -> Plack/AnyEvent

Some basic modules
* Search::QueryParser (Google-style)
* Log::Log4perl
* CHI (for all caching)
* Config::JSON
* Not using DBIx::Class (weird schema) or Sphinx::Search (need async)

Showed big graphs of 1400ms queries of billions of records.

Subsearches
* Chain searches together with results from one as params for next

    sqj_injection groupby:srcip | subsearch(status_code:500)

Map/reduce
* Map = query on index
* Reduce = run function (plugin) or report on field
* Recurse as necessary

