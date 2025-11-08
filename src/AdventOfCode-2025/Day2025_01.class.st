"
Solution for Advent of Code 2025 Day 1 """"
"
Class {
	#name : 'Day2025_01',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-2025-Solution',
	#package : 'AdventOfCode-2025',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_01 >> initialize [ 
	super initialize .
	self day: 1 .
	^ self .
]

{ #category : 'execution' }
Day2025_01 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	p1 := self solvePart: 2 .
	p2 := self solvePart: 3 .

	^ Array with: ('Part One Solution is {1}' format: (Array with: p1))
	 		  with: ('Part Two Solution is {1}' format: (Array with: p2)) .
]

{ #category : 'execution' }
Day2025_01 >> solvePart: combinationSize [
	|product ints|
	ints := input collect: [ :each | each asInteger ] .
	product := 0 .
	(ints combinations: combinationSize ) do: [ :combo | 
		| sum |
		sum := combo inject: 0 into: [:accumulator :each | accumulator + each].
		( sum = 2020) ifTrue: [ 
			product := combo inject: 1 into: [:accumulator :each | accumulator * each] ] .
	] .
	
	^ product .

]
