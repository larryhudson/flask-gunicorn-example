from flask import Flask, request, jsonify
from langchain.llms import OpenAI

app = Flask(__name__)

@app.route('/', methods=['POST'])
def home():
    # get json from request
    # get text from json

    json = request.get_json()
    text = json['text']

    llm = OpenAI(temperature=0.9)

    answer = llm(text)
    print(answer)

    return jsonify({'text': answer})