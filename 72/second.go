package main

import (
	"fmt"
	"maps"
)

func main() {

	m := make(map[string]int)
	_, prs := m["k2"]
	fmt.Println("prs:", prs)

	n := map[string]int{"foo": 1, "bar": 3}
	fmt.Println("map:", n)

	n2 := map[string]int{
		"foo": 1,
		"bar": 2,
	}
	if maps.Equal(n, n2) {
		fmt.Println("n and n2 are equal")
	} else {
		fmt.Println("n and n2 are not equal")
	}

}
