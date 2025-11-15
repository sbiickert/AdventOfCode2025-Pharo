"
Enumeration class to define sets of the 8 adjacent coordinates.

- rook: the coordinates to the up, right, down and left
- bishop: the coordinates on the diagonal corners
- queen: all 8 of the adjacent coordinates (i.e. the union of rook and bishop)
"
Class {
	#name : 'AOCAdjacency',
	#superclass : 'AOCEnum',
	#classInstVars : [
		'rook_dirs',
		'bishop_dirs',
		'queen_dirs'
	],
	#category : 'AdventOfCode-Util',
	#package : 'AdventOfCode',
	#tag : 'Util'
}

{ #category : 'enumeration' }
AOCAdjacency class >> bishop [
	^ self new value: #bishop.
]

{ #category : 'class methods' }
AOCAdjacency class >> bishopDirections [
	bishop_dirs ifNil: [ 
		bishop_dirs := #( 'NE' 'SE' 'SW' 'NW' ) collect: [ :d | AOCDir fromString: d ].
	] .
	^ bishop_dirs .
]

{ #category : 'enumeration' }
AOCAdjacency class >> queen [
	^ self new value: #queen.
]

{ #category : 'class methods' }
AOCAdjacency class >> queenDirections [
	queen_dirs ifNil: [ 
		queen_dirs := #( 'N' 'NE' 'E' 'SE' 'S' 'SW' 'W' 'NW' ) collect: [ :d | AOCDir fromString: d ].
	] .
	^ queen_dirs .
]

{ #category : 'enumeration' }
AOCAdjacency class >> rook [
	^ self new value: #rook.
]

{ #category : 'class methods' }
AOCAdjacency class >> rookDirections [
	rook_dirs ifNil: [ 
		rook_dirs := #( 'N' 'E' 'S' 'W' ) collect: [ :d | AOCDir fromString: d ].
	] .
	^ rook_dirs .
]

{ #category : 'translation' }
AOCAdjacency >> directions [
	(value = #rook)   ifTrue: [ ^ self class rookDirections ] .
	(value = #bishop) ifTrue: [ ^ self class bishopDirections ] .
	^ self class queenDirections


]
