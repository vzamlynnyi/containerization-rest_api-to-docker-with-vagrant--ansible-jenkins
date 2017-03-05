#!flask/bin/python

from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/')
def index():
    return "This is test task!"

from flask import request
from flask import abort
@app.route('/hello', methods=['POST'])
def return_uname():
    message = ""
    messages = []
    if 'username' in request.args:
#         uname = "Hello %s" % request.args['username'],
         message = {
            'username': request.args['username'],
            'description': "User Name was sent as url argument"
        }
    messages.append(message)
#    if request.method == 'POST':

    if request.json is not None and 'username' in request.json:
#     if 'username' in request.json:
        uname = "Hello %s" % request.json['username']
        print uname
        message = {
            'username': request.json['username'],
            'description': "User Name was sent as json"
        }
        messages.append(message)

#    return jsonify({'message': uname}), 201
    return jsonify({'message': messages}), 201

if __name__ == '__main__':
  app.run( 
        host="0.0.0.0",
        port=int("8101")
  )
