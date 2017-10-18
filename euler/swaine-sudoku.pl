#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

@ARGV = '/usr/share/dict/words';

while (<>) {
    chomp;
    next unless /^[a-z]{9}$/i;

    my %h = map { (lc($_) => 1) } split( // );

    say if scalar keys %h == 9;
}
