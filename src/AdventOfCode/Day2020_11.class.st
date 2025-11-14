"
Solution for AoC 2020 day 11
"
Class {
	#name : 'Day2020_11',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_11 >> initialize [ 
	super initialize .
	day := 11 .
	year := 2020 .
	name := 'Seating System' .
	^ self .
]

{ #category : 'accessing' }
Day2020_11 >> input [
	^ input .
]

{ #category : 'testing' }
Day2020_11 >> isOccupiedSeatVisibleFrom: coord towards: offset atDistance: distance inMap: seatMap [
	|c count|
	c := coord + offset .
	count := 0 .
	[(seatMap extent contains: c) and: [ count < distance ] ] whileTrue: [ 
		((seatMap at: c) = $.) ifFalse: [ ^ (seatMap at: c) = $# ] .
		c := c + offset .
		count := count + 1 .
	] .
	
	^ false .

]

{ #category : 'execution' }
Day2020_11 >> iteratePartOne: seatMap [
	|updatedMap changeCount|
	changeCount := 0 .
	updatedMap := AOCGrid new .
	updatedMap default: $.; rule: AOCAdjacency queen .
	
	seatMap coords do: [ :c |
		|occupiedSeats neighbors currentValue updatedValue|
		currentValue := seatMap at: c .
		neighbors := (seatMap neighborsAt: c) collect: [ :n | seatMap at: n ] .

		occupiedSeats := 0 .
		neighbors do: [ :value |
			(value = $#) ifTrue: [ occupiedSeats := occupiedSeats + 1 ] ].
		
		updatedValue := self updatedSeatState: (currentValue = $#) numOccupied: occupiedSeats .
		
		updatedMap at: c put: updatedValue .
		(currentValue ~= updatedValue) ifTrue: [ changeCount := changeCount + 1 ].
	] .

	^ {changeCount. updatedMap} .
]

{ #category : 'execution' }
Day2020_11 >> iteratePartTwo: seatMap [
	|updatedMap changeCount offsets|

	changeCount := 0 .
	updatedMap := AOCGrid new .
	offsets := AOCAdjacency queen directions collect: [ :d | AOCCoord offset: d ] .
	
	seatMap coords do: [ :c |
		|occupiedSeats currentValue updatedValue|
		currentValue := seatMap at: c .

		occupiedSeats := 0 .
		offsets do: [ :off |
			(self isOccupiedSeatVisibleFrom: c towards: off atDistance: 1000 inMap: seatMap)
				ifTrue: [ occupiedSeats := occupiedSeats + 1 ] .
		].

		updatedValue := self updatedSeatState: (currentValue = $#) numVisible: occupiedSeats .
		
		updatedMap at: c put: updatedValue .
		(currentValue ~= updatedValue) ifTrue: [ changeCount := changeCount + 1 ].
	] .

	^ {changeCount. updatedMap} .
]

{ #category : 'execution' }
Day2020_11 >> solve [
	|p1 p2 seatMap|
	self loadGroupedInputForTest: self isTest .
	
	seatMap := AOCGrid newWith: input first .
	seatMap rule: AOCAdjacency queen .
	
	p1 := self solvePart: 1 seatMap: seatMap .
	p2 := self solvePart: 2 seatMap: seatMap .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_11 >> solvePart: part seatMap: seatMap [
	|currentMap changeCount iterateResult|
	
	currentMap := seatMap .
	changeCount := -1 .
	[changeCount ~= 0]
		whileTrue: [ 
			iterateResult := 
				(part = 1) 
					ifTrue: [self iteratePartOne: currentMap]
					ifFalse: [self iteratePartTwo: currentMap ] .
			changeCount := iterateResult first .
			currentMap := iterateResult last .
		] .
	
	^ (currentMap coordsWithValue: $#) size .
]

{ #category : 'execution' }
Day2020_11 >> updatedSeatState: isOccupied numOccupied: o [
	isOccupied
		ifTrue: [ 
			(o >= 4) ifTrue: [ ^ $L ] ifFalse: [ ^ $# ] .
		]
		ifFalse: [ 
			(o = 0) ifTrue: [ ^ $# ] ifFalse: [ ^ $L ] .
		] .

]

{ #category : 'execution' }
Day2020_11 >> updatedSeatState: isOccupied numVisible: v [
	isOccupied
		ifTrue: [ 
			(v >= 5) ifTrue: [ ^ $L ] ifFalse: [ ^ $# ] .
		]
		ifFalse: [ 
			(v = 0) ifTrue: [ ^ $# ] ifFalse: [ ^ $L ] .
		] .

]
