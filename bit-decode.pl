#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
no warnings 'experimental::signatures';
use feature 'signatures';



my $n = 5068;

my $i = 1;

while ( $i <= 65536 ) {
    if ( ($n | $i) == $n ) {
        say $i;
    }
    else {
    }

    $i *= 2;
}
