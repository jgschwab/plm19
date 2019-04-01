#! /usr/bin/python3

import sys
import json

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

# get the rest of the data in chunks

it.getNextLine()
while len(it.line) > 0: # runs for each batch
  data = []
  i = 0
  while len(it.line) > 0 and i < 10 :
    row = []
    token = it.getNext()
    while len(token) > 0 : 
      row.append(parse(token))
      token = it.getNext()
    data.append(row)
    it.getNextLine()
    i += 1
  print("{\"weights\": " + json.dumps(weights) + ", \"rows\": " +  json.dumps(data) + "}")
  it.getNextLine()
  















  
