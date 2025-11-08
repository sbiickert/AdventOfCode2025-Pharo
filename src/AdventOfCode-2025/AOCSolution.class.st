"
Superclass for solutions for Advent of Code 2025.
"
Class {
	#name : 'AOCSolution',
	#superclass : 'Object',
	#instVars : [
		'input',
		'day',
		'isTest'
	],
	#category : 'AdventOfCode-2025-Solution',
	#package : 'AdventOfCode-2025',
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

{ #category : 'initialization' }
AOCSolution >> initialize [ 
	super initialize .
	day := 0 .
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
	filename := AOCInput fileNameForDay: day isTest: aBool .
	input := AOCInput readGroupedInputFrom: filename .
	^ self .
]

{ #category : 'data' }
AOCSolution >> loadInputForTest: aBool [
	|filename|
	filename := AOCInput fileNameForDay: day isTest: aBool .
	input := AOCInput readInputFrom: filename .
	^ self .
]

{ #category : 'execution' }
AOCSolution >> solve [
	self subclassResponsibility .
]
