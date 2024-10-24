from celery import Celery
import time

# Configure the Celery app
app = Celery('tasks', broker='redis://cache:6379/0')

@app.task
def long_running_task():
    print("Task started...")
    time.sleep(5)  # Simulate a long-running task
    print("Task completed.")
    return "Task finished successfully!"

# Sample task to handle incoming requests
if __name__ == '__main__':
    app.start()
