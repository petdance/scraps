
use warnings;
use strict;
use 5.010;

use Benchmark ':all';

no warnings 'experimental::signatures'; ## no critic ( TestingAndDebugging::ProhibitNoWarnings )
use feature 'signatures';

sub sig($foo) { my $x = $foo*2; }
sub proto_shift :prototype($) { my $foo = shift; my $x = $foo*2; }
sub proto_direct :prototype($) { my $foo = $_[0]; my $x = $foo*2; }

my $a = 14;
say "Running Perl $]";
timethese( 10_000_000, {
    sig          => sub { sig($a) },
    proto_shift  => sub { proto_shift($a) },
    proto_direct => sub { proto_direct($a) },
} );
