from flask import Flask, request, jsonify, make_response
from reader import Reader

import time
import json


api = Flask(__name__)
task = None


@api.route('/api/v1/purchase', methods=['POST'])
def purchase():
    global task
    if task is not None:
        task.stop()
        del task
        time.sleep(0.5)
    try:
        data = json.loads(request.data)['id']
        print data
    except TypeError:
        return make_response(jsonify({"message": "bad json format"}), 400)
    task = Reader(data)
    task.start()
    return make_response(jsonify({"message": "accepted"}), 202)


@api.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': str(error)}), 404)


if __name__ == '__main__':
    api.run(host='0.0.0.0', port=3005, debug=True)
