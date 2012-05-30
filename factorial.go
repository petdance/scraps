package main

import "fmt"

func main() {
    //A Channel to send integers to calculate
    integers := make(chan int64)

    //A channel for the factorial goroutine to send results to be displayed
    results := make(chan int64)
    done := make(chan bool) //Goroutine to calculate factorial

    go factorial(integers, results) //Goroutine to display results
    go display(results, done)

    //Generate integers and send them on the integer channel
    generateIntegers(integers)

    //Receive a value on the done channel and discard it
    //effectively blocking program termination until
    //communication occurs on this channel
    <-done
}

func factorial(c chan int64, results chan int64) {
    for {
        i, ok := <-c
            if !ok {
                // channel is closed, so we are done
                break
            }
        var fact int64
            fact = 1
            for {
                fact = fact * i
                    i = i - 1
                    if i <= 1 {
                        break
                    }
            }
        results <- fact
    }
    close(results)
}

func generateIntegers(c chan int64) {
    var x int64
        for x = 1; x < 11; x++ { c <- x
        }
    //Close the channel to signify that we //have no more values to send
    close(c)
}

func display(results chan int64, completed chan bool) {
    for {
        i, ok := <-results
            if !ok {
                // channel is closed, so we are done
                break
            }
        fmt.Println(i)
    }
    //Signify to main that we're done
    completed <- true
}
