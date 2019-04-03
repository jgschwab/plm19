import json
import pdb


def dom_score_handler(method, json_data):
    print(json_data)
    if method == "POST":
        table = Table(json.loads(json_data))
        table.calculate_dom_score()
        dom_scored_row = table.row
        print(dom_scored_row)
        return json.dumps(dom_scored_row), 200
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


def numNorm(x, xmin, xmax):
    return 0.5 if x is None else (x - xmin) / (xmax - xmin + 10**-32)


class Table:
    row = []
    sample = [[]]
    weights = []
    mins = []
    maxes = []

    def __init__(self, json_data):
        self.row = json_data["row"]
        self.sample = json_data["sample"]
        self.weights = json_data["weights"]
        self.mins = json_data["mins"]
        self.maxes = json_data["maxes"]

    def calculate_dom_score(self):
        domScore = 0
        for otherRow in self.sample:
            if self.dom(self.row, otherRow):
                domScore += 1 / len(self.sample)
        self.row.append(domScore)
        return

    def dom(self, row1, row2):
        pdb.set_trace()
        n = len(self.weights)
        s1, s2 = 0, 0
        for column, weight in enumerate(self.weights):
            a = numNorm(row1[column], self.mins[column], self.maxes[column])
            b = numNorm(row2[column], self.mins[column], self.maxes[column])
            s1 = s1 - 10**(weight * (a-b)/n)
            s2 = s2 - 10**(weight * (b-a)/n)
        return (s1 / n) < (s2 / n)
