#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Benchmark;

sub every(\%) {
    my $hash = shift;
    my $id   = "$hash";

    state $hashes = {};

    my $h = $hashes->{$id} //= { k => [keys %{$hash}], v => [values %{$hash}] };

    # If there's nothing left, delete the h.
    if ( !@{$h->{k}} ) {
        delete $hashes->{$id};
        return;
    }

    return (shift @{$h->{k}}, shift @{$h->{v}});
}


my %hash = ( foo => 1, bar => 2112, bat => 90125, this => 'bongo', that => 'bango' );
my $n = 0;
while ( my ($k,$v) = every %hash ) {
    say "$k -> $v";
}


%hash = map { ( $_ => $_ ) } ( 1 .. 10000 );


timethese( 1000, {
    each__ => sub { while ( my ($k,$v) = each %hash ) {} },
    every_ => sub { while ( my ($k,$v) = every %hash ) {} },
} );

__END__
say 'done';
say '';
say 'New hash';
while ( my ($k,$v) = every %hash ) {
    say "$k -> $v";
}

say 'Empty hash';
%hash = ();
while ( my ($k,$v) = every %hash ) {
    say "$k -> $v";
}
say 'Done with empty hash';

say 'done';
exit 0;
