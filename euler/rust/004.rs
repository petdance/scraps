/*

http://projecteuler.net/index.php?section=problems&id=4

A palindromic number reads the same both ways. The largest palindrome
made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit
numbers.

*/

fn is_palindromic(n: u32) -> bool {
    let s = n.to_string();

    let rev: String = s.chars().rev().collect();

    return s == rev;
}

fn main() {
    let mut max: u32 = 0;

    for x in 100..=999 {
        for y in 100..=999 {
            let n = x * y;
            if is_palindromic(n) {
                if n > max {
                    max = n
                }
            }
        }
    }

    println!("max = {}", max);
}
