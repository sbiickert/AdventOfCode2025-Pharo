Class {
	#name : 'AOCAdjacencyTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCAdjacencyTest >> testEquality [
	| r b q r1 |
	r := AOCAdjacency rook.
	r1 := AOCAdjacency rook.
	self assert: r equals: r1.
	b := AOCAdjacency bishop.
	self assert: r ~= b.
	q := AOCAdjacency queen.
	self assert: q ~= b.
]
