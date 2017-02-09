#!/usr/bin/perl
use 5.010;
my $n = shift;
for my $i ( 1..$n ) {
    say'|',(' ' x ($i-1)),'\\';
}
say('-'x($n+1)) if $n;
