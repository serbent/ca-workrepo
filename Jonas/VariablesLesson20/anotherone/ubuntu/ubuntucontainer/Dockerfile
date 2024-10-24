# Use the official Ubuntu base image
FROM ubuntu:24.04

# Install required packages (for example, bash, curl, etc.)
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the command to run when the container starts
CMD ["/bin/bash"]
