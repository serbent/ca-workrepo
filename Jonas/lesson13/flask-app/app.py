from flask import Flask, request
import redis
import os

app = Flask(__name__)

# Connect to Redis
redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = int(os.getenv('REDIS_PORT', 6379))
redis_client = redis.StrictRedis(host=redis_host, port=redis_port, decode_responses=True)

@app.route('/')
def home():
    redis_client.incr('hits')  # Increment the "hits" counter in Redis
    counter = redis_client.get('hits')
    return f"Hello, Flask! You've been visited {counter} times."

@app.route('/add-job', methods=['POST'])
def add_job():
    job_data = request.json.get('job')
    if job_data:
        redis_client.rpush('job_queue', job_data)  # Add job to the queue
        return f"Job '{job_data}' added to the queue.", 200
    return "No job data provided.", 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
