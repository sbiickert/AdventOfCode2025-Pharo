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
Day2020_10 >> solve [
	|p1 p2 adapters|
	self loadGroupedInputForTest: self isTest .
	
	adapters := (input last collect: [ :s | s asInteger ]) sorted .
	adapters add: 0 beforeIndex: 1 .
	
	p1 := self solvePartOne: adapters .
	p2 := nil .
	
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
	^ (diffs occurrencesOf: 1) * ((diffs occurrencesOf: 3) + 1) . 
]
