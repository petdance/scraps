#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main( void ) {

    char name[] = "Bob's Country Bunker";

    char *p = name;

    puts( p );

    free( p );

    return 0;
}
