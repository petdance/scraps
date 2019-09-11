#!/usr/bin/perl

# Compare substr to a regex


use Benchmark;


my $COUNT = 50_000_000;

my $path_matching = "/path/to/wanted/that/is/longer";
my $path_notmatching = "/path/to/something/else";
my $path_very_notmatching = "bingo bongo";

timethese( $COUNT, {
    substr_match         => sub { substr( $path_matching, 0, 15 ) eq '/path/to/wanted' },
    regex_match          => sub { $path_matching =~ m{^/path/to/wanted} },
    substr_notmatch      => sub { substr( $path_notmatching, 0, 15 ) eq '/path/to/wanted' },
    regex_notmatch       => sub { $path_notmatching =~ m{^/path/to/wanted} },
    substr_very_notmatch => sub { substr( $path_very_notmatching, 0, 15 ) eq '/path/to/wanted' },
    regex_very_notmatch  => sub { $path_very_notmatching =~ m{^/path/to/wanted} },
} );
