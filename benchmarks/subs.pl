#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';


my $COUNT = 10_000_000;

my %totals;
cmpthese( $COUNT, {
    my_sub => sub {
        my $fn = sub { ++$totals{my_sub} };
        runit($fn);
    },
    state_sub => sub {
        state $fn = sub { ++$totals{state_sub} };
        runit($fn);
    },
    inline => sub {
        runit( sub { ++$totals{inline} } );
    },
} );

sub runit {
    $_[0]->();
}

say "All counts in the hash should be $COUNT";
{use Data::Dumper; local $Data::Dumper::Sortkeys=1; say Dumper( \%totals)}
