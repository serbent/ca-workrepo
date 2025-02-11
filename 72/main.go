package main

import "fmt"

func main() {

	m := make(map[string]int)

	m["k1"] = 7
	m["k2"] = 13
	m["k3"] = 16
	m["k4"] = 14

	fmt.Println("map:", m)

	v := m["k1"]
	fmt.Println("v:", v)

	v3 := m["k3"]
	fmt.Println("v3:", v3)

	fmt.Println("len:", len(m))

	delete(m, "k2")

	fmt.Println("map:", m)

	clear(m)
	fmt.Println("map:", m)

}
