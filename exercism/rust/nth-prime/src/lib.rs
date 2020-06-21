fn is_prime(n: usize) -> bool {
    let max_factor = (n as f64).sqrt() as usize;

    for i in 2..=max_factor {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}

struct Primes {
    curr: usize,
}

impl Primes {
    fn new() -> Primes {
        Primes { curr: 1 }
    }
}

impl Iterator for Primes {
    type Item = usize;

    fn next(&mut self) -> Option<Self::Item> {
        loop {
            self.curr += 1;
            if is_prime(self.curr) {
                return Some(self.curr);
            }
        }
    }
}

pub fn nth(n: usize) -> usize {
    let mut primes = Primes::new();

    return primes.nth(n).expect("Failed finding {}");
}
