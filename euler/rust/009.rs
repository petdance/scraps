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

    let x = is_triplet(3,4,5);

    println!("{}", x);

    let y = is_triplet(3,4,6);

    println!("{}", y);
}


fn is_triplet(a: usize, b: usize, c:usize) -> bool {
    return a*a + b*b == c*c;
}
