#!/usr/bin/perl

# http://rt.perl.org/rt3//Ticket/Display.html?id=56444

use strict;
use warnings;

use charnames ':full';

use Perl6::Say;

my $str = "This \N{THAI CHARACTER SARA I} is a special character";
my $re  = qr/This \x27 \N{THAI CHARACTER SARA I} is/;
#my $re = 'x';
say +($str =~ /$re/) ? 'found' : 'not found';

say $str;

say $re;
