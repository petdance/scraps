#!/var/perl/bin/perl

use strict;
use warnings;
use Benchmark 'cmpthese';
use feature 'signatures';
no warnings 'experimental::signatures';

sub native_assignment {
    die 'Too many arguments for subroutine' unless @_ <= 1;
    die 'Too few arguments for subroutine' unless @_ >= 1;
    my ($var) = @_;
}

sub native_signature ($var) {}

sub no_check_shift {
    my $var = shift;
}

sub no_check_assign {
    my ($var) = @_;
}

cmpthese(-5, {
    native_assignment => sub { native_assignment(1) },
    native_signature  => sub { native_signature(1) },
    no_check_shift    => sub { no_check_shift(1) },
    no_check_assign   => sub { no_check_assign(1) },
});
