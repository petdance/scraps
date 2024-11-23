#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

our $VERSION = 3;

sub hashify {  ## no critic (ArgUnpacking)
    return map { $_ => 1 } @_;
}

use Benchmark ':all';

use Readonly;
Readonly::Array my @FORBIDDEN => qw( $` $& $' $MATCH $PREMATCH $POSTMATCH );
Readonly::Hash my %my_ro_FORBIDDEN => hashify( @FORBIDDEN );
Readonly::Hash our %our_ro_FORBIDDEN => hashify( @FORBIDDEN );

my %my_FORBIDDEN = hashify( @FORBIDDEN );
our %our_FORBIDDEN = hashify( @FORBIDDEN );

my $my_ref_FORBIDDEN = { hashify( @FORBIDDEN ) };
our $our_ref_FORBIDDEN = { hashify( @FORBIDDEN ) };


my $COUNT = 50_000_000;

my $x;
my $y = '$PREMATCH';

            state $bongo = { hashify( @FORBIDDEN ) };
cmpthese( $COUNT,
    {
        my => sub {
            $x = $my_FORBIDDEN{$y};
        },
        our => sub {
            $x = $our_FORBIDDEN{$y};
        },
        my_ro => sub {
            $x = $my_ro_FORBIDDEN{$y};
        },
        our_ro => sub {
            $x = $our_ro_FORBIDDEN{$y};
        },
        #my_ref => sub {
        #$x = $my_ref_FORBIDDEN->{$y};
        #},
        #our_ref => sub {
        #   $x = $our_ref_FORBIDDEN->{$y};
        #},
        #my_ro => sub {
        #    $x = $my_ro_FORBIDDEN{$y};
        #},
        #our_ro => sub {
        #    $x = $our_ro_FORBIDDEN{$y};
        #},
        state => sub {

            $x = $bongo->{$y};
        },
    }
);
