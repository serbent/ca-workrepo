package main

import (
	"fmt"
	"net/http"
	"time"
)

func main() {
	// Define the handler for the "/time" endpoint
	http.HandleFunc("/time", func(w http.ResponseWriter, r *http.Request) {
		// Get the current time
		currentTime := time.Now().Format("2006-01-02 15:04:05")

		// Create the response
		response := fmt.Sprintf("Current Time is %s", currentTime)

		// Write the response
		w.WriteHeader(http.StatusOK)
		w.Header().Set("Content-Type", "text/plain")
		w.Write([]byte(response))
	})

	// Start the server on port 8080
	fmt.Println("Server is running on http://backend:8080")
	http.ListenAndServe(":8080", nil)
}
