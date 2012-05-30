#!/usr/bin/perl

use warnings;
use strict;

use 5.10.0;

use IO::Prompter;

my $selection
    = prompt 'Choose wisely...', -menu => {
            wealth => [ 'moderate', 'vast', 'incalculable' ],
            health => [ 'hale', 'hearty', 'rude' ],
            wisdom => [ 'cosmic', 'folk' ],
        }, '>';

say "You chose $selection";
