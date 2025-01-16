# Use the official Go image as a base
FROM golang:1.20

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the Go application
RUN go build -o frontend .

# Expose the port the frontend server listens on
EXPOSE 8081

# Command to run the application
CMD ["./frontend"]
