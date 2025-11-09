"
Superclass for solutions for Advent of Code 2025.
"
Class {
	#name : 'AOCSolution',
	#superclass : 'Object',
	#instVars : [
		'input',
		'day',
		'year',
		'name',
		'isTest'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'accessing' }
AOCSolution >> day [
	^ day .
]

{ #category : 'accessing' }
AOCSolution >> day: anInteger [
	day := anInteger .
	^ self .
]

{ #category : 'accessing' }
AOCSolution >> description [
	^ 'Day {1}: {2}' format: (Array with: day with: name) .
]

{ #category : 'initialization' }
AOCSolution >> initialize [ 
	super initialize .
	"day := 0 ."     "leave nil to throw error if not set"
	"year := 2025 ." "leave nil to throw error if not set"
	name := '' .
	isTest := true .
	^ self .
	
]

{ #category : 'execution' }
AOCSolution >> isTest [
	^ isTest .
]

{ #category : 'execution' }
AOCSolution >> isTest: aBool [
	isTest := aBool .
	^ self .
]

{ #category : 'data' }
AOCSolution >> loadGroupedInputForTest: aBool [
	|filename|
	filename := AOCInput fileNameForDay: day year: year isTest: aBool .
	input := AOCInput readGroupedInputFrom: filename .
	^ self .
]

{ #category : 'data' }
AOCSolution >> loadInputForTest: aBool [
	|filename|
	filename := AOCInput fileNameForDay: day year: year isTest: aBool .
	input := AOCInput readInputFrom: filename .
	^ self .
]

{ #category : 'execution' }
AOCSolution >> solve [
	self subclassResponsibility .
]
