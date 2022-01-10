import os
import socket

from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    addr, _ = socket.getnameinfo((os.environ['NODE_NAME'], 0), 0)
    return render_template("index.html",
                           cluster_name=os.environ['CLUSTER_NAME'],
                           node_name=addr,
                           pod_name=os.environ['POD_NAME'])


if __name__ == '__main__':
    app.run()
