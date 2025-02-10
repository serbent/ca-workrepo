package main

import "fmt"

func sumsum(a, b int) int {
	return a + b // 1
}

func sumsumsum(a, b, c int) int {
	return a + b + c // 2
}

func multReturn() (int, string) {
	return 8, "nine" // 3
}

func variadParams(nums ...int) {
	fmt.Print(nums, " ")
	total := 0

	for _, num := range nums {
		total += num
	}
	fmt.Println(total) // 4
}

func testCount(x int) int {
	if x > 10 {
		return 0
	}
	fmt.Println(x)
	return testCount(x + 1)
} //5

func fibo(n int) int {
	if n < 2 {
		return n
	}

	return fibo(n-1) + fibo(n-2)
} //6

func main() {
	res := sumsum(3, 4)
	fmt.Println(res)

	ress := sumsumsum(3, 4, 10)
	fmt.Println(ress)

	a, b := multReturn()
	fmt.Println("A = ", a, "B = ", b)

	_, c := multReturn()
	fmt.Println(c)

	nums := []int{1, 2, 3, 4, 65, 76, 88, 12}
	variadParams(nums...)
	variadParams(1, 2, 3, 4, 5, 6, 67, 7, 8, 9, 9, 6, 6, 5, 4, 3, 3, 2) //4

	testCount(0) //5

	fmt.Println(fibo(8)) //6
}
