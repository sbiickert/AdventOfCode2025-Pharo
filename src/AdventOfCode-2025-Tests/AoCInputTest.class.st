Class {
	#name : 'AoCInputTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AoCInputTest >> testReadGroupedInput [
	| f groups |
	f := AoCInput fileNameForDay: 0 isTest: true.
	groups := AoCInput readGroupedInputFrom: f.
	self assert: groups size equals: 3.
	self assert: groups first first equals: 'G0, L0'

]

{ #category : 'tests' }
AoCInputTest >> testReadInput [
	| f lines |
	f := AoCInput fileNameForDay: 0 isTest: true.
	lines := AoCInput readInputFrom: f.
	self assert: lines size equals: 10.
	self assert: lines first equals: 'G0, L0'.
	self assert: (lines at:10) equals: 'G2, L2'.	
	
	lines := AoCInput readInputFrom: f removeEmptyLines: true.
	self assert: lines size equals: 8.
	self assert: lines first equals: 'G0, L0'.
	self assert: lines last equals: 'G2, L2'.	
	
]
