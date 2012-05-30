# Honey, I Shrunk the Database

Vanessa Hurst

http://postgresopen.org/2011/speaker/profile/36/

http://www.slideshare.net/DBNess/honey-i-shrunk-the-database-9273383

# Why shrink?

* Accuracy
    * You don't know how your app will behave in prdocuation unless you use real data.
* Freshness
    * New data should be available regularly
    * Full database refreshes should be timely
* Resource Limitation
    * Staging and developer machines cannot handle production load
* Data protection
    * Limit spread of sensitive data

# Case study: Paperless Post

* Requiremenets
    * Freshness - Daily on command for non-developers
    * Shrinkage - slices &amp; mutations

* Resources
    * Source -- extra disk space, RAM and CPUS
    * Destination -- Limited, often entirely un-optimizied
    * Development -- constrained DBA resources

# Shrunk strategies

* Copies
    * Restored backups or live replicas
* Slices
    * Select portions of live data
* Mutations
    * Sanitized or anonymized data
* Assumptions
    * Usually for testing

# Slices

* Vertical slice
    * Difficult to obtatin a valid, useful subset of data
    * Example: Include some tables, exclude others

* Horizontal slice
    * Difficult to write &amp; maintain
    * Example: SQL or application code to determine subset of data

* Pg tools -- vertical slice
    * pg\_dump
    * include data only
        * Include table schema only
        * Select tables
        * Select schemas
        * Exclude schemas
