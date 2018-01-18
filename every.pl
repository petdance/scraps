#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

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
    $hash{$n++} = 'dummy';
}

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
