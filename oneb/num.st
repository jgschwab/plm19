Magic sub: #Num has: 'n mu m2 sd id lo hi txt w'

!Num methodsFor: 'instance initialization'!
init
    n := 0.
    mu := 0.
    m2 := 0.
    sd := 0 asFloatD.
    id := nil.
    lo := (-1 * (10 raisedTo: 32)).
    hi := (10 raisedTo: 32).
    txt := nil.
    w := 1 !
!

!Num methodsFor: 'adding/removing numbers'!
numInc: x
    | d |
    (x = '?')
        ifTrue: [^x].
    n := n + 1.
    d := x - mu.
    mu := mu + (d / n).
    m2 := m2 + (d * (x - mu)).
    (x > hi)
        ifTrue: [hi := x].
    (x < lo)
        ifTrue: [lo := x].
    (n > 1)
        ifTrue: [sd := (m2 / (n - 1 + (10 raisedTo: -32))) raisedTo: 0.5].
    ^x
!

numDec: x
    | d |
    (x = '?')
        ifTrue: [^x].
    (n = 1)
        ifTrue: [^x].
    n := n - 1.
    d := x - mu.
    mu := mu - (d / n).
    m2 := m2 - (d * (x - mu)).
    (n > 1)
        ifTrue: [sd := (m2 / (n - 1 + (10 raisedTo: -32))) raisedTo: 0.5].
    ^x
!!

!Num methodsFor: 'gathering a collection of numbers'!
nextPutAll: x
    "TODO: recalculate instance variables based on input list"
    x do: [ :item | self numInc: item ]
    
!!

