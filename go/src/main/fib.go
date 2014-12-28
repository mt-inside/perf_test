package main

const threads = 10000
const fib_depth = 10

func main( ) {

    done := make( chan int )
    finished := 0
    var res int

    for i := 0; i < threads; i++ {
	go fib( i, done )
    }

    for
    {
	res = <- done
	if res != 144 { panic("wrong answer") }
	if finished++; finished == threads { break }
    }
}

func fib( idx int, done chan int ) {

    f := 1; f_old := 1

    for i := 0; i < fib_depth; i++ {

	f, f_old = f + f_old, f
    }

    done <- f
}
