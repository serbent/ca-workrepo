package main

import "fmt"

func main() {

	// message := make(chan string) // 1

	// go func() { message <- "ping" }() // 2

	// msg := <-message // 3

	// fmt.Println(msg) // 4

	m2 := make(chan string, 3) // 5
	m2 <- "buffered"           // 6
	m2 <- "channel"
	m2 <- "ThisWillFit" // 7
	fmt.Println(<-m2)   // 8
	fmt.Println(<-m2)   // 9
	fmt.Println(<-m2)   // 10

}
