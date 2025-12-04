"
AoC 2025 day 4 solution
"
Class {
	#name : 'Day2025_04',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_04 >> initialize [ 
	super initialize .
	day := 4 .
	year := 2025 .
	name := 'Printing Department' .
	^ self .
]

{ #category : 'execution' }
Day2025_04 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	p1 := self solvePartOne .
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_04 >> solvePartOne [ 
	|map accessibleCount|
	map := AOCGrid newWith: input .
	map rule: AOCAdjacency queen .
	
	accessibleCount := 0 .
	
	"Only coords with non-default value, i.e. the rolls of paper"
	map coords do: [ :c |
		|neighbors|
		neighbors := map neighborsAt: c with: $@ .
		(neighbors size < 4) ifTrue: [ accessibleCount := accessibleCount + 1 ]
	] .

	^ accessibleCount .
]

{ #category : 'execution' }
Day2025_04 >> solvePartTwo [
	|map removedCount changeCount|
	map := AOCGrid newWith: input .
	map rule: AOCAdjacency queen .
	
	removedCount := 0 .
	changeCount := -1 .
	
	[changeCount ~= 0] whileTrue: [
		|updatedMap|
		updatedMap := AOCGrid new .
		updatedMap rule: AOCAdjacency queen .
		changeCount := 0 .
		
		"Only coords with non-default value, i.e. the rolls of paper"
		map coords do: [ :c |
			|neighbors|
			neighbors := map neighborsAt: c with: $@ .
			(neighbors size < 4)
				ifTrue:  [ changeCount := changeCount + 1 ]
				ifFalse: [ updatedMap at: c put: $@ ] .
		] .
		
		removedCount := removedCount + changeCount .
		map := updatedMap .
	] .

	^ removedCount .
]
