! Collection methods !
visit: aBlock
        self do: [:x | x visit: aBlock]!!

! String methodsFor: 'visit' !
visit: aBlock
	aBlock value: self!!

! Object methods !
visit: aBlock
  aBlock value: self!!


