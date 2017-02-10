#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';
use File::Slurp;
use List::UtilsBy qw( sort_by );

my $niter = 100;
my $nrecs = 10000;

my @input = make_users( $nrecs );

say "Sorting arrays of $nrecs records $niter times.";

my @x;
timethese( $niter, {
    # Key comes from a hash lookup.
    lookup_raw_____ => sub { @x = sort { $a->{name} cmp $b->{name} } @input },
    lookup_schwartz => sub { @x = sort_by { $_->{name} } @input },
    lookup_utilsby_ => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->{name}] } @input },

    # Key comes from a method call.
    method_raw_____ => sub { @x = sort { $a->name cmp $b->name } @input },
    method_schwartz => sub { @x = sort_by { $_->name } @input },
    method_utilsby_ => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->name] } @input },
} );


sub make_users {
    my $n = shift;

    open( my $fh, '<', '/usr/share/dict/words' );
    my @words = File::Slurp::read_file( '/usr/share/dict/words' ) or die;
    chomp @words;

    my @selected_words = map { $words[rand @words] } 1 .. $n;
    my @users = map { bless { name => $_ }, 'User' } @selected_words;

    return @users;
}



package User;

sub name {
    my $self = shift;

    return $self->{name};
}
