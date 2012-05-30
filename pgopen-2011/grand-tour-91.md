# PostgreSQL 9.1 Grand Tour

Josh Berkus

http://www.pgexperts.com/document.html?id=52

# Overview

* Synchronous replication
* Replication tools
* Per-Column collation
* wCTEs
* Serialized Snapshot Isolation
* Unlogged tables
* SE-Postgres
* K-Nearest Neighbor
* SQL/MED
* Extensions
* Other Features

# Land of Surreal Queries: Writable CTEs

    -- This is in 8.4
    WITH deleted_posts AS (
        DELETE FROM posts
        WHERE created < now() - '6 months'::INTERVAL
        RETURNING *
    )
    SELECT user_id, count(*)
    FROM deleted_posts
    GROUP BY 1

In 9.1, you can do UPDATE on that.

# Unlogged tables

Sometimes you have data where if something happens, you don't care.
Unlogged tables are much faster, but you risk data loss.

# Extensions

    CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA ext;

# SQL-MED

Handling for FDW, which is Foreign Data Wrappers.

# Others

* Valid-on-creation FKs
* Extensible ENUMs
* Triggers on Views
* Reduced NUMERIC size
* ALTER TYPE without rewrite
* `pg_dump` directory format as a precursor for parralel `pg_dump`
