package main

import (
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"net/http"
)

// Struct for passing data to the template
type PageData struct {
	CurrentTime string
}

func main() {
	// Serve the frontend page
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// Call the backend API
		resp, err := http.Get("http://backend-service:8080/time") // Update with the backend API URL
		if err != nil {
			http.Error(w, "Failed to call backend API", http.StatusInternalServerError)
			log.Println("Error calling API:", err)
			return
		}
		defer resp.Body.Close()

		// Read the API response
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			http.Error(w, "Failed to read API response", http.StatusInternalServerError)
			log.Println("Error reading API response:", err)
			return
		}

		// Render the HTML page
		data := PageData{CurrentTime: string(body)}
		tmpl := template.Must(template.ParseFiles("index.html"))
		tmpl.Execute(w, data)
	})

	// Start the frontend server
	fmt.Println("Frontend server running on http://localhost:8081")
	log.Fatal(http.ListenAndServe(":8081", nil))
}
