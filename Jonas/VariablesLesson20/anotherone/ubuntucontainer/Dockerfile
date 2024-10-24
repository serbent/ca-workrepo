# Use the official Ubuntu base image
FROM ubuntu:24.04

# Install required packages (including python3 for the HTTP server)
RUN apt-get update && apt-get install -y \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the directory for serving HTML files
RUN mkdir -p /var/www/html

# Create a simple HTML file to serve
RUN echo "<h1>Hello from Ubuntu Container!</h1>" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start a simple HTTP server
CMD ["python3", "-m", "http.server", "80", "--directory", "/var/www/html"]
