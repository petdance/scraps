#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';


my $COUNT = 10_000_000;

my %totals;
cmpthese( $COUNT, {
    my_sub => sub {
        my $x = sub { ++$totals{my_sub} };
        runit($x);
    },
    state_sub => sub {
        state $x = sub { ++$totals{state_sub} };
        runit($x);
    },
    inline => sub {
        runit( sub { ++$totals{inline} } );
    },
} );

sub runit {
    $_[0]->();
}

{use Data::Dumper; local $Data::Dumper::Sortkeys=1; warn Dumper( \%totals)}
