# Use the official Go image as a base
FROM golang:1.20

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files first to ensure dependencies are cached
COPY go.mod ./

# Download dependencies
RUN go mod tidy

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o backend .

# Expose the port the frontend server listens on
EXPOSE 8081

# Command to run the application
CMD ["./backend"]
