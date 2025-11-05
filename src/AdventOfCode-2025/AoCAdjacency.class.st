"
Enumeration class to define sets of the 8 adjacent coordinates.

- rook: the coordinates to the up, right, down and left
- bishop: the coordinates on the diagonal corners
- queen: all 8 of the adjacent coordinates (i.e. the union of rook and bishop)
"
Class {
	#name : 'AoCAdjacency',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'Enumeration' }
AoCAdjacency class >> bishop [
	^ self new value: #bishop.
]

{ #category : 'Enumeration' }
AoCAdjacency class >> queen [
	^ self new value: #queen.
]

{ #category : 'Enumeration' }
AoCAdjacency class >> rook [
	^ self new value: #rook.
]

{ #category : 'comparing' }
AoCAdjacency >> = anEnum [
	^ self class = anEnum class and: [ self value = anEnum value ]
]

{ #category : 'comparing' }
AoCAdjacency >> hash [ 
	^ self class hash bitXor: self value hash.
]

{ #category : 'printing' }
AoCAdjacency >> printOn: aStream [
	super printOn: aStream.
	aStream << '(' << self value asString << ')'.
	^ self.
]

{ #category : 'evaluating' }
AoCAdjacency >> value [
	^ value.
]

{ #category : 'accessing' }
AoCAdjacency >> value: aValue [
	value := aValue.
	^ self.
]
