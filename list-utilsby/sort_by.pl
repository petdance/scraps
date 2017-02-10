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

timethese( $niter,
    {
        sort_lookup_old => sub { my @x = sort { $a->{name} cmp $b->{name} } @input },
        sort_lookup_new => sub { my @x = sort_by { $_->{name} } @input },
        sort_method_old => sub { my @x = sort { $a->name cmp $b->name } @input },
        sort_method_new => sub { my @x = sort_by { $_->name } @input },
    }
);

my @sorted =
    map  { $_->[0] }
    sort { $a->[1] <=> $b->[1] }
    map  { [$_, $_->name] }
    @input;

    {use Data::Dumper; local $Data::Dumper::Sortkeys=1; local $Data::Dumper::Trailingcomma=1; warn Dumper( \@sorted )}



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
