Class {
	#name : 'AOCExtentTest',
	#superclass : 'TestCase',
	#instVars : [
		'c1',
		'c2',
		'c3',
		'c4'
	],
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'running' }
AOCExtentTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	c1 := AOCCoord new point: -1 @ 1 .
	c2 := AOCCoord new point: 2 @ 8 .
	c3 := AOCCoord new point: 3 @ 3 .
	c4 := AOCCoord new point: 4 @ 4 .
]

{ #category : 'tests' }
AOCExtentTest >> testAllCoords [
	| e coords |
	e := AOCExtent new .
	coords := e allCoords .
	self assert: coords size equals: 0 .
	
	e := AOCExtent fromInts: #(1 1 3 3) .
	coords := e allCoords .
	self assert: coords size equals: 9 .
	self assert: coords first equals: (AOCCoord new point: 1@1) .
	self assert: (coords at: 4) equals: (AOCCoord new point: 1@2) .
	self assert: coords last equals: (AOCCoord new point: 3@3) .

]

{ #category : 'tests' }
AOCExtentTest >> testContains [
	| e1 e2 |
	e1 := AOCExtent fromInts: #(1 2 5 6) .
	self deny: (e1 contains: c1) .
	self deny: (e1 contains: c2) .
	self assert: (e1 contains: c3) .	
		
	e2 := AOCExtent fromInts: #(1 2 5 6) .
	self assert: (e1 contains: e2) .	
		
	e2 := AOCExtent fromInts: #(3 3 4 4) .
	self assert: (e1 contains: e2) .	
		
	e2 := AOCExtent fromInts: #(10 20 55 66) .
	self deny: (e1 contains: e2) .	

]

{ #category : 'tests' }
AOCExtentTest >> testDimensions [
	| e |
	e := AOCExtent fromInts: #(0 0 3 4) .
	self assert: e width equals: 4 .
	self assert: e height equals: 5 .
	self assert: e area equals: 20 .
]

{ #category : 'tests' }
AOCExtentTest >> testEquality [
	| e1 e2 |
	e1 := AOCExtent fromInts: #( 1 2 3 4 ) .
	e2 := AOCExtent fromInts: #( 1 2 3 4 ) .
	self assert: e1 equals: e2 .
	
	e2 := AOCExtent fromInts: #(4 5 6 7) .
	self deny: e1 equals: e2 .
	
	e2 := AOCExtent new .
	self deny: e1 equals: e2 .
	
	e1 := AOCExtent new .
	self assert: e1 equals: e2 .

	
]

{ #category : 'tests' }
AOCExtentTest >> testInitialize [
	| e |
	e := AOCExtent new .
	self deny: e isValid .
	e expandToFit: AOCCoord origin .
	self assert: e isValid .
	e expandToFit: (AOCCoord new point: 10 @ 11) .
	self assert: e isValid .
	
	e := AOCExtent fromCoords: (Array with: c3 with: c2 with: c1) .
	self assert: e nw equals: c1 .
	self assert: e se equals: (AOCCoord new point: 3 @ 8) .
	self assert: e ne equals: (AOCCoord new point: 3 @ 1) .
	self assert: e sw equals: (AOCCoord new point: -1 @ 8) .
	
	e := AOCExtent fromX1: 1 y1: 2 x2: 3 y2: 4 .
	self assert: e min equals: (AOCCoord new point: 1 @ 2) .
	self assert: e max equals: (AOCCoord new point: 3 @ 4) .	
		
	e := AOCExtent fromInts: #(1 2 3 4) .
	self assert: e min equals: (AOCCoord new point: 1 @ 2) .
	self assert: e max equals: (AOCCoord new point: 3 @ 4) .
		
	" Checking that it sorted the min and max dimensions properly "
	e := AOCExtent fromInts: #(3 4 1 2) .
	self assert: e min equals: (AOCCoord new point: 1 @ 2) .
	self assert: e max equals: (AOCCoord new point: 3 @ 4) .
]
