Class {
	#name : 'AOCDirTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCDirTest >> testEquality [
	|n s n1|
	n := AOCDir north.
	n1 := AOCDir north.
	self assert: n equals: n1.
	s := AOCDir south.
	self assert: (n ~= s).
]

{ #category : 'tests' }
AOCDirTest >> testFromString [ 
	| dir |
	dir := AOCDir fromString: 'N'.
	self assert: dir equals: AOCDir north.
	dir := AOCDir fromString: 'NW'.
	self assert: dir equals: AOCDir nw.
	dir := AOCDir fromString: 'U'.
	self assert: dir equals: AOCDir north.
	dir := AOCDir fromString: 'R'.
	self assert: dir equals: AOCDir east.
	dir := AOCDir fromString: '<'.
	self assert: dir equals: AOCDir west.
	dir := AOCDir fromString: 'x'.
	self assert: dir equals: AOCDir none.
]
