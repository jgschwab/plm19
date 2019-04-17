#! /usr/bin/python3

import sys
import csv
import json

# get rid of all the starting BS
x = sys.stdin.readline()
x = sys.stdin.readline()
x = sys.stdin.readline()
sys.stdout.write(x)

reader = csv.reader(sys.stdin)
row = next(reader)

while row:
  batch = ""
  i = 0
  batch += '{'
  while row and i < 10:
    batch += json.dumps(row)
    try:
      row = next(reader)
    except:
      row = ''
    if(row and i is not 9):
      batch += ',' #dat fencepost
    i+=1
  batch += '}'
  print(batch)
  try:
    row = next(reader)
  except:
    row = ''
  #while(x):
  #  sys.stdout.write(x)
  #  x = sys.stdin.readline()
