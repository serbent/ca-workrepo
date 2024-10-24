# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Command to run your worker (this depends on how you've implemented it)
CMD ["celery", "-A", "worker", "worker", "--loglevel=info"]
