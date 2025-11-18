"
Solution for 2020 day 13
"
Class {
	#name : 'Day2020_13',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_13 >> initialize [ 
	super initialize .
	day := 13 .
	year := 2020 .
	name := 'Shuttle Search' .
	^ self .
]

{ #category : 'execution' }
Day2020_13 >> solve [
	|p1 p2 start busIDs|
	self loadInputForTest: self isTest .
	
	start := input first asInteger .
	busIDs := ((input last splitOn: ',')
		collect: [ :s | s asInteger ])
		select: [ :id | id isNotNil ] .

	p1 := self solvePartOne: start busIDs: busIDs .
	p2 := self solvePartTwo: start busIDs: busIDs  .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_13 >> solvePartOne: start busIDs: busIDs [ 
	|t divisibles|
	t := start .
	divisibles := busIDs select: [ :id | t isDivisibleBy: id ] .
	[divisibles isEmpty] whileTrue: [
		t := t + 1 .
		divisibles := busIDs select: [ :id | t isDivisibleBy: id ] .
	] .

	^ (divisibles first) * (t - start) .
]

{ #category : 'execution' }
Day2020_13 >> solvePartTwo: anInteger busIDs: aCollection [ 
	^ 2 .
]
