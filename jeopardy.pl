#!/usr/bin/perl

use warnings;
use strict;
use 5.010;


my $score = 0;

$score = run( $score, 200, 400, 600, 800, 1000 ) for 1..3;
$score = run( $score,      400, 600, 800, 1000 ) for 4..5;
$score = dd( $score ) for 1..2;
say "End of J, score = $score";

$score = run( $score, 400, 800, 1200, 1600, 2000 ) for 1..3;
$score = run( $score,      800, 1200, 1600, 2000 ) for 4..5;
$score = dd( $score ) for 1..2;
say "End of DJ, score = $score";

$score *= 2;
say "End of FJ, score = $score";

sub run {
    my $score = shift;
    my @clues = @_;

    for my $clue ( @clues ) {
        $score += $clue;
    }

    return $score;
}

sub dd {
    my $score = shift;

    return $score * 2;
}
