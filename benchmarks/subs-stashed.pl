#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';


my $COUNT = 10;

my %totals;
cmpthese( $COUNT, {
    my_sub => sub {
        my $fn = sub { ++$totals{my_sub} };
        runit($fn, 'my_sub');
    },
    state_sub => sub {
        state $fn = sub { ++$totals{state_sub} };
        runit($fn, 'state_sub');
    },
    inline => sub {
        runit( sub { ++$totals{inline} }, 'inline' );
    },
} );


my @passed_funcs;
my %seen;
sub runit {
    my ($fn,$who) = @_;
    $fn->();
    ++$seen{$who}{$fn};
    push @passed_funcs, $fn;
}

say "All counts in the hash should be $COUNT";
{use Data::Dumper; local $Data::Dumper::Sortkeys=1; say Dumper( \%totals)}
{use Data::Dumper; local $Data::Dumper::Sortkeys=1; warn Dumper( \%seen)}
