"
Enumeration of the 8 cardinal directions in two dimensions.
"
Class {
	#name : 'AoCDir',
	#superclass : 'AoCEnum',
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'enumeration' }
AoCDir class >> east [
	^ self new value: #east.
]

{ #category : 'instance creation' }
AoCDir class >> fromString: dirString [
	| ucDir |
	ucDir := dirString asUppercase.
	(#('N' 'U' '^') includes: ucDir) ifTrue: [^ self north].
	(#('E' 'R' '>') includes: ucDir) ifTrue: [^ self east].
	(#('S' 'D' 'V') includes: ucDir) ifTrue: [^ self south].
	(#('W' 'L' '<') includes: ucDir) ifTrue: [^ self west].
	dirString asUppercase = 'NE' ifTrue: [^ self ne].
	dirString asUppercase = 'SE' ifTrue: [^ self se].
	dirString asUppercase = 'SW' ifTrue: [^ self sw ].
	dirString asUppercase = 'NW' ifTrue: [^ self nw].
	^ self north. "default"
]

{ #category : 'enumeration' }
AoCDir class >> ne [
	^ self new value: #ne.
]

{ #category : 'enumeration' }
AoCDir class >> north [
	^ self new value: #north.
]

{ #category : 'enumeration' }
AoCDir class >> nw [
	^ self new value: #nw.
]

{ #category : 'enumeration' }
AoCDir class >> se [
	^ self new value: #se.
]

{ #category : 'enumeration' }
AoCDir class >> south [
	^ self new value: #south.
]

{ #category : 'enumeration' }
AoCDir class >> sw [
	^ self new value: #sw.
]

{ #category : 'enumeration' }
AoCDir class >> west [
	^ self new value: #west.
]
