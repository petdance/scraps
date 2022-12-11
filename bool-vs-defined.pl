# From https://stackoverflow.com/questions/1423782/is-a-string-comparison-or-a-hash-lookup-faster-in-perl
use 5.010;
use strict;
use warnings;
use Benchmark qw'cmpthese';

use Test::Builder;

# Arbitrary object type
my @elements = ( undef, Test::Builder->new, Test::Builder->new, Test::Builder->new );
@elements = @elements x 10;

my $namespace;

say "Perl version $^V";

cmpthese(5000000, {
    defined => sub {
        foreach my $element (@elements) {
            $namespace = 'x' if defined($element);
        }
    },
    bool => sub {
        foreach my $element (@elements) {
            $namespace = 'x' if $element;
        }
    },
});
