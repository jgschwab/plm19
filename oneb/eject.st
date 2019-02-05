! Collection methods !

    eject: aBlock
        ^self select: [:x | (aBlock value: x) = false].
!!
