#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';

my $COUNT = 100000000;

my $x = { this => 1, that => 2 };
my $y = 47;
my $z;

say "Perl $^V";
cmpthese( $COUNT, {
    defined => sub {
        if (defined($x->{$y})) {
            $z = 1;
        }
    },
    exists => sub {
        if (exists $x->{$y}) {
            $z = 1;
        }
    },
    bool => sub {
        if ($x->{$y}) {
            $z = 1;
        }
    },
} );


exit 0;
