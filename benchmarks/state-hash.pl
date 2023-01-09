#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Readonly;
use Benchmark ':all';

say "Perl $^V";

my $COUNT = 100000000;

Readonly::Hash my %readonly_values => (
    this => 1,
    that => 2,
    other => 3,
    bingo => 4,
    bongo => 5,
);

my %outside_values = (
    this => 1,
    that => 2,
    other => 3,
    bingo => 4,
    bongo => 5,
);

my $x = 15;
cmpthese( $COUNT, {
    outside_hash => sub {
        return !!$outside_values{$x};
    },
    readonly_hash => sub {
        return !!$readonly_values{$x};
    },
    my_hash => sub {
        my %my_values = (
            this => 1,
            that => 2,
            other => 3,
            bingo => 4,
            bongo => 5,
        );
        return !!$my_values{$x};
    },
    state_hash => sub {
        state $state_values = {
            this => 1,
            that => 2,
            other => 3,
            bingo => 4,
            bongo => 5,
        };
        return !!$state_values->{$x};
    },
} );


exit 0;
