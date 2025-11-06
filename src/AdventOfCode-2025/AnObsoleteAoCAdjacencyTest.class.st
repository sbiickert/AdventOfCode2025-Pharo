"
Enumeration class for defining rook, bishop and queen rules.
"
Class {
	#name : 'AnObsoleteAoCAdjacencyTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'as yet unclassified' }
AnObsoleteAoCAdjacencyTest >> testEquality [

	| r b q r1 |
	r := AoCAdjacency rook.
	r1 := AoCAdjacency rook.
	self assert: r equals: r1.
	b := AoCAdjacency bishop.
	self assert: r ~= b.
	q := AoCAdjacency queen.
	self assert: q ~= b.
]
