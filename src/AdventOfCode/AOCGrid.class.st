"
Utility class for storing and working with data in a 2 dimensional grid.
"
Class {
	#name : 'AOCGrid',
	#superclass : 'Object',
	#instVars : [
		'data',
		'extent',
		'rule',
		'default'
	],
	#category : 'AdventOfCode-Util',
	#package : 'AdventOfCode',
	#tag : 'Util'
}

{ #category : 'instance creation' }
AOCGrid class >> newWith: lines [
	| g |
	g := self new .
	
	lines doWithIndex: [ :line :row |
		line doWithIndex: [ :char :col |
			|coord|
			(char = g default) ifFalse: [ 
				coord := AOCCoord new point: col @ row .
				g at: coord put: char
			] .
		] .
	 ] .
	^ g .
]

{ #category : 'converting' }
AOCGrid >> asString [ 
	|str|
	str := '' .
	(extent isEmpty) ifTrue: [ ^ str ] .
	extent yInterval do: [ :row |
		| rowValues |
		rowValues := OrderedCollection new .
		extent xInterval do: [ :col |
			| coord |
			coord := AOCCoord new point: col @ row .
			rowValues add: (self at: coord) .
		 ] .
		str := str , Character cr , rowValues joinUsing: ' ' .
	 ] .
	^ str .
]

{ #category : 'accessing' }
AOCGrid >> at: aCoord [
	^ data at: aCoord  ifAbsent: default .
]

{ #category : 'accessing' }
AOCGrid >> at: aCoord put: aValue [
	data at: aCoord put: aValue .
	extent expandToFit: aCoord .
	^ self .
]

{ #category : 'accessing' }
AOCGrid >> coords [
	^ data keys .
]

{ #category : 'accessing' }
AOCGrid >> coordsWithValue: aValue [
	^ data values select: [ :each | each = aValue ] .
]

{ #category : 'accessing' }
AOCGrid >> default [
	^ default .
]

{ #category : 'accessing' }
AOCGrid >> default: aChar [
	default := aChar .
	^ self .
]

{ #category : 'accessing' }
AOCGrid >> extent [
	^ extent .
]

{ #category : 'accessing' }
AOCGrid >> extentCopy [
	^ extent deepCopy .
]

{ #category : 'accessing' }
AOCGrid >> getValueAt: aCoord [
	^ data at: aCoord  ifAbsent: default .
]

{ #category : 'accessing' }
AOCGrid >> glyphAt: aCoord [
	| val |
	val := self at: aCoord .
	(val isKindOf: Character ) ifTrue: [ ^ val ] .
	(val isKindOf: String) ifTrue: [ ^ val first ] .
	(val isKindOf: Dictionary) ifTrue: [ ^ val at: 'glyph' ifAbsent: $? ] .
	(val respondsTo: #glyph) ifTrue: [ ^ val glyph ] .
	^ $! .
]

{ #category : 'accessing' }
AOCGrid >> histogram [
	^ self histogramIncludeUnset: false . 
]

{ #category : 'accessing' }
AOCGrid >> histogramIncludeUnset: aBool [
	| hist |
	hist := Dictionary new .
	aBool
		ifTrue: [ 
			extent allCoords do: [ :key |
				| val |
				val := self at: key .
				(hist includesKey: val)
					ifTrue: [ hist at: val put: (hist at: val) + 1 ]
					ifFalse: [ hist at: val put: 1 ] .
			] .
		]
		ifFalse: [ 
			data keysAndValuesDo: [ :key :val | 
			(hist includesKey: val)
				ifTrue: [ hist at: val put: (hist at: val) + 1 ]
				ifFalse: [ hist at: val put: 1 ] .
			] .
		] .
	^ hist .
]

{ #category : 'initialization' }
AOCGrid >> initialize [ 
	super initialize .
	data := Dictionary new .
	extent := AOCExtent new .
	rule := AOCAdjacency rook .
	default := $. .
	^ self .
]

{ #category : 'accessing' }
AOCGrid >> neighborsAt: aCoord [
	^ aCoord adjacentCoordsForRule: rule .
]

{ #category : 'accessing' }
AOCGrid >> neighborsAt: aCoord with: aValue [
	|neighbors|
	neighbors := self neighborsAt: aCoord .
	^ neighbors select: [ :n | (self at: n) = aValue ] .
]

{ #category : 'printing' }
AOCGrid >> printOn: aStream [

	extent isEmpty ifTrue: [ ^ self ].
	extent yInterval do: [ :row |
			| rowValues |
			rowValues := OrderedCollection new.
			rowValues addAll: (extent xInterval collect: [ :col |
						 | coord |
						 coord := AOCCoord new point: col @ row.
						 self glyphAt: coord ]).
			aStream
				nextPut: Character cr;
				nextPutAll: (rowValues joinUsing: ' ') ].
	^ self
]

{ #category : 'removing' }
AOCGrid >> removeAll [
	data removeAll .
	extent := AOCExtent new .
	^ self . 
]

{ #category : 'accessing' }
AOCGrid >> removeAt: aCoord [
	^ self removeAt: aCoord resetExtent: false .
]

{ #category : 'accessing' }
AOCGrid >> removeAt: aCoord resetExtent: aBool [
	(data includesKey: aCoord)
		ifTrue: [
			data removeKey: aCoord .
			aBool ifTrue: [ extent := AOCExtent newWithCoords: self coords ] .
		] .
	^ self .
]

{ #category : 'accessing' }
AOCGrid >> rule [
	^ rule .
]

{ #category : 'accessing' }
AOCGrid >> rule: anAdjacency [
	rule := anAdjacency .
	^ self .
]
