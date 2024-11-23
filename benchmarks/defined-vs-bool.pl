#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';

my $x;
my $y;

my $COUNT = 100000000;

say "Perl $^V";
cmpthese( $COUNT, {
    defined => sub {
        if (defined $x) {
            $y = 1;
        }
    },
    bool => sub {
        if ($x) {
            $y = 1;
        }
    },
} );


exit 0;
