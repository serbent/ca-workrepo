package main

import "fmt"

type rect struct {
	width, height int
}

func (r *rect) area() int {
	return r.width * r.height
}

func (r *rect) perim() int {
	return 2*r.width + 2*r.height
}

func main() {
	r := rect{width: 10, height: 5}
	v := rect{width: 35, height: 25}

	rp := &r

	fmt.Println("area for R: ", r.area(), "Area for V: ", v.area())
	fmt.Println("perim:  for R", r.perim(), "Perim for V: ", v.perim())

	fmt.Println("area: ", rp.area())
	fmt.Println("perim: ", rp.perim())
}
