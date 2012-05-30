#!/usr/bin/perl

use 5.12.0;

use re 'debugcolor';

my $string = 'GCGGCCGCAGCUGCCGUCUUGCAGGCAU';

if ( $string =~ /^(?:GC.)*+GCG(..G)/ ) {
    say 'Matches GCG with XXG afterward';
}
