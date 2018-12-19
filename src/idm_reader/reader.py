from flask import Flask, request, jsonify, make_response

import binascii
import nfc
import json
import requests
import pprint
import threading
import time

api = Flask(__name__)
task = None
MASTER_END_POINT = 'http://HOST_NAME/api/v1/purchase'


class Reader(threading.Thread):
    def __init__(self, purchase_id):
        super(Reader, self).__init__()
        self.stop_event = threading.Event()
        self.master_end_point = MASTER_END_POINT
        self.purchase_id = purchase_id

    def stop(self):
        self.stop_event.set()

    def run(self, express=False):
        clf = nfc.ContactlessFrontend('usb')
        target_req = nfc.clf.RemoteTarget("212F")
        if express:
            target_req.sensf_req = bytearray.fromhex("0000030000")
        while True:
            if self.stop_event.is_set():
                clf.close()
                print "stop"
                break
            target_res = clf.sense(target_req, iterations=10, interval=0.01)
            if target_res is not None:
                result = {
                    "message": "success",
                    "body": {
                        "idm": binascii.hexlify(target_res.sensf_res),
                        "purchase_id": "1"
                    }
                }
                response = requests.post(
                    self.master_end_point,
                    json.dumps(result),
                    headers={'Content-Type': 'application/json'})
                pprint.pprint(response)
                clf.close()
                break


@api.route('/api/v1/purchase', methods=['GET', 'POST'])
def purchase():
    global task
    if request.method == 'GET':
        if task is not None:
            task.stop()
            del task
            time.sleep(0.5)
        task = Reader(request.data['purchase_id'])
        task.start()
        return make_response(jsonify({"message": "accepted"}), 201)


@api.errorhandler(404)
def not_found():
    return make_response(jsonify({'error': 'Not found'}), 404)


if __name__ == '__main__':
    api.run(host='0.0.0.0', port=3005)
