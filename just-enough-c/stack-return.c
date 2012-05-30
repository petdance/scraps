#include <stdio.h>
#include <string.h>

char *name( void ) {
    char temp[4];
    int n;

    strcpy( temp, "Bob" );

    n = 2112;

    return temp;
}

void do_something( void ) {
    /* whatever */
}

int main( void ) {
    char *who = name();

    do_something();
    puts( who );

    return 0;
}
