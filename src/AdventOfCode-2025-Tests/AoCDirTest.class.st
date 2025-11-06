Class {
	#name : 'AoCDirTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AoCDirTest >> testEquality [
	|n s n1|
	n := AoCDir north.
	n1 := AoCDir north.
	self assert: n equals: n1.
	s := AoCDir south.
	self assert: (n ~= s).
]

{ #category : 'tests' }
AoCDirTest >> testFromString [ 
	| dir |
	dir := AoCDir fromString: 'N'.
	self assert: dir equals: AoCDir north.
	dir := AoCDir fromString: 'NW'.
	self assert: dir equals: AoCDir nw.
	dir := AoCDir fromString: 'U'.
	self assert: dir equals: AoCDir north.
	dir := AoCDir fromString: 'R'.
	self assert: dir equals: AoCDir east.
	dir := AoCDir fromString: '<'.
	self assert: dir equals: AoCDir west.
	dir := AoCDir fromString: 'x'.
	self assert: dir equals: AoCDir north.
]
