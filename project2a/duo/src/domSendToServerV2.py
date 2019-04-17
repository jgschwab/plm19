#! /usr/bin/python3

import sys
import json
import random


# get rid of all the starting BS
sys.stdin.readline()
sys.stdin.readline()
sys.stdin.readline()


########  CSV ITERATOR ########

class CsvIterator:
  def __init__(self):
    self.line = ""
    self.idx = 0

  def getNextLine(self):
    try:
      self.line = sys.stdin.readline()
      self.idx = 0
    except:
      self.line = ""
      
  def getNext(self):
    s = ""
    while self.line[self.idx] not in [',','\n']:
      #print(self.line[self.idx])
      s += self.line[self.idx]
      self.idx += 1    
    # ASSERT line[idx] is ',' or '\n'
    if self.line[self.idx] != '\n':
      self.idx += 1
    return s
    
###############################  


it = CsvIterator()

# create header (weights)
it.getNextLine()
token = it.getNext()
weights = []

while len(token) > 0:
  if token[0] == '>':
    weights.append(1)
  elif token[0] == "<":
    weights.append(-1)
  else:
    weights.append(0)
  token = it.getNext()
    
#print(json.dumps(weights))

def parse(token):
  try:
    return int(token)
  except ValueError:
    try: 
      return float(token)
    except ValueError:
      return token



it.getNextLine()
data = []
maxes = [-999999999] * 8
mins =   [999999999] * 8

while len(it.line) > 0:
    row = [] 
    token = it.getNext()
    i = 0
    while len(token) > 0:
        t = parse(token)
        if isinstance(t, int) or isinstance(t, float):
            if maxes[i] < t:
                maxes[i] = t
            if mins[i] > t:
                mins[i] = t
        row.append(t)
        token = it.getNext()
        i += 1
    data.append(row)
    it.getNextLine()

#print(data)
#print(maxes)
#print(mins)
n = 100
for i in range(len(data)):
    sample = random.sample(data, n)
    row = data[i]
    
    print("{\"weights\": " + json.dumps(weights) + ", \"row\": " +  json.dumps(data[i]) + ", \"sample\":" + json.dumps(sample) + ", \"mins\":" + json.dumps(mins) + ", \"maxes\":" + json.dumps(maxes) + "}")
  















  
