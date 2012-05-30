#!/usr/bin/perl

use warnings;
use strict;

my $x = foo();

sub foo {
    bar(1,2,3);
}

sub bar {
    my ($p,$f) = (caller(0))[0,3];

    {use Data::Dumper; local $Data::Dumper::Sortkeys=1; print Dumper( $p, $f )}
}
