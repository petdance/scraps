#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';
use File::Slurp;
use List::UtilsBy qw( count_by );

my $niter = 1000;
my $nrecs = 10000;

my @input = make_users( $nrecs );

#my %n = count_initials( @input );
#{use Data::Dumper; local $Data::Dumper::Sortkeys=1; local $Data::Dumper::Trailingcomma=1; warn Dumper( \%n )}

say "Counting arrays of $nrecs records $niter times.";

timethese( $niter,
    {
        count_method_old => sub { my %n = count_initials(@input) },
        count_method_new => sub { my %n = count_by { uc substr($_->name,0,1) } @input },
    }
);


sub count_initials {
    my %n;
    for my $i ( @_ ) {
        ++$n{ uc substr($i->name,0,1) };
    }
    return %n;
}


sub make_users {
    my $n = shift;

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
