/*

http://projecteuler.net/index.php?section=problems&id=5

2520 is the smallest number that can be divided by each of the
numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by
all of the numbers from 1 to 20?

*/


fn divisible_up_to(n: u32, max_divisor: u32) -> bool {
    for i in 2..=max_divisor {
        if n % i > 0 {
            return false;
        }
    }
    return true;
}

fn main() {
    let max_divisor = 20;
    let step = 2520;  /* We know the number has to be divisible by 210: divisible by 7, 8, 9 and 10 */
    let mut maybe = step;

    loop {
        if divisible_up_to(maybe, max_divisor) {
            println!("{} is divisible up to {}", maybe, max_divisor);
            break;
        }
        maybe = maybe + step;  /* No point in checking the odd numbers */
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
