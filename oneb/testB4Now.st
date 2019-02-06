FileStream fileIn: 'b4now.st'.

#(10 21 32 43 54) b4Now: [:b4 :now| ((now-b4)/b4) asFloat oo].

#(1 2 3 5 6) b4Now: [:b4 :now| ((now-b4)/b4) asFloat oo].

"Expected output"
"1.1
0.5238095238095238
0.34375
0.2558139534883721
1.0
0.5
0.6666666666666666
0.2
FileStream
"