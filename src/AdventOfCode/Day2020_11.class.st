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
Day2020_11 >> iteratePart: seatMap allowedDistance: dist peopleTolerance: tolerance [
	|updatedMap changeCount offsets|

	changeCount := 0 .
	updatedMap := AOCGrid new .
	offsets := AOCAdjacency queen directions collect: [ :d | AOCCoord offset: d ] .
	
	seatMap coords do: [ :c |
		|occupiedSeats currentValue updatedValue|
		currentValue := seatMap at: c .

		occupiedSeats := 0 .
		offsets do: [ :off |
			(self isOccupiedSeatVisibleFrom: c towards: off atDistance: dist inMap: seatMap)
				ifTrue: [ occupiedSeats := occupiedSeats + 1 ] .
		].

		updatedValue := self updatedSeatState: (currentValue = $#) numVisible: occupiedSeats allowedVisible: tolerance .
		
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
	[changeCount = 0]
		whileFalse: [ 
			iterateResult := 
				(part = 1) 
					ifTrue: [self iteratePart: currentMap allowedDistance: 1 peopleTolerance: 4]
					ifFalse: [self iteratePart: currentMap allowedDistance: 1000 peopleTolerance: 5] .
			changeCount := iterateResult first .
			currentMap := iterateResult last .
		] .
	
	^ (currentMap coordsWithValue: $#) size .
]

{ #category : 'execution' }
Day2020_11 >> updatedSeatState: isOccupied numVisible: v allowedVisible: allowed [
	isOccupied
		ifTrue: [ 
			(v >= allowed) ifTrue: [ ^ $L ] ifFalse: [ ^ $# ] .
		]
		ifFalse: [ 
			(v = 0) ifTrue: [ ^ $# ] ifFalse: [ ^ $L ] .
		] .

]
