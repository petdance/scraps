#!/var/perl/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';
use HTML::Entities qw( encode_entities );

use Carp::Assert::More;
use Template;



sub spanner( $id, $suffix, $text, $class = undef ) {
    return spanner_encoded( $id, $suffix, HTML::Entities::encode_entities( $text ), $class );
}


sub spanner_encoded( $id, $suffix, $text_encoded, $class = undef ) {
    # Check for both undef and empty strings because TT sends undefs as empty strings.
    $id = "$id-$suffix" if ($suffix // '') ne '';

    my $html = qq{<span id="$id"};
    if ( $class ) {
        $html .= qq{ class="$class"};
    }
    $html .= ">$text_encoded</span>";

    return $html;
}



my $tt = Template->new(
    COMPILE_EXT => '.pl',
    COMPILE_DIR => '/tmp/tt/',
    VARIABLES => {
        spanner => \&spanner,
    }
);


my $vars = {
    foo   => 'Foo & Thing',
    bar   => 2112,
    bat   => undef,
    quux  => 'Flippity floppity blah blah blah',
    count => 14,
};

my $COUNT = 100000;

cmpthese( $COUNT, {
    inline => sub {
        my $output;
        $tt->process( 'spanner-inline.tt', $vars, \$output ) or die $Template::ERROR;
    },
    function => sub {
        my $output;
        $tt->process( 'spanner-function.tt', $vars, \$output ) or die $Template::ERROR;
    },
} );


exit 0;
