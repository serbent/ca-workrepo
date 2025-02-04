package main

import "fmt"

func main() {
	// fmt.Println("Hello, World!")

	// fmt.Println("This" + " is" + " a" + " string")
	// fmt.Println("2 + 1 + 3 =", second(2, 3))

	// fmt.Println("4 / 2 =", 5/2)

	// fmt.Println("3.0 / 2.5 =", 3/2.5)

	// fmt.Println(true && false)
	// fmt.Println(true || false)
	// fmt.Println(!true)

	// second := second(2, 3)

	// fmt.Println("2 + 3 =", second)

	const a = 2                  // integer
	const b = "this is a string" // string
	const c = 2.5                // float

	fmt.Println(a, b, c)

	fmt.Println("2 / 2.5 =", float64(a)/c)

	// c = 3.5 // error
}

func second(first int, second float32) int {
	return first + 1.0 + int(second)
}
