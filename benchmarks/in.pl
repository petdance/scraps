#!/usr/bin/perl

use Benchmark;
use List::Util;


my $COUNT = 5_000_000;

my $stooges = qw( Larry Curly Moe Shemp Iggy );

my $stooge = 'Larryx';

timethese( $COUNT, {
    smartmatch => sub { return $stooge =~ $stooges },
    in         => sub { return in( $stooge, $stooges ) },
    insmart         => sub { return insmart( $stooge, $stooges ) },
} );



sub in : prototype($$) {
    my $needle   = shift;
    my $haystack = shift;

    if ( !defined($needle) ) {
        return 1 if List::Util::any { !defined } @{$haystack};
    }
    elsif ( ref($needle) eq 'Regexp' ) {
        return 1 if List::Util::any { defined && /$needle/ } @{$haystack};
    }
    else {
        return 1 if List::Util::any { defined && ($_ eq $needle) } @{$haystack};
    }

    return 0;
}


sub insmart : prototype($$) {
    my $needle   = shift;
    my $haystack = shift;

    return $needle =~ $haystack;
}
