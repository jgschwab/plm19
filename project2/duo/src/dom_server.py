import json


def dom_score_handler(method, json_data):
    print(json_data)
    if method == "POST":
        rows = DataRows(json.loads(json_data))
        return json.dumps(calculate_dom_score(rows)), 200
    else:
        return "Unsupported method", 405


handlers = {
        "domScoredData": dom_score_handler
        }


def mock_request(method, endpoint, *args):
    """
    Main interface to server.
    Simulates an http call with the given method at the specified url
    Always returns string response and integer status code
    """
    handler_function = handlers.get(endpoint)
    if not handler_function:
        return "Request handler not found", 404
    else:
        return handler_function(method, args[0])


def calculate_dom_score(data):
    # Stub method. Returns a list of dom scores
    return [0.5, 0.9, 0.6]


class DataRows:
    rows = []
    weights = []

    def __init__(self, json_data):
        self.rows = json_data["rows"]
        self.weights = json_data["weights"]
