from flask import Flask,request
#from flask.ext.script import Manager

from socket import gethostname
import netifaces

app = Flask(__name__)

@app.route("/")
def whereami():
    res = 'Hostname: ' + gethostname() + '\n'
    for interface in netifaces.interfaces():
        for link in netifaces.ifaddresses(interface)[netifaces.AF_INET]:
            res += 'IP: ' + link['addr'] + '\n'
    for k,v  in request.headers:
        res += "{}: {}\n".format(k,v)
    return res

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int('80'))
