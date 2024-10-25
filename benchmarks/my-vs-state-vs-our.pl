#!/usr/bin/env perl

use warnings;
use strict;
use 5.010;

use Benchmark ':all';

my $n = 10_000_000;

say "Running $n iterations under Perl $]";

my $x = 'CLO';

our $lookup = {
    ACC => 'Accessory',
    BRO => 'Brochure',
    CLO => 'Clothing',
    POS => 'Poster',
    SUP => 'School Supplies',
};

cmpthese( $n, {
    with_my => sub {
        my $lookup = {
            ACC => 'Accessory',
            BRO => 'Brochure',
            CLO => 'Clothing',
            POS => 'Poster',
            SUP => 'School Supplies',
        };
        return $lookup->{$x};
    },
    with_state => sub {
        state $lookup = {
            ACC => 'Accessory',
            BRO => 'Brochure',
            CLO => 'Clothing',
            POS => 'Poster',
            SUP => 'School Supplies',
        };
        return $lookup->{$x};
    },
    with_our => sub {
        return $lookup->{$x};
    },
} );


exit 0;
