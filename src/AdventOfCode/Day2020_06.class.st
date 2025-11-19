"
Solution class for AoC 2020 day 6
"
Class {
	#name : 'Day2020_06',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_06 >> initialize [ 
	super initialize .
	day := 6 .
	year := 2020 .
	name := 'Custom Customs' .
	^ self .
]

{ #category : 'execution' }
Day2020_06 >> solve [

	| p1 p2 |
	self loadGroupedInputForTest: self isTest.

	p1 := self solvePartOne: nil.
	p2 := self solvePartTwo: nil.

	^ Array with: p1 with: p2
]

{ #category : 'execution' }
Day2020_06 >> solvePartOne: anObject [ 
	|totals|
	totals := input collect: [ :group |
		|charSet|
		charSet := group inject: Set new into: [ :acc :each | acc union: (Set newFrom: each) ] .
		charSet size .
	] .
	^ totals sum .
]

{ #category : 'execution' }
Day2020_06 >> solvePartTwo: anObject [
	|totals|
	totals := input collect: [ :group |
		|firstSet charSet|
		firstSet := Set newFrom: group first .
		charSet := group inject: firstSet into: [ :acc :each | acc intersection: (Set newFrom: each) ] .
		charSet size .
	] .
	^ totals sum .
]
