package main

import (
	"log"
	"time"
)

const (
	YYYYMMDD  = "2006/01/02"
	HHMMSS24h = "16:04:05"
)

func main() {
	log.SetFlags(log.Ldate | log.Ltime)
	log.Println("Hello, World!")

	flags := log.Lshortfile

	datetime := time.Now().Format(YYYYMMDD + " " + HHMMSS24h)

	log.Println("Without log levels")

	log.SetFlags(flags)
	log.SetPrefix(datetime + " [INFO] ")
	log.Println("INFO level")
	log.SetPrefix(datetime + " [ERROR] ")
	log.Println("ERROR level")
	log.SetPrefix(datetime + " [DEBUG] ")
	log.Println("DEBUG level")
	log.SetPrefix(datetime + " [WARNING] ")
	log.Println("WARNING level")
	log.SetPrefix(datetime + " [CRITICAL] ")
	log.Println("CRITICAL level")
}
