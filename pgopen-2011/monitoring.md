# Monitoring the heck out of your database

Josh Williams, End Point

http://joshwilliams.name/talks/monitoring/

# What are we looking for?

* Performance of the system
* Application throughput
* Is it dead or about to die?

"They don't care if the system's on fire so long as it's making money."

# Monitoring Pg

* Log monitoring for errors
* Log monitoring for query performance
* Control files / External commands
* Statistics from the DB itself

# Monitoring error conditions

* ERROR: Division by zero
* FATAL: password authentication
* PANIC: could not write to file `pg_xlog`...

Quick discussion of tail\_n\_mail: http://bucardo.org/wiki/Tail_n_mail

# Log monitoring for query performance

* Pgfouine
* pgsi http://bucardo.org/wiki/Pgsi

# check_postgres

Most of the rest of the talk was about check\_postgres, which I
already know all about.  A few cool to-do items came out of it.o

* Look at tracking --dbstats in cacti
* Add the --noidle to --action=backends to get a better sense of the counts.
