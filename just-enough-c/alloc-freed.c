#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main( void ) {

    char *sax = malloc( 100 );
    strcpy( sax, "Lou \"Blue Lou\" Marini" );

    printf( "Sax: %s\n", sax );

    free( sax );

    char *guitar = malloc( 100 );

    strcpy( guitar, "Matt \"Guitar\" Murphy" );

    printf( "Guitar: %s\n", guitar );
    printf( "Sax, after free: %s\n", sax );

    return 0;
}
