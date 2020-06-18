/*

http://projecteuler.net/index.php?section=problems&id=5

2520 is the smallest number that can be divided by each of the
numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by
all of the numbers from 1 to 20?

*/


fn divisible_up_to(n: u64, max_divisor: u64) -> bool {
    for i in 2..=max_divisor {
        if n % i > 0 {
            return false;
        }
    }
    return true;
}

fn smallest_multiple_of(max_divisor: u64, step: u64) -> u64 {
    let mut maybe = step;

    loop {
        if divisible_up_to(maybe, max_divisor) {
            return maybe;
        }
        maybe = maybe + step;  /* No point in checking the odd numbers */
    }
}

fn main() {
    let mut step = 1;
    for max_divisor in 1..=46 {
        let smo = smallest_multiple_of(max_divisor, step);
        println!("smallest multiple of 1..{} is {}", max_divisor, smo);
        step = smo;
    }
}


/*
def divisible_up_to( n, top_divisor )
    2.upto( top_divisor ) { |i|
        if ( n % i != 0 )
            return false
        end
    }
    return true
end

maybe = 420
while !divisible_up_to( maybe, 19 )
    maybe += 420
end
print maybe, "\n"

*/
