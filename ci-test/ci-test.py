#!/usr/bin/python3
from flask import Flask, request

app = Flask(__name__)


@app.route("/hello")
def apicall_hello():
    return "Hello\n"

@app.route("/commit-id")
def apicall_commit_id():
    return "Return commit ID\n"


app.run(host="0.0.0.0", port=5050)