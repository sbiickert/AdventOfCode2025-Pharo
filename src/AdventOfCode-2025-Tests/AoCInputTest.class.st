Class {
	#name : 'AoCInputTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'running' }
AoCInputTest >> setUp [
	super setUp.
	"Additional setup here"
]

{ #category : 'tests' }
AoCInputTest >> testFileName [
	| testName challengeName |
	testName := AoCInput fileNameForDay:1 isTest:true.
	self assert: testName equals: AoCInput path, '/day01_test.txt'.
	
	testName := AoCInput fileNameForDay:12 isTest:true.
	self assert: testName equals: AoCInput path, '/day12_test.txt'.
	
	challengeName := AoCInput fileNameForDay:1 isTest:false.
	self assert: challengeName equals: AoCInput path, '/day01_challenge.txt'.
]

{ #category : 'tests' }
AoCInputTest >> testInitialize [
	self assert: AoCInput path equals: '/Users/sjb/Developer/Advent of Code/2025/AdventOfCode2025/Input'
]

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
