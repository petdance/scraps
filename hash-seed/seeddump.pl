#!/usr/bin/perl

# Invoke as:
# PERL_HASH_SEED_DEBUG=1 perl seeddump.pl

use 5.010;
use warnings;
use strict;
use Hash::Util qw( hash_seed );

my $x = hash_seed();


say unpack( 'H' . (length($x)*2), $x );
