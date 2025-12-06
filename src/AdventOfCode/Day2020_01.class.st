"
Solution for Advent of Code 2020 Day 1
"
Class {
	#name : 'Day2020_01',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_01 >> initialize [ 
	super initialize .
	day := 1 .
	year := 2020 .
	name := 'Report Repair' .
	^ self .
]

{ #category : 'execution' }
Day2020_01 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	p1 := self solvePart: 2 .
	p2 := self solvePart: 3 .
	
	^ Array with: p1 with: p2 .

]

{ #category : 'execution' }
Day2020_01 >> solvePartOne: combinationSize [
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
