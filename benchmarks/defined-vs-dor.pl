
use warnings;
use strict;
use 5.010;

use Benchmark ':all';

my $n = 50_000_000;

say "Running $n iterations under Perl $]";

my $x;
my $y;

cmpthese( $n, {
    defined => sub {
        $x = defined($y) ? $y : 10;
    },
    dor => sub {
        $x = $y // 10;
    }
} );


cmpthese( $n, {
    defined_unless => sub {
        $x = 10 unless defined($x);
    },
    dor => sub {
        $x //= 10;
    }
} );
