from flask import Flask, jsonify
from worker import long_running_task

app = Flask(__name__)

@app.route('/run-task', methods=['GET'])
def run_task():
    task = long_running_task.delay()  # Trigger the Celery task
    return jsonify(message="Task has been triggered!"), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
