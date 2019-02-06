" Author: Jeremy Schmidt "
" Modified: 5 Feb 2019 "
! Collection methods !

    eject: aBlock
    " Implementation of 'reject' but using 'select'. "
    " Simply passes an inverted version of the closure to select "
        ^self select: [:x | (aBlock value: x) = false].
!!
