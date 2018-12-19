from flask import Flask, request, jsonify, make_response
from reader import Reader

import time


api = Flask(__name__)
task = None


@api.route('/api/v1/purchase', methods=['GET', 'POST'])
def purchase():
    global task
    if request.method == 'GET':
        if task is not None:
            task.stop()
            del task
            time.sleep(0.5)
        task = Reader(request.data['body']['purchase_id'])
        task.start()
        return make_response(jsonify({"message": "accepted"}), 202)


@api.errorhandler(404)
def not_found():
    return make_response(jsonify({'error': 'Not found'}), 404)


if __name__ == '__main__':
    api.run(host='0.0.0.0', port=3005)