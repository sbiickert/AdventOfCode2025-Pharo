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
	busIDs := (input last splitOn: ',')
		collect: [ :s | s asInteger ] .

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
Day2020_13 >> solvePartTwo: start busIDs: busIDs [ 
	|step t i offset|
	t := start .        "time"
	step := 1 .         "stepping ahead in time by"
	i := 1 .            "the index of the bus id"
	offset := i - 1 .   "the offset in minutes from the first bus"
	
	[ i <= busIDs size ] whileTrue: [ 
		[ (t + offset) isDivisibleBy: (busIDs at: i) ]
			whileFalse: [
				t := t + step .
			] .

		step := step * (busIDs at: i) .

		i := i + 1 .	
		[ (i <= busIDs size) and: [ (busIDs at: i) isNil ] ] whileTrue: [ i := i + 1 . ] .
		offset := i - 1 .
	] .

	^ t .
]
