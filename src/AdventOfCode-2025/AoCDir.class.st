"
Enumeration of the 8 cardinal directions in two dimensions.
"
Class {
	#name : 'AOCDir',
	#superclass : 'AOCEnum',
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'enumeration' }
AOCDir class >> east [
	^ self new value: #east.
]

{ #category : 'instance creation' }
AOCDir class >> fromString: dirString [
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
	^ self none. "default"
]

{ #category : 'enumeration' }
AOCDir class >> ne [
	^ self new value: #ne.
]

{ #category : 'enumeration' }
AOCDir class >> none [
	^ self new value: #none.
]

{ #category : 'enumeration' }
AOCDir class >> north [
	^ self new value: #north.
]

{ #category : 'enumeration' }
AOCDir class >> nw [
	^ self new value: #nw.
]

{ #category : 'enumeration' }
AOCDir class >> se [
	^ self new value: #se.
]

{ #category : 'enumeration' }
AOCDir class >> south [
	^ self new value: #south.
]

{ #category : 'enumeration' }
AOCDir class >> sw [
	^ self new value: #sw.
]

{ #category : 'enumeration' }
AOCDir class >> west [
	^ self new value: #west.
]
