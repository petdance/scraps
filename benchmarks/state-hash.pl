#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';

my $COUNT = 100000000;

my %values = (
    this => 1,
    that => 2,
    other => 3,
    bingo => 4,
    bongo => 5,
);

my $x = 15;
cmpthese( $COUNT, {
    outside_hash => sub {
        return !!$values{$x};
    },
    my_hash => sub {
        my %values = (
            this => 1,
            that => 2,
            other => 3,
            bingo => 4,
            bongo => 5,
        );
        return !!$values{$x};
    },
    state_hash => sub {
        state $values = {
            this => 1,
            that => 2,
            other => 3,
            bingo => 4,
            bongo => 5,
        };
        return !!$values->{$x};
    },
} );


exit 0;
