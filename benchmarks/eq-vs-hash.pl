#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';

use List::SomeUtils qw( any );

package Thing;

sub new {
    return bless {}, 'Thing';
}

sub content {
    return 'not';
}


package main;

my $x = Thing->new;

my $COUNT = 5000000;

cmpthese( $COUNT, {
    eq_2 => sub {
        return $x->content eq 'this' || $x->content eq 'that';
    },
    eq_3 => sub {
        return $x->content eq 'this' || $x->content eq 'that' || $x->content eq 'other';
    },
    eq_4 => sub {
        return $x->content eq 'this' || $x->content eq 'that' || $x->content eq 'other' || $x->content eq 'bongo';
    },
    my_eq_2 => sub {
        my $thing = $x->content;
        return $thing eq 'this' || $thing eq 'that';
    },
    my_eq_3 => sub {
        my $thing = $x->content;
        return $thing eq 'this' || $thing eq 'that' || $thing eq 'other';
    },
    my_eq_4 => sub {
        my $thing = $x->content;
        return $thing eq 'this' || $thing eq 'that' || $thing eq 'other' || $thing eq 'bongo';
    },
    any_2 => sub {
        return any { $x->content eq $_ } qw( this that );
    },
    any_3 => sub {
        return any { $x->content eq $_ } qw( this that other );
    },
    my_any_2 => sub {
        my $thing = $x->content;
        return any { $thing eq $_ } qw( this that );
    },
    my_any_3 => sub {
        my $thing = $x->content;
        return any { $thing eq $_ } qw( this that other );
    },
    hash_lookup => sub {
        state $lookup = { this => 1, that => 2, bongo => 3 };
        return exists $lookup->{$x->content};
    },
} );


exit 0;
