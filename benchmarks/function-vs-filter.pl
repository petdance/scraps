#!/var/perl/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';
use HTML::Entities qw( encode_entities );

use Carp::Assert::More;
use Template;


my $tt = Template->new(
    COMPILE_EXT => '.pl',
    COMPILE_DIR => '/tmp/tt/',
    VARIABLES => {
        encode_entities => \&HTML::Entities::encode_entities,
    }
);


my $vars = {
    foo => 'Foo & Thing',
    bar => 'The biggest <HTML TAG> you ever did see',
    bat => 'Flippity floppity blah blah blah',
};

my $COUNT = 100000;

cmpthese( $COUNT, {
    filter => sub {
        my $template = 'function-vs-filter-filter.tt';
        my $output;
        $tt->process( $template, $vars, \$output ) or die $Template::ERROR;
    },
    function => sub {
        my $template = 'function-vs-filter-function.tt';
        my $output;
        $tt->process( $template, $vars, \$output ) or die $Template::ERROR;
    },
} );


exit 0;
