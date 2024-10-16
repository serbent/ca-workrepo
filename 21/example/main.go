package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"regexp"
)

type ContactInfo struct {
	Email   string `json:"email"`
	Phone   string `json:"phone"`
	Address string `json:"address"`
}

type Student struct {
	Name        string     `json:"name"`
	Age         int        `json:"age"`
	ContactInfo ContactInfo `json:"contact_info"`
}

// In-memory storage for students
var students []Student

// Function to validate student data
func validateStudent(student Student) error {
	if student.Name == "" || len(student.Name) < 3 {
		return fmt.Errorf("name must be at least 3 characters long")
	}

	if student.Age < 18 || student.Age > 100 {
		return fmt.Errorf("age must be between 18 and 100")
	}

	if !isValidEmail(student.ContactInfo.Email) {
		return fmt.Errorf("invalid email format")
	}

	if !isValidPhone(student.ContactInfo.Phone) {
		return fmt.Errorf("invalid phone number")
	}

	if student.ContactInfo.Address == "" {
		return fmt.Errorf("address is required")
	}

	return nil
}

// Function to validate email format
func isValidEmail(email string) bool {
	re := regexp.MustCompile(`^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$`)
	return re.MatchString(email)
}

// Function to validate phone number
func isValidPhone(phone string) bool {
	re := regexp.MustCompile(`^\+?[0-9]{7,15}$`)
	return re.MatchString(phone)
}

// Handler for adding a new student
func addStudentHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	var student Student
	err := json.NewDecoder(r.Body).Decode(&student)
	if err != nil {
		http.Error(w, "Invalid JSON format", http.StatusBadRequest)
		return
	}

	// Validate the student data
	err = validateStudent(student)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Store the student in memory (you could store it in a DB)
	students = append(students, student)

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"message": "student added successfully"})
}

// Handler to list all students
func getStudentsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(students)
}

// Main function to set up the server
func main() {
	http.HandleFunc("/students", addStudentHandler) // Endpoint to add a student
	http.HandleFunc("/students/list", getStudentsHandler) // Endpoint to list students

	fmt.Println("Server is running on port 8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("Error starting server:", err)
	}
}

