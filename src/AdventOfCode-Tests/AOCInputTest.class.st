Class {
	#name : 'AOCInputTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCInputTest >> testFileName [
	| testName challengeName |
	testName := AOCInput fileNameForDay:1 year: 2025 isTest:true.
	self assert: testName equals: (AOCInput path: 2025), '/day01_test.txt'.
	
	testName := AOCInput fileNameForDay:12 year: 2025 isTest:true.
	self assert: testName equals: (AOCInput path: 2025), '/day12_test.txt'.
	
	challengeName := AOCInput fileNameForDay:1 year: 2025 isTest:false.
	self assert: challengeName equals: (AOCInput path: 2025), '/day01_challenge.txt'.
]

{ #category : 'tests' }
AOCInputTest >> testInitialize [
	self assert: (AOCInput path: 2025) equals: '/Users/sjb/Developer/Advent of Code/2025/AdventOfCode2025/Input'
]

{ #category : 'tests' }
AOCInputTest >> testReadGroupedInput [
	| f groups |
	f := AOCInput fileNameForDay: 0 year: 2025 isTest: true.
	groups := AOCInput readGroupedInputFrom: f.
	self assert: groups size equals: 3.
	self assert: groups first first equals: 'G0, L0'

]

{ #category : 'tests' }
AOCInputTest >> testReadInput [
	| f lines |
	f := AOCInput fileNameForDay: 0 year: 2025 isTest: true.
	lines := AOCInput readInputFrom: f.
	self assert: lines size equals: 10.
	self assert: lines first equals: 'G0, L0'.
	self assert: (lines at:10) equals: 'G2, L2'.	
	
	lines := AOCInput readInputFrom: f removeEmptyLines: true.
	self assert: lines size equals: 8.
	self assert: lines first equals: 'G0, L0'.
	self assert: lines last equals: 'G2, L2'.	
	
]
