/*
# https://projecteuler.net/problem=3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
*/

use std::vec;

fn factors_of(n: u64) -> Vec<u64> {
    let int_sqrt = (n as f64).sqrt() as u64;

    if n < 2 {
        return vec![];
    }
    for i in 2..int_sqrt + 1 {
        if n % i == 0 {
            return [vec![i], factors_of(n / i)].concat();
        }
    }
    return vec![n];
}

fn main() {
    let factors = factors_of(600851475143);

    println!("{:?}", factors);
    match factors.iter().max() {
        Some(n) => println!("Result: {}", n),
        None => println!("Couldn't find max"),
    }
}

/*
from math import sqrt


def factors_of(n):
    for i in range(2, int(sqrt(n))+1):
        if (n % i == 0):
            return [i] + factors_of(n/i)
    return [n]


factors = factors_of(600851475143)
print factors
print max(factors)
*/
