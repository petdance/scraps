#!/var/perl/bin/perl

use 5.010;
use strict;
use warnings;

use Benchmark ':all';

use Template;

my $tt = Template->new(
);


my $vars = {
    foo => 'Foo & Thing',
    bar => 2112,
    bat => undef,
};

my $COUNT = 50000;

cmpthese( $COUNT, {
    inline => sub {
        my $template = 'render-hiddens-inline.tt';
        my $output;
        $tt->process( $template, $vars, \$output ) or die $Template::ERROR;
    },
} );


exit 0;
