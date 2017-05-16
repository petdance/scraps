#!/usr/bin/perl


use 5.010;

@ARGV = '/usr/share/dict/words';

while (<>) {
    next unless /^[a-z]{9}$/i;

    my %h = map { (lc($_) => 1) } split( // );

    print if keys %h == 9;
}
