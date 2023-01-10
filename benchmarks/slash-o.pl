#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';

my $COUNT = 10_000_000;

say "$COUNT iterations under $^V";

my $str = 'Who knows what evil lurks in the hearts of men?';
my $pattern = 'in\s+the';

cmpthese( $COUNT, {
    noninterpolated => sub {
        return $str =~ /lurks in\s+the/;
    },
    interpolated => sub {
        return $str =~ /lurks $pattern/;
    },
    slasho => sub {
        return $str =~ /lurks $pattern/o;
    }
} );


exit 0;
