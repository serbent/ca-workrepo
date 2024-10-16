# Step 1: Build the Go binary
FROM golang:1.20-alpine AS builder
# Set the Current Working Directory inside the container
WORKDIR /app
COPY main.go ./
RUN go mod init go-student-api

# Download all Go modules
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Step 2: Build a small image to run the Go binary
FROM alpine:latest

# Set up certificates (needed for Go apps using HTTPS)
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from the builder
COPY --from=builder /app/main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the binary
CMD ["./main"]
