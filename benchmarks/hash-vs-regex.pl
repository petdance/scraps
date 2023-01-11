#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';

my $COUNT = 100_000_000;

say "$COUNT iterations under $^V";

my $word = 'third';
my %keywords = map { $_ => 1 } qw( my local our state );

cmpthese( $COUNT, {
    regex_cap => sub {
        return $word =~ /^(my|local|our|state)$/;
    },
    regex_noncap => sub {
        return $word =~ /^(?:my|local|our|state)$/;
    },
    hash => sub {
        return $keywords{$word};
    }
} );


exit 0;
