#!perl

use warnings;
use strict;
use 5.010;

use Benchmark ':all';

use lib '.';

my $classed = qr< [/] ( [^/]+ ) [/] >xms;
my $literal = qr</([^/]+)/>ms;
my $hooked = qr</(.+?)/>ms;


my $str = join( "\n", <DATA> );

my $n = 20_000_000;

say "Running Perl $^V";
timethese( $n, {
    classed => sub { $str =~ /$classed/o },
    literal => sub { $str =~ /$literal/o },
    hooked  => sub { $str =~ /$hooked/o },
} );


exit 0;


__DATA__
    $opt_heading //= !App::Ack::output_to_pipe();
    $opt_break //= !App::Ack::output_to_pipe();

    if ( defined($opt->{H}) || defined($opt->{h}) ) {
        $opt_show_filename = $opt->{show_filename} = $opt->{H} && !$opt->{h};
    }

    if ( defined $opt_output ) {
        # Expand out \t, \n and \r.
        $opt_output =~ s/\\n/\n/g;
        $opt_output =~ s/\\r/\r/g;
        $opt_output =~ s/\\t/\t/g;

        my @supported_special_variables = ( 1..9, qw( _ . ` & ' +  f ) );
        @special_vars_used_by_opt_output = grep { $opt_output =~ /\$$_/ } @supported_special_variables;
