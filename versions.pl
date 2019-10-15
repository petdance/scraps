#!/usr/bin/perl

use warnings;
use strict;
use 5.010;

printf( "Perl %vd\n", $^V );

my $vold = v3.6.5;
my $vnew = v3.10.1;
printf( '%vd > %vd: ', $vnew, $vold );
say $vnew gt $vold ? 'Good' : 'Bad';

my $sold = 'v3.6.5';
my $snew = 'v3.10.1';
printf( '%s > %s: ', $snew, $sold );
say $snew gt $sold ? 'Good' : 'Bad';
