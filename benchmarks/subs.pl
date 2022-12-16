#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';

my $COUNT = 10_000_000;

say "$COUNT iterations under $^V";

my %totals;
cmpthese( $COUNT, {
    declared => sub {
        runit( \&_declared );
    },
    inline => sub {
        runit( sub { ++$totals{inline} } );
    },
    state_sub => sub {
        state $fn = sub { ++$totals{state_sub} };
        runit($fn);
    },
    cached => sub {
        state $cache = {};
        runit( $cache->{arbitrary_key} //= sub { ++$totals{cached} } );
    },
} );

sub _declared {
    ++$totals{declared};
}

sub runit {
    $_[0]->();
}

say "All counts in the hash should be $COUNT";
{use Data::Dumper; local $Data::Dumper::Sortkeys=1; say Dumper(\%totals)}
for ( values %totals ) {
    die unless $_ == $COUNT;
}
