FileStream fileIn: 'eject.st'.
FileStream fileIn: 'my.st'.

(#(1 2 3) eject: [:x | x = 2]) = #(1 3) ifTrue: ['eject test 1 passed' oo] ifFalse: ['eject test 1 failed' oo].

((1 to: 100) eject: [:x | x even]) = ((1 to: 99 by: 2) select: [:x | true]) ifTrue: ['eject test 2 passed' oo] ifFalse: ['eject test 2 failed' oo].


