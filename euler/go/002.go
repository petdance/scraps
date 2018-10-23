package main

/*

http://projecteuler.net/index.php?section=problems&id=2

Each new term in the Fibonacci sequence is generated by adding the
previous two terms. By starting with 1 and 2, the first 10 terms
will be:

    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do
not exceed four million, find the sum of the even-valued terms.

*/

import "fmt"

func main() {

    var fib [10000] int

    fib[1] = 1
    fib[2] = 1

    n := 2
    total := 0
    for fib[n] < 4000000 {
        n += 1
        fib[n] = fib[n-1] + fib[n-2]
        if fib[n] % 2 == 0 {
            total += fib[n]
        }
    }
    fmt.Println( total )
}
