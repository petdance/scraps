#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';

use List::SomeUtils qw( any );

my $COUNT = 10000000;

my $x ='not';
cmpthese( $COUNT, {
    eq_2 => sub {
        return $x eq 'this' || $x eq 'that';
    },
    eq_3 => sub {
        return $x eq 'this' || $x eq 'that' || $x eq 'other';
    },
    eq_4 => sub {
        return $x eq 'this' || $x eq 'that' || $x eq 'other' || $x eq 'bongo';
    },
    any_2 => sub {
        return any { $x eq $_ } qw( this that );
    },
    any_3 => sub {
        return any { $x eq $_ } qw( this that other );
    },
    loop_2 => sub {
        for ( qw( this that ) ) {
            return 1 if $x eq $_;
        }
        return;
    },
    loop_3 => sub {
        for ( qw( this that other ) ) {
            return 1 if $x eq $_;
        }
        return;
    },
    hash_lookup => sub {
        state $lookup = { this => 1, that => 2, bongo => 3 };
        return exists $lookup->{$x};
    },
} );


exit 0;
