#!/usr/bin/perl

use warnings;
use strict;

use 5.10.0;

use Data::Show;

my $person = {
    name => 'Quinn',
    preferred_games => {
        wii => 'Mario Party 8',
        board => 'Life: Spongebob Squarepants Edition',
    },
    aliases => [ 'Shmoo', 'Monkeybutt' ],
    greeter => sub { my $name = shift; print "Hello $name" },
};

show $person;
