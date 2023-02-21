#!/var/perl/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';
use HTML::Entities qw( encode_entities );

use Carp::Assert::More;
use Template;


sub hidden_html( $name, $value ) {
    return '<input type="hidden" name="' . encode_entities($name) . '" value="' . encode_entities($value // '') . '">' . "\n";
}


sub hiddens_html( $hiddens ) {
    my $out = '';

    if ( $hiddens ) { # Skips undefs and empty strings, which is how TT sends undefs.
        # assert_hashref($hiddens);
        for my $k ( sort keys %{$hiddens} ) {   # Keep rendering deterministic.
            $out .= hidden_html( $k, $hiddens->{$k} );
        }
    }

    return $out;
}

my $tt = Template->new(
    VARIABLES => {
        hiddens_html => \&hiddens_html,
    }
);


my $vars = {
    foo => 'Foo & Thing',
    bar => 2112,
    bat => undef,
};

my $COUNT = 100000;

cmpthese( $COUNT, {
    inline => sub {
        my $template = 'render-hiddens-inline.tt';
        my $output;
        $tt->process( $template, $vars, \$output ) or die $Template::ERROR;
    },
    function => sub {
        my $template = 'render-hiddens-function.tt';
        my $output;
        $tt->process( $template, $vars, \$output ) or die $Template::ERROR;
    },
} );


exit 0;
