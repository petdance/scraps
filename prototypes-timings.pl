#!/var/perl/bin/perl

use warnings;
use strict;
use 5.020;

no warnings 'experimental::signatures';
use feature 'signatures';

use Benchmark qw( :all );

timethese( 10_000_000, {
    shifted    => sub { funcshifted( 1, 2 ) },
    shiftedp   => sub { funcshiftedp( 1, 2 ) },
    assigned   => sub { funcassigned( 1, 2 ) },
    assignedp  => sub { funcassignedp( 1, 2 ) },
    signature  => sub { funcsignature( 1, 2 ) },
    signaturep => sub { funcsignaturep( 1, 2 ) },
} );

exit 0;

sub funcshifted {
    my $x = shift;
    my $y = shift;
}

sub funcshiftedp :prototype($$) {
    my $x = shift;
    my $y = shift;
}

sub funcassigned {
    my ($x,$y) = @_;
}

sub funcassignedp :prototype($$) {
    my ($x,$y) = @_;
}

sub funcsignature ($x,$y) {
}

sub funcsignaturep :prototype($$) ($x,$y) {
}
