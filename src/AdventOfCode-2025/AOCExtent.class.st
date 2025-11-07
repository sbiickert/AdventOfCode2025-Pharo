"
Geometry class that defines a rectangular area. Uses a Rectange as its data model.
"
Class {
	#name : 'AOCExtent',
	#superclass : 'Object',
	#instVars : [
		'rect'
	],
	#category : 'AdventOfCode-2025-Geometry',
	#package : 'AdventOfCode-2025',
	#tag : 'Geometry'
}

{ #category : 'instance creation' }
AOCExtent class >> fromCoords: aCoordList [
	| e |
	e := self new .
	aCoordList do: [ :c | e expandToFit: c ].
	^ e .
]

{ #category : 'instance creation' }
AOCExtent class >> fromInts: anIntArray [
	^ self fromX1: (anIntArray at: 1) 
				  y1: (anIntArray at: 2) 
				  x2: (anIntArray at: 3) 
				  y2: (anIntArray at: 4)
]

{ #category : 'instance creation' }
AOCExtent class >> fromX1: x1 y1: y1 x2: x2 y2: y2 [
	|c1 c2|
	c1 := AOCCoord new point: x1 @ y1 .
	c2 := AOCCoord new point: x2 @ y2 .
	^ self fromCoords: (Array with: c1 with: c2) .
	
]

{ #category : 'comparing' }
AOCExtent >> = anExt [
	^ (self class == anExt class) and: [ rect = anExt rect ] .
]

{ #category : 'accessing' }
AOCExtent >> allCoords [
	| result |
	self isEmpty ifTrue: [^ Array new ] .
	result := OrderedCollection new .
	1 to: self height do: [ :r |
		1 to: self width do: [ :c | result add: (AOCCoord new point: c @ r) ] .
	] .
	^ result .
]

{ #category : 'accessing' }
AOCExtent >> area [
	^ self width * self height .
]

{ #category : 'comparing' }
AOCExtent >> contains: aCoordOrExtent [
	(aCoordOrExtent class == AOCCoord) ifTrue: [ ^ rect containsPoint: aCoordOrExtent point . ] .
	(aCoordOrExtent class == self class) ifTrue: [ ^ rect containsRect: aCoordOrExtent rect . ] .	
	^ false .
]

{ #category : 'modifying' }
AOCExtent >> expandToFit: aCoord [
	| r |
	
	r := rect
		ifNil: [Rectangle new setPoint: aCoord point point: aCoord point ]
		ifNotNil: [ 
			| xMin yMin xMax yMax |
			xMin := aCoord x min: rect origin x .
			yMin := aCoord y min: rect origin y .
			xMax := aCoord x max: rect corner x .
			yMax := aCoord y max: rect corner y .
			Rectangle origin: xMin @ yMin corner: xMax @ yMax ] .
	rect := r value .
	^ self .
]

{ #category : 'accessing' }
AOCExtent >> height [
	^ rect bottom - rect top + 1 .
]

{ #category : 'initialization' }
AOCExtent >> initialize [ 
	super initialize .
	rect := nil .
	^ self .
]

{ #category : 'testing' }
AOCExtent >> isEmpty [
	^ rect isNil .
]

{ #category : 'testing' }
AOCExtent >> isValid [
	^ rect isNotNil .
]

{ #category : 'accessing' }
AOCExtent >> max [
	^ AOCCoord new point: rect corner .
]

{ #category : 'accessing' }
AOCExtent >> min [
	^ AOCCoord new point: rect origin .
]

{ #category : 'accessing' }
AOCExtent >> ne [
	^ AOCCoord new point: ( rect corner x @ rect origin y ) .
]

{ #category : 'accessing' }
AOCExtent >> nw [ 
	^ self min .
]

{ #category : 'accessing' }
AOCExtent >> rect [
	^ rect .
]

{ #category : 'accessing' }
AOCExtent >> se [
	^ self max .
]

{ #category : 'accessing' }
AOCExtent >> sw [
	^ AOCCoord new point: ( rect origin x @ rect corner y ) .
]

{ #category : 'accessing' }
AOCExtent >> width [
	^ rect right - rect left + 1 .
]
