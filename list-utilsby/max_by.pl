#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';
use File::Slurp;
use List::UtilsBy qw( max_by );

MAIN: {
    my $niter = 1000;
    my $nrecs = 10000;

    my @input = make_users( $nrecs );

    say "Finding max of $nrecs records $niter times.";

    timethese( $niter,
        {
            old_method => sub { my $user = max_by_salary_method( @input ) },
            new_method => sub { my $user = max_by { $_->salary } @input },
            old_lookup => sub { my $user = max_by_salary_lookup( @input ) },
            new_lookup => sub { my $user = max_by { $_->{salary} } @input },
        }
    );
}


#my $max = max_by_salary( @input );
#{use Data::Dumper; local $Data::Dumper::Sortkeys=1; local $Data::Dumper::Trailingcomma=1; warn Dumper( $max )}
#
#$max = max_by { $_->salary } @input;
#{use Data::Dumper; local $Data::Dumper::Sortkeys=1; local $Data::Dumper::Trailingcomma=1; warn Dumper( $max )}

sub max_by_salary_method {
    my $max_rec;
    my $max_val = 0;
    my $val;
    for my $i ( @_ ) {
        if ( ($val = $i->salary) > $max_val ) {
            $max_rec = $i;
            $max_val = $val;
        }
    }

    return $max_rec;
}


sub max_by_salary_lookup {
    my $max_rec;
    my $max_val = 0;
    my $val;
    for my $i ( @_ ) {
        if ( ($val = $i->{salary}) > $max_val ) {
            $max_rec = $i;
            $max_val = $val;
        }
    }

    return $max_rec;
}


sub make_users {
    my $n = shift;

    my @users = map { bless { salary => int rand(100000) }, 'User' } 1..$n;

    return @users;
}



package User;

sub salary {
    my $self = shift;

    return $self->{salary};
}
