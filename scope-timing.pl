#!perl

use warnings;
use strict;
use 5.010;

use Benchmark ':all';

use lib '.';
use Scope;

our $opt = {};

# Set defined variables for reading.
$Scope::opt_x = 2112;
$Scope::opt_y = 'foo';

my $local;
timethese( 20_000_000, {
    get_hash_____ => sub { $local = $opt->{x}     ; $local = $opt->{y}     ; },
    get_imported_ => sub { $local = $opt_x        ; $local = $opt_y        ; },
    get_namespace => sub { $local = $Scope::opt_x ; $local = $Scope::opt_y ; },

    set_hash_____ => sub { $opt->{x} = 47     ; $opt->{y} = 'foo'     ; },
    set_imported_ => sub { $opt_x = 47        ; $opt_y = 'foo'        ; },
    set_namespace => sub { $Scope::opt_x = 47 ; $Scope::opt_y = 'foo' ; },
} );
