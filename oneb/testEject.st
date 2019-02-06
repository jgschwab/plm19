FileStream fileIn: 'eject.st'.

(#(1 2 3) eject: [:x | x = 2]) = #(1 3) ifFalse: AssertionError.

((1 to: 100) eject: [:x | x even]) = ((1 to: 99 by: 2) select: [:x | true]) ifFalse: AssertionError.


