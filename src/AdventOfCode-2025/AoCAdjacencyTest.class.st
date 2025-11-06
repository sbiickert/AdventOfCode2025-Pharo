"
Enumeration class for defining rook, bishop and queen rules.
"
Class {
	#name : 'AoCAdjacencyTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests',
	#package : 'AdventOfCode-2025',
	#tag : 'Tests'
}

{ #category : 'tests' }
AoCAdjacencyTest >> testEquality [

	| r b q r1 |
	r := AoCAdjacency rook.
	r1 := AoCAdjacency rook.
	self assert: r equals: r1.
	b := AoCAdjacency bishop.
	self assert: r ~= b.
	q := AoCAdjacency queen.
	self assert: q ~= b.
]
