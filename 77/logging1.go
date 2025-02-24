package main

import (
	"log"
)

const (
	Ldate = iota
	Ltime
	Lmicroseconds
	Llongfile
	Lshortfile
	LUTC
	Lmsgprefix
	LstdFlags = Ldate | Ltime
)

func main() {
	log.Println("Hello, World!")
	log.SetFlags(log.Ldate)
	log.Println("Log to the console with date prependendt")
	log.SetFlags(log.Ltime)
	log.Println("Log to the console with date prependendt")
	log.SetFlags(log.Ldate | log.Ltime)
	log.Println("Log to the console with date and time prependendt")
	log.SetFlags(log.Lshortfile)
	log.Println("Log to the console with file name prependendt")
	log.SetFlags(log.Llongfile)
	log.Println("Log to the console with file name prependendt")
	log.SetFlags(log.LstdFlags)
	log.Println("Log to the console with date and time prependendt")
}
