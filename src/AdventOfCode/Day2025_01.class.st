"
Solution for AoC 2025 day 1
"
Class {
	#name : 'Day2025_01',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_01 >> initialize [ 
	super initialize .
	day := 1 .
	year := 2025 .
	name := 'Secret Entrance' .
	^ self .
]

{ #category : 'execution' }
Day2025_01 >> solve [
	|p1 p2 numbers|
	self loadInputForTest: self isTest .

	numbers := input collect: [ :line |  
		|prefix number|
		prefix := line first .
		number := line allButFirst asInteger .
		(prefix = $L) ifTrue: [ number := number * -1 ] .
		number .
	].

	p1 := self solvePartOne: numbers .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_01 >> solvePartOne: numbers [
	|value zeroCount|
	value := 50 .
	zeroCount := 0 .
	numbers do: [ :num |
		value := (value + num) % 100 .
		(value = 0) ifTrue: [ zeroCount := zeroCount + 1 ] .
	] .
	^ zeroCount .
]
