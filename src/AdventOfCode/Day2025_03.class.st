"
AoC 2025 day 3 solution
"
Class {
	#name : 'Day2025_03',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_03 >> initialize [ 
	super initialize .
	day := 3 .
	year := 2025 .
	name := 'Lobby' .
	^ self .
]

{ #category : 'calculating' }
Day2025_03 >> largestJoltageForBank: bank [

	| maxJoltage |
	maxJoltage := 0.

	bank combinations: 2 atATimeDo: [ :combo |
			| joltage |
			joltage := (combo joinUsing: '') asInteger.
			maxJoltage := maxJoltage max: joltage ].

	^ maxJoltage
]

{ #category : 'execution' }
Day2025_03 >> solve [
	|p1 p2 banks|
	self loadInputForTest: self isTest .

	banks := input .
	
	p1 := self solvePartOne: banks .
	p2 := self solvePartTwo: banks .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_03 >> solvePartOne: banks [
	|joltages|
	
	joltages := banks collect: [ :bank | self largestJoltageForBank: bank ] .
	
	^ joltages sum .
]

{ #category : 'execution' }
Day2025_03 >> solvePartTwo: banks [
	^ 2
]
