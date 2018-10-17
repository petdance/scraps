#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

my @a = map { $_, foo($_) } 1..4;
say join( ', ', map { $_ // 'undef' } @a );

sub foo {
    my $n = shift;
    $_ = undef;  # Perhaps you read through a file.
    return $n * 100;
}
