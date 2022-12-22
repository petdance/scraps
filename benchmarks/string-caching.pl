#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use experimental 'signatures';

use Benchmark ':all';


state $_spacer_valid_pixels = { map { ($_,1) } qw( 1 2 3 5 10 15 20 25 28 ) };
my $COUNT = 10000000;

my %totals;
cmpthese( $COUNT, {
    original_divider => sub {
        _divider();
    },
    cached_divider => sub {
        _cached_divider();
    },
} );


exit 0;


my %divider_styles = (
    'dark'           => 'divider-dark',
    'light'          => 'divider-light',
    'dotted'         => 'dotted',
    'dotted-divider' => 'dotted-divider',
    'sub'            => 'subdivider',
    'clear'          => 'clear',
    'clear-left'     => 'clear-left',
    'clear-right'    => 'clear-right',
    'lerner'         => 'lerner-divider',
);


sub _divider {
    my $style = shift;

    my $class;
    $class = $divider_styles{$style} if $style;
    $class //= 'divider';

    return qq{<div class="$class"><!-- --></div>};
}

sub _cached_divider( $style = '' ) {
    state $cache = {};

    if ( !$cache->{$style} ) {
        my $class = $divider_styles{$style} // 'divider';
        $cache->{$style} = qq{<div class="$class"><!-- --></div>};
    }

    return $cache->{$style};
}

sub _spacer {
    my $pixels = shift;

    if ( $_spacer_valid_pixels->{$pixels} ) {
        return qq{<div class="spacer$pixels"><!-- --></div>};
    }

    my $warning = "Warning: invalid pixels value '$pixels' given to spacer atom";
    warn $warning;
    return join( '',
        _divider(),
        qq{<div class="attention warning">$warning</div>},
        _divider(),
    );
}


sub _cached_spacer( $pixels ) {
    state $cache = {};

    if ( $cache->{$pixels} ) {
        return $cache->{$pixels};
    }

    if ( $_spacer_valid_pixels->{$pixels} ) {
        return ($cache->{$pixels} = qq{<div class="spacer$pixels"><!-- --></div>});
    }

    {use Data::Dumper; local $Data::Dumper::Sortkeys=1; warn Dumper( $_spacer_valid_pixels)}
    my $warning = "Warning: invalid pixels value '$pixels' given to spacer atom";
    warn $warning;
    return join( '',
        _divider(),
        qq{<div class="attention warning">$warning</div>},
        _divider(),
    );
}
