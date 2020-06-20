/*

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

*/

fn is_prime(n: u64) -> bool {
    let max_factor = (n as f64).sqrt() as u64;

    if n < 2 {
        return false;
    }

    for i in 2..=max_factor {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}


fn main() {
    let sum = (2..2_000_000)
        .filter(|n| is_prime(*n))
        .fold(0, |sum, i| sum + i)
        ;

    println!("{:?}", sum);
}
