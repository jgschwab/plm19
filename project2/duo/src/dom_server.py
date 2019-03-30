from flask import (Flask, request, jsonify)

app = Flask(__name__)


@app.route("/domScoredData", methods=["POST"])
def dom_score_from_request():
    request_data = request.get_json()

    rows = DataRows(request_data)

    return jsonify(calculate_dom_score(rows))


def calculate_dom_score(data):
    # Stub method. Returns a list of dom scores
    return [0.5, 0.9, 0.6]


class DataRows:
    rows = []
    weights = []

    def __init__(self, json_data):
        self.rows = json_data["rows"]
        self.weights = json_data["weights"]


if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000")
