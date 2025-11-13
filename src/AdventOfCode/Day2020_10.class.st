"
Solution for AOC 2020 day 10
"
Class {
	#name : 'Day2020_10',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_10 >> initialize [ 
	super initialize .
	day := 10 .
	year := 2020 .
	name := 'Adapter Array' .
	^ self .
]

{ #category : 'execution' }
Day2020_10 >> numberOfCombinationsForStreak: length [
	"The examples have a maximum length of 4"
	"For streak of length 4, there would be 8 ways to arrange, but
	 the only illegal combination would be removing all adapters, so 7 ways."
	(length = 1) ifTrue: [ ^ 1 ] .
	(length = 2) ifTrue: [ ^ 2 ] .
	(length = 3) ifTrue: [ ^ 4 ] .
	^ 7 .
]

{ #category : 'execution' }
Day2020_10 >> solve [
	|p1 p2 adapters|
	self loadGroupedInputForTest: self isTest .
	
	adapters := (input last collect: [ :s | s asInteger ]) sorted .
	adapters add: 0 beforeIndex: 1 .
	adapters add: (adapters last + 3) .
	
	p1 := self solvePartOne: adapters .
	p2 := self solvePartTwo: adapters .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_10 >> solvePartOne: adapters [
	|diffs|
	diffs := Bag new .
	2 to: (adapters size) do: [ :i |
		|diff|
		diff := (adapters at: i) - (adapters at: i - 1) .
		diffs add: diff .
	] .
	
	"+ 1 b/c built-in adapter in device is highest + 3"
	^ (diffs occurrencesOf: 1) * (diffs occurrencesOf: 3) . 
]

{ #category : 'execution' }
Day2020_10 >> solvePartTwo: adapters [
	|streaks streakStart combinations|
	streaks := OrderedCollection new .
	streakStart := nil .
	
	2 to: (adapters size) do: [ :i |
		|diff|
		diff := (adapters at: i) - (adapters at: i - 1) .
		(diff = 3) ifTrue: [
				streakStart ifNotNil: [ streaks add: i - streakStart . streakStart := nil ]
			]
			ifFalse: [ 
				streakStart ifNil: [ streakStart := i ]
			] .
	] .
	
	combinations := streaks collect: [ :streak | self numberOfCombinationsForStreak: streak ] .
	
	^ combinations inject: 1 into: [ :each :acc | each * acc ] . 
]
