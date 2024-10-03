package main

import (
	"context"
	"encoding/json"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var tpl = template.Must(template.ParseFiles("form.html", "list.html"))

type Address struct {
	City       string `json:"city"`
	Street     string `json:"street"`
	HouseNumber int    `json:"houseNumber"`
}

type Student struct {
	Name    string  `json:"name"`
	Age     int     `json:"age"`
	Address Address `json:"address"`
}

var mongoClient *mongo.Client
var db *mongo.Database

// MongoDB Connection
func connectToMongo() {
	uri := os.Getenv("MONGO_URI") // Read Mongo URI from environment variable
	if uri == "" {
		log.Fatal("MONGO_URI is not set")
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	clientOptions := options.Client().ApplyURI(uri)
	client, err := mongo.Connect(ctx, clientOptions)
	if err != nil {
		log.Fatalf("Failed to connect to MongoDB: %v", err)
	}

	mongoClient = client
	db = client.Database("school") // Use "school" database
	fmt.Println("Connected to MongoDB")
}

// Handler to render the form
func formHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		tpl.ExecuteTemplate(w, "form.html", nil)
		return
	}

	name := r.FormValue("name")
	age, err := strconv.Atoi(r.FormValue("age"))
	if err != nil {
		http.Error(w, "Invalid age", http.StatusBadRequest)
		return
	}
	city := r.FormValue("city")
	street := r.FormValue("street")
	houseNumber, err := strconv.Atoi(r.FormValue("houseNumber"))
	if err != nil {
		http.Error(w, "Invalid house number", http.StatusBadRequest)
		return
	}

	// Create the student struct
	student := Student{
		Name: name,
		Age:  age,
		Address: Address{
			City:       city,
			Street:     street,
			HouseNumber: houseNumber,
		},
	}

	// Insert the student into MongoDB
	collection := db.Collection("students")
	_, err = collection.InsertOne(context.TODO(), student)
	if err != nil {
		http.Error(w, "Failed to insert into MongoDB", http.StatusInternalServerError)
		return
	}

	fmt.Fprintf(w, "Student added successfully!")
}

// Handler to display all students in an HTML table
func listHandler(w http.ResponseWriter, r *http.Request) {
	collection := db.Collection("students")

	// Retrieve all students from the collection
	cursor, err := collection.Find(context.TODO(), bson.D{})
	if err != nil {
		http.Error(w, "Failed to retrieve students", http.StatusInternalServerError)
		return
	}
	defer cursor.Close(context.TODO())

	// Create a slice to hold the students
	var students []Student
	for cursor.Next(context.TODO()) {
		var student Student
		if err := cursor.Decode(&student); err != nil {
			http.Error(w, "Failed to decode student data", http.StatusInternalServerError)
			return
		}
		students = append(students, student)
	}

	// Render the students in a table using the list.html template
	tpl.ExecuteTemplate(w, "list.html", students)
}

// Handler to display all students as raw JSON
func rawHandler(w http.ResponseWriter, r *http.Request) {
	collection := db.Collection("students")

	// Retrieve all students from the collection
	cursor, err := collection.Find(context.TODO(), bson.D{})
	if err != nil {
		http.Error(w, "Failed to retrieve students", http.StatusInternalServerError)
		return
	}
	defer cursor.Close(context.TODO())

	// Create a slice to hold the students
	var students []Student
	for cursor.Next(context.TODO()) {
		var student Student
		if err := cursor.Decode(&student); err != nil {
			http.Error(w, "Failed to decode student data", http.StatusInternalServerError)
			return
		}
		students = append(students, student)
	}

	// Write the students as JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(students)
}

func main() {
	// Connect to MongoDB
	connectToMongo()

	// Serve form at root endpoint
	http.HandleFunc("/", formHandler)

	// Serve list of students in a table at /list
	http.HandleFunc("/list", listHandler)

	// Serve raw student data as JSON at /raw
	http.HandleFunc("/raw", rawHandler)

	// Start the server
	fmt.Println("Server started at http://localhost:8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

