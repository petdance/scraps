use 5.010;
use strict;
use warnings;
use Benchmark qw'cmpthese';

my %sections = (
    somestring1 => 1,
    somestring2 => 1,
    somestring3 => 1,
    somestring4 => 1
);

my @elements = map { 'somestring' . int(1 + rand(10)) } 1 .. 100;

my $namespace;

say "Perl version $^V";

cmpthese(100000, {
    hash_value => sub {
        foreach my $element (@elements) {
            $namespace = $element if $sections{$element};
        }
    },
    hash_exists => sub {
        foreach my $element (@elements) {
            $namespace = $element if exists $sections{$element};
        }
    },
    regex_lookup1 => sub {
        foreach my $element (@elements) {
            $namespace = $element if $element =~ /^(?:somestring3|somestring4)$/;
        }
    },
    regex_lookup2 => sub {
        foreach my $element (@elements) {
            $namespace = $element if $element =~ /^somestring[34]$/;
        }
    },
    string_cmp => sub {
        foreach my $element (@elements) {
            $namespace = $element if (
                $element eq'somestring3' ||
                $element eq'somestring4');
        }
    },
});
