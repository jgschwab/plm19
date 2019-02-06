" Author Mandy Shafer "

! SequenceableCollection methods !
b4Now: aBlock
	 2 to: self size do: [:x | aBlock value: (self at: (x-1)) value: (self at: x)].
!!