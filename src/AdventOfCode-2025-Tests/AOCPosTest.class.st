Class {
	#name : 'AOCPosTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCPosTest >> testInitialize [
	| p |
	p := AOCPos new .
	self assert: p coord equals: AOCCoord origin .
	self assert: p direction equals: AOCDir none .
	p := AOCPos new coord: (AOCCoord new point: 5 @ 6); direction: AOCDir south .
	self assert: p coord equals: (AOCCoord new point: 5 @ 6) .
	self assert: p direction equals: AOCDir south .
]

{ #category : 'tests' }
AOCPosTest >> testMoveForward [
	| p |
	p := AOCPos new direction: AOCDir west .
	p moveForward: 1 .
	self assert: p coord x equals: -1 .
	p turn: AOCRotation ccw .
	p moveForward: 5 .
	self assert: p coord y equals: 5 .
	p moveForward: 10 .
	self assert: p coord y equals: 15 .
	
	p := AOCPos new . "at origin, direction is none"
	p moveForward: 1 .
	self assert: p coord equals: AOCCoord origin .
]

{ #category : 'tests' }
AOCPosTest >> testTurn [
	| p |
	p := AOCPos new direction: AOCDir north .
	p turn: AOCRotation cw .
	self assert: p direction equals: AOCDir east .
	p turn: AOCRotation ccw .
	self assert: p direction equals: AOCDir north .
	
	1 to: 5 do: [ :i | p turn: AOCRotation cw ] .
	
	self assert: p direction equals: AOCDir east .
]
