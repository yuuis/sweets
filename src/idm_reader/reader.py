import binascii
import nfc
import json
import requests
import threading
import os


MASTER_END_POINT = 'a'


class Reader(threading.Thread):
    def __init__(self, purchase_id):
        super(Reader, self).__init__()
        self.stop_event = threading.Event()
        self.master_end_point = MASTER_END_POINT
        self.purchase_id = purchase_id

    def stop(self):
        self.stop_event.set()

    def send_msg(self, idm, message):
        result = {
            "message": message,
            "body": {
                "idm": idm,
                "purchase_id": self.purchase_id
            }
        }
        response = requests.post(
            'http://0.0.0.0:3000/api/v1/purchases',
            json.dumps(result),
            headers={'Content-Type': 'application/json',
                     'access-token': 'Eh8yh0WSu7Rvosf5PEDL9Q',
                     'client': '9KrcjBex7cNsy7bOoTkEAg',
                     'uid': 'idmreader@test.com'}
        )
        print response.text
        return response

    def run(self, express=False):
        try:
            clf = nfc.ContactlessFrontend('usb')
        except IOError:
            self.send_msg(None, "FeliCa device error")
            return 0
        target_req = nfc.clf.RemoteTarget("212F")
        if express:
            target_req.sensf_req = bytearray.fromhex("0000030000")
        while True:
            if self.stop_event.is_set():
                clf.close()
                break
            target_res = clf.sense(target_req, iterations=10, interval=0.01)
            if target_res is not None:
                print binascii.hexlify(target_res.sensf_res)
                self.send_msg(binascii.hexlify(target_res.sensf_res), "success")
                clf.close()
                break
