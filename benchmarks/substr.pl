#!/usr/bin/perl

# Compare substr to a regex


use Benchmark;


my $COUNT = 50_000_000;

my $path = "/path/to/our/app";

timethese( $COUNT, {
    substr => sub { substr( $path, 0, 15 ) eq '/path/to/wanted' },
    regex  => sub { $path =~ m{^/path/to/wanted} },
} );
