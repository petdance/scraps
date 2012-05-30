#!/usr/bin/perl

use strict;
use warnings;

use charnames ':full', ':alias' => {
    e_ACUTE => 'LATIN SMALL LETTER E WITH ACUTE',
};

use Perl6::Say;

my $str = "This -> \N{e_ACUTE} is a small letter e with an acute";
my $re  = qr/\N{e_ACUTE}/;
say $re;

say +($str =~ /$re/) ? 'found' : 'not found';
