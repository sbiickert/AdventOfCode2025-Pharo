Class {
	#name : 'AOCCoordTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCCoordTest >> testAdd [
	|c1 c2 sum|
	c1 := AOCCoord new point: 1 @ 2 .
	c2 := AOCCoord new point: 10 @ 20 .
	sum := c1 + c2 .
	self assert: sum equals: (AOCCoord new point: 11 @ 22) .
	
	c2 := AOCCoord new point: -10 @ -20 .
	sum := c1 + c2 .
	self assert: sum equals: (AOCCoord new point: -9 @ -18) .

]

{ #category : 'tests' }
AOCCoordTest >> testAdjacency [
	|c1 c2|
	c1 := AOCCoord origin .
	c2 := AOCCoord new point: 1 @ 0 . " south adjacent "
	self assert: (c1 isAdjacentTo: c2 rule: AOCAdjacency rook) .
	self assert: (c1 isAdjacentTo: c2 rule: AOCAdjacency queen) .
	self deny: (c1 isAdjacentTo: c2 rule: AOCAdjacency bishop) .
	
	c2 := AOCCoord new point: 1 @ -1 . "ne adjacent"
	self deny: (c1 isAdjacentTo: c2 rule: AOCAdjacency rook) .
	self assert: (c1 isAdjacentTo: c2 rule: AOCAdjacency queen) .
	self assert: (c1 isAdjacentTo: c2 rule: AOCAdjacency bishop) .
	
	c2 := AOCCoord new point: -2 @ 0 . "north, but 2 distant"
	self deny: (c1 isAdjacentTo: c2 rule: AOCAdjacency queen) .
	
	c2 := AOCCoord origin . "at same location"
	self deny: (c1 isAdjacentTo: c2 rule: AOCAdjacency queen) .
	

]

{ #category : 'tests' }
AOCCoordTest >> testAdjacentCoords [
	| c neighbors |
	c := AOCCoord new point: 10 @ 20 .
	neighbors := c adjacentCoordsForRule: AOCAdjacency rook .
	self assert: neighbors size equals: 4 .
	self assert: ( neighbors includes: (AOCCoord new point: 11 @ 20) ) .
	
	neighbors := c adjacentCoordsForRule: AOCAdjacency queen .
	self assert: neighbors size equals: 8 .
	self assert: ( neighbors includes: (AOCCoord new point: 9 @ 19) ) .
]

{ #category : 'tests' }
AOCCoordTest >> testAsString [
	|c s|
	c := AOCCoord new point: 2 @ 9.
	s := c asString.
	self assert: s equals: '[2,9]'.
]

{ #category : 'tests' }
AOCCoordTest >> testDelta [
	|c1 c2 d|
	c1 := AOCCoord new point: 10 @ 30 .
	c2 := AOCCoord new point: 5 @ 20 .
	d := c1 delta: c2 .
	self assert: d equals: (AOCCoord new point: -5 @ -10) . 
]

{ #category : 'tests' }
AOCCoordTest >> testDistance [
	|c1 c2 d md|
	c1 := AOCCoord new point: 10 @ 30 .
	c2 := AOCCoord new point: 5 @ 20 .
	d := c1 distanceTo: c2 .
	self assert: (d closeTo: 11.1803 precision: 1.0e-4) .
	md := c1 manhattanDistanceTo: c2 .
	self assert: md equals: 15 .
]

{ #category : 'tests' }
AOCCoordTest >> testEquality [
	|c1 c2|
	c1 := AOCCoord new point: 2 @ 3.
	c2 := AOCCoord new point: 2 @ 3.
	self assert: c1 equals: c2.
	c2 := AOCCoord new.
	self assert: (c1 ~= c2).
	c1 := AOCCoord origin.
	self assert: c1 equals: c2.
]

{ #category : 'tests' }
AOCCoordTest >> testInitalize [
	| c |
	c := AOCCoord new.
	self assert: c x equals: 0.
	self assert: c y equals: 0.
	c := AOCCoord new point: 10 @ 30.
	self assert: c x equals: 10.
	self assert: c y equals: 30.
	c := AOCCoord new x: 5; y: 8.
	self assert: c col equals: 5.
	self assert: c row equals: 8.
	self assert: c point equals: 5 @ 8.

]

{ #category : 'tests' }
AOCCoordTest >> testOffset [
	|c1 cOff|
	c1 := AOCCoord offset: AOCDir north .
	self assert: c1 equals: (AOCCoord new point: 0 @ -1) .
	c1 := AOCCoord offset: (AOCDir fromString: '<') .
	self assert: c1 equals: (AOCCoord new point: -1 @ 0) .
	c1 := AOCCoord offset: (AOCDir fromString: '?') .
	self assert: c1 equals: AOCCoord new .
	
	c1 := AOCCoord new point: 5@4 .
	cOff := c1 offset: AOCDir sw distance: 1 .
	self assert: cOff equals: (AOCCoord new point: 4@5) .
	cOff := c1 offset: AOCDir east distance: 10 .
	self assert: cOff equals: (AOCCoord new point: 15@4) .
	
	
]

{ #category : 'tests' }
AOCCoordTest >> testRotateAroundOrigin [
	|c1|
	
	c1 := (AOCCoord new point: 3 @ 1) .
	self assert: c1 offsetDir equals: AOCDir se .
	c1 rotateAroundOrigin: AOCRotation cw .
	self assert: c1 offsetDir equals: AOCDir sw .
	c1 rotateAroundOrigin: AOCRotation cw .
	self assert: c1 offsetDir equals: AOCDir nw .
	c1 rotateAroundOrigin: AOCRotation cw .
	self assert: c1 offsetDir equals: AOCDir ne .
	self assert: c1 equals: (AOCCoord new point: 1 @ -3) .
	
	c1 rotateAroundOrigin: AOCRotation ccw .
	self assert: c1 offsetDir equals: AOCDir nw .
	c1 rotateAroundOrigin: AOCRotation ccw .
	self assert: c1 offsetDir equals: AOCDir sw .
	c1 rotateAroundOrigin: AOCRotation ccw .
	self assert: c1 offsetDir equals: AOCDir se .
	self assert: c1 equals: (AOCCoord new point: 3 @ 1) .
	
	
]
