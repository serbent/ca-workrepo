import redis
import time
import os

# Connect to Redis
redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = int(os.getenv('REDIS_PORT', 6379))
redis_client = redis.StrictRedis(host=redis_host, port=redis_port, decode_responses=True)

# Define the name of the queue
queue_name = 'job_queue'

def process_jobs():
    while True:
        # Block until a job is available in the queue
        job = redis_client.blpop(queue_name)  # Pops the job from the queue
        if job:
            print(f"Processing job: {job[1]}")
            # Simulate doing some work
            time.sleep(2)  # Simulate time taken to process the job

if __name__ == '__main__':
    print("Worker started, waiting for jobs...")
    process_jobs()
