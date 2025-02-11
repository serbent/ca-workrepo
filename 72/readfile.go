package main

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
)

type Person struct {
	Name             string
	Age              int
	HairColor        string
	EyeColor         string
	Height           float64
	CountryResidence string
	Occupation       string
}

func ReadCSV(filename string) ([]Person, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	reader := csv.NewReader(file)
	records, err := reader.ReadAll()
	if err != nil {
		return nil, err
	}

	var people []Person
	for i, record := range records {
		if i == 0 {
			continue // Skip header row
		}
		age, _ := strconv.Atoi(record[1])
		height, _ := strconv.ParseFloat(record[4], 64)

		person := Person{
			Name:             record[0],
			Age:              age,
			HairColor:        record[2],
			EyeColor:         record[3],
			Height:           height,
			CountryResidence: record[5],
			Occupation:       record[6],
		}
		people = append(people, person)
	}

	return people, nil
}

func main() {
	people, err := ReadCSV("people.csv")
	if err != nil {
		fmt.Println("Error reading CSV:", err)
		return
	}

	for _, person := range people {
		fmt.Printf("%+v\n", person)
	}

}
