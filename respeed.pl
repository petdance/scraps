#!/usr/bin/perl

use warnings;
use strict;
use 5.010;


use Benchmark qw( timeit timestr );


my $rgx = qr/foo\w+/;
my $s = 'Now is the time for all good men to come to the aid of their football';

my $t = timeit(10_000_000, '$s =~ /$rgx/');
say timestr($t);
{use Data::Dumper; local $Data::Dumper::Sortkeys=1; warn Dumper( $t)}
