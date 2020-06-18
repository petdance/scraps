/*

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
can see that the 6th prime is 13.

What is the 10,001st prime number?

*/

fn is_prime(n: u64) -> bool {
    let max_factor = (n as f64).sqrt() as u64;

    for i in 2..=max_factor {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}

fn main() {
    let n = 430;

    println!("is_prime({}) = {}", n, is_prime(n));
}
