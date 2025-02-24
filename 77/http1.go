package main

import (
	"log"
	"net/http"
)

var tmpl1 = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Code Academy Final Go Lecture!!!</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
        h1 { color: #333; }
    </style>
</head>
<body>
    <h1>`
var tmpl2 = `</h1>
    <p>Welcome to my simple Go web server!</p>
</body>
</html>`

func homePage(w http.ResponseWriter, r *http.Request) {
	log.Println("Endpoint Hit: homePage")
	w.Write([]byte(tmpl1 + "Welcome to the Home Page!" + tmpl2))
}

func aboutPage(w http.ResponseWriter, r *http.Request) {
	log.Println("Endpoint Hit: aboutPage")
	w.Write([]byte(tmpl1 + "Welcome to the About Page!" + " Your IP is: " + r.RemoteAddr + tmpl2))
}

func contactPage(w http.ResponseWriter, r *http.Request) {
	log.Println("Endpoint Hit: contactPage")
	w.Write([]byte(tmpl1 + "Welcome to the Contact Page!" + tmpl2))
}

func handleRequest() {
	http.HandleFunc("/", homePage)
	http.HandleFunc("/about", aboutPage)
	http.HandleFunc("/contact", contactPage)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func main() {
	handleRequest()
}
