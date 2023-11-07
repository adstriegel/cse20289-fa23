# 
#   Go Irish server in Python
#   Binds REP socket to tcp://*:40000
#   Expects b"Go" from client, replies with b"Irish"
#

import time
import zmq

context = zmq.Context()
socket = context.socket(zmq.REP)

# Pick 40000 + last three digits of your 900 ID
socket.bind("tcp://*:40000")

while True:
    #  Wait for next request from client
    message = socket.recv()
    print(f"Received request: {message}")

    #  Do some 'work'
    time.sleep(1)

    #  Send reply back to client
    socket.send_string("irish")