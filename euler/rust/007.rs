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

struct Primes {
    curr: u64,
}

impl Primes {
    fn new() -> Primes {
        Primes { curr: 1 }
    }
}

impl Iterator for Primes {
    type Item = u64;

    fn next(&mut self) -> Option<Self::Item> {
        loop {
            self.curr += 1;
            if is_prime(self.curr) {
                return Some(self.curr);
            }
        }
    }
}

fn main() {
    let mut primes = Primes::new();

    for i in 1..=10001 {
        match primes.next() {
            Some(n) => println!("#{} = {}", i, n),
            None => break,
        };
    }
}
