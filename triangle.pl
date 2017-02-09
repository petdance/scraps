#!/usr/bin/perl
use 5.010;
$n=shift;
for(1..$n){say'|',(' 'x($_-1)),'\\'}
say('-'x($n+1))if$n;
