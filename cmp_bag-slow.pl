#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

use Test::More 'no_plan';

use Test::Deep qw( cmp_bag );

use List::Util qw( shuffle );

use Time::HiRes qw( gettimeofday tv_interval );

for my $n ( 1, 10, 100, 1000, 10000 ) {
    my @stuff = (1..$n);

    my @shuffled = shuffle @stuff;


    my $cmp_bag  = timer( sub { cmp_bag( \@stuff, \@shuffled ) } );
    my $deep     = timer( sub { is_deeply( [sort @stuff], [sort @shuffled] ) } );

    say "$n items";
    say "cmp_bag  = $cmp_bag";
    say "deep     = $deep";
}



sub timer {
    my $sub = shift;

    my $start = [gettimeofday];

    $sub->();

    return tv_interval( $start );
}

