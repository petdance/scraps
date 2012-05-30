#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main( void ) {

    int year;
    char title[100];
    char artist[100];

    year = 1999;
    strcpy( artist, "Fiona Apple" );
    strcpy( title, "When the pawn hits the conflicts he thinks like a king / What he knows throws the blows when he goes to the fight / And he'll win the whole thing 'fore he enters the ring / There's no body to batter when your mind is your might / So when you go solo, you hold your own hand / And remember that depth is the greatest of heights / And if you know where you stand, then you know where to land / And if you fall it won't matter, cause you'll know that you're right" );

    printf( "Artist: %s\n", artist );
    printf( "Title: %s\n", title );
    printf( "Year: %d\n", year );

    return 0;
}
