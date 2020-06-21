pub fn factors(n: u64) -> Vec<u64> {
    let int_sqrt = (n as f64).sqrt() as u64;

    if n < 2 {
        return vec![];
    }
    for i in 2..int_sqrt + 1 {
        if n % i == 0 {
            return [vec![i], factors(n / i)].concat();
        }
    }
    return vec![n];
}
