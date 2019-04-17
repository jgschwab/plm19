def numNorm(x, xmin, xmax):
    return 0.5 if x is None else (x - xmin) / (xmax - xmin + 10**-32)

def dom(t, row1, row2, n):
    n = len(t.weights)
    for column,weight in enumerate(t.weights):
        a0 = row1[column]
        b0 = row2[column]
        a  = numNorm( row1[column], t.mins[column], t.maxes[column])
        b  = numNorm( row2[column], t.mins[column], t.maxes[column])
        s1 = s1 - 10**(weight * (a-b)/n)
        s2 = s2 - 10**(weight * (b-a)/n)
    return s1/n < s2/n

def doms(t,row,sample):
    domScore = 0
    for otherRow in sample:
        if dom(row1, otherRow):
            domScore += 1/ len(sample)
    row.append(domScore)
    return
