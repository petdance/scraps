#!/usr/bin/perl
($n=shift)&&do{
print'|',' 'x($_-1),"\\\n"for 1..$n++;
print'-'x$n,$/;
}
