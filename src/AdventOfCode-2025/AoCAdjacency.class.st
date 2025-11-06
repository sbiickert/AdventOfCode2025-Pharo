"
Enumeration class to define sets of the 8 adjacent coordinates.

- rook: the coordinates to the up, right, down and left
- bishop: the coordinates on the diagonal corners
- queen: all 8 of the adjacent coordinates (i.e. the union of rook and bishop)
"
Class {
	#name : 'AoCAdjacency',
	#superclass : 'AoCEnum',
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'enumeration' }
AoCAdjacency class >> bishop [
	^ self new value: #bishop.
]

{ #category : 'enumeration' }
AoCAdjacency class >> queen [
	^ self new value: #queen.
]

{ #category : 'enumeration' }
AoCAdjacency class >> rook [
	^ self new value: #rook.
]

{ #category : 'translation' }
AoCAdjacency >> directions [
	| cases dirs |
	cases := Dictionary new.
	cases at: self class rook put: #( 'N' 'E' 'S' 'W' ).
	cases at: self class bishop put: #( 'NE' 'SE' 'SW' 'NW' ).
	cases at: self class queen put: #( 'N' 'NE' 'E' 'SE' 'S' 'SW' 'W' 'NW' ).
	
	
	dirs := (cases at: self) collect: [ :d | AoCDir fromString: d ].
	^ dirs.
]
