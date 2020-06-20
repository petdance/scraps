/*

https://projecteuler.net/problem=9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

*/

// Implementation taken from https://github.com/gifnksm/ProjectEulerRust/blob/master/src/bin/p008.rs



fn main() {
    for c in 3..=1000 {
        for b in 2..=c-1 {
            for a in 1..=b-1 {
                if is_triplet(a,b,c) {
                    println!("{} {} {}", a, b, c);
                    if a+b+c == 1000 {
                        println!("DING! {}", a*b*c);
                        return;
                    }
                }
            }
        }
    }
}


fn is_triplet(a: usize, b: usize, c:usize) -> bool {
    return a*a + b*b == c*c;
}
