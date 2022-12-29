
use warnings;
use strict;
use 5.010;

use Benchmark ':all';

say "Running Perl $]";

my $n = 100_000_000;

my $x;
my $y;

timethese( $n, {
    defined => sub {
        $x = defined($y) ? $y : 10;
    },
    dor => sub {
        $x = $y // 10;
    }
} );


timethese( $n, {
    defined_unless => sub {
        $x = 10 unless defined($x);
    },
    dor => sub {
        $x //= 10;
    }
} );
