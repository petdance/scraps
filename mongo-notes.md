# High-level "huh"

No joins.  Joins are done with embedded objects.  You store references to associated objects.

Updates are done with a db.update( query, update-rule ).

# What I don't know

What are the rules of embedded documents?

How does indexing work?

# MongoMapper

## Using

Ruby class to handle interactions with Mongo.

Adds types.  But Mongo is schema-less?  Moves the schema to the app level.

    class User
        include MongoMapper::Document

        key :email, DowncasedString
        key :title, String, :required => true
    end

Adds hooks like :before_save, :before_create, :validate_on_create,
:after_validation_on_update, etc

to Docs: belongs_to, one, many, etc

## Extending

Everything is plugins: Associations, callbacks, clones, descendants, etc

    class Foo
        include MongoMapper::Document
        plugin ActsAsListFun
    end

    class Asset
        include MongoMapper::Document
        plugin Joint

        attachment :image
        attachment :file
    end

    asset = Asset.create( {
            :image => File.open( ... ),
            :file  => File.open( ... ),
            })

# Schools site and Mongo

@onyxfish

Chose Mongo because it's NoSchema.  Had 4,000 schools (rows) with
8,000 columns.

Classic mistake: "It's NoSQL, it must be fast."

Conclusions III: Be judicious in using Mongo for projects that don't
need it to scale, but don't assume it's never appropriate."

# Mongo Admin

@rit, starting at 10gen on Monday

Just like Mongo is schemaless, so are the config files.

There is no such thing as single-server durability.

Talking of slaves and their replication times behind the master.

The amount of admin is kind of scary, especially all the different
boxes that everything lives on.  Or is that just not the monolithic
DB of Oracle/PostgreSQL and I'm not used to it?

Ooh, look a --rest option for mongod.

# Deployment

What's your data like?

Do you access all data sequentially, randomly or rarely?

Working set should fit in RAM.  How much data do you access in a 10 minute period?

Mongo works very well with SSDs.  On the order of 10x faster.

Network: Can easily saturate a gigabit ethernet with some workloads.

MongoDB uses multiple cores.  For working-set queries, CPU is minimal.

Durability: MongoDB 1.6 is not durable on a single server.

Backups: Typically driven from slave.  Eliminates impact on client/app

mongodump: Databse isn't necessarily consistent from start to finish
w/o locking DB traffic.

There's an entire slide on what sort of filesystem to use.  This
is so Brave New World.

All data, namespace files stored in data directory.  Possible to
create links and aggregate IO across disks.

EC2 works very well.  EBS isn't the fastest and can be spiky.

mongostat is top for mongo.

First thing to check in cases of slow: iostat -x 2.  Usually shows
disk is saturated, and then you figure out why.

# Totsy case study

Why MongoDB?  Speed, scale, low admin, encourages simple code.

totsy.com gets "stampede traffic patterns": high peaks, deep valleys

New Mongo users come in demanding transaction supports, because
it's what they're used to.

All of totsy is in: addresses, carts, credits, events, invitations,
items, lists, menus, orders, tickets, users.  Orders would typically
be ten different tables, right?

lists collection is his way of doing some kind of cross-database
foreign key aggregate.

Encourages extremely simple data model, producing tighter code.

Totsy used gridfs a lot to handle distributed data.

One night, had 1700+ ops per second on the MongoDB server, server
had a load of 0.68.  17% of capacity on a 4-core machine.

# Mongo in the cloud

EC2 is slow.

Don't migrate from 32-bit to 64-bit.  Just start out right.

Practice disaster recovery.

# Sharding

Elliot

Sharding is range-based.  Collection broken into chunks by range.
Chunks default to 200mb or 100,00 objects.

It's automated in mongo, distributes databases, collections or
objects.

Choosing a shard key is important.  Logging, do it by date, or
machine/date, or logger name.

mongos is the sharding router.  Future changes will have mongos
talking to each other through Unix sockets.
