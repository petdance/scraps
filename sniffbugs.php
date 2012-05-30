<?php

// Variable $x can be expressed as ${x} but phpcs doesn't detect that.

function foo( $bar ) {
    print "${bar} things\n";
}

function bar( $x ) {
    return 2 * ${x};
}

print 'Should say "14 things"' . "\n";
$fourteen = bar( 7 );
foo( $fourteen );

?>
