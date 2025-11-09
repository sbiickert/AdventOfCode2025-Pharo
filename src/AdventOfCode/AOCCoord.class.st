"
2D Coordinate class. Encapsulates a Point as its data model.
"
Class {
	#name : 'AOCCoord',
	#superclass : 'Object',
	#instVars : [
		'pt'
	],
	#category : 'AdventOfCode-Geometry',
	#package : 'AdventOfCode',
	#tag : 'Geometry'
}

{ #category : 'accessing' }
AOCCoord class >> offset: aDir [
	(aDir = AOCDir north) ifTrue: [^ self new point:  0 @ -1]  .
	(aDir = AOCDir ne)    ifTrue: [^ self new point:  1 @ -1]  .
	(aDir = AOCDir east)  ifTrue: [^ self new point:  1 @  0]  .
	(aDir = AOCDir se)    ifTrue: [^ self new point:  1 @  1]  .
	(aDir = AOCDir south) ifTrue: [^ self new point:  0 @  1]  .
	(aDir = AOCDir sw)    ifTrue: [^ self new point: -1 @  1]  .
	(aDir = AOCDir west)  ifTrue: [^ self new point: -1 @  0]  .
	(aDir = AOCDir nw)    ifTrue: [^ self new point: -1 @ -1]  .
	^ self new . " origin "
	
]

{ #category : 'accessing' }
AOCCoord class >> origin [
	^ self new point: 0@0.
]

{ #category : 'arithmetic' }
AOCCoord >> + aCoord [
	^ self class new point: (pt + aCoord point) .
]

{ #category : 'arithmetic' }
AOCCoord >> - aCoord [
	^ self delta: aCoord .
]

{ #category : 'comparing' }
AOCCoord >> = aCoord [
	^ self class = aCoord class and: [ pt = aCoord point ].
]

{ #category : 'operations' }
AOCCoord >> adjacentCoordsForRule: adjacencyRule [
	|offsets|
	offsets := adjacencyRule directions collect: [ :dir | self class offset: dir] .
	^ offsets collect: [ :off | self + off ] .
]

{ #category : 'converting' }
AOCCoord >> asString [
	^ '[{1},{2}]' format: { self x. self y }
]

{ #category : 'accessing - structure variables' }
AOCCoord >> col [
	^ pt x .
]

{ #category : 'comparing' }
AOCCoord >> delta: aCoord [
	| d |
	d := aCoord point - self point.
	^ self class new point: d.
]

{ #category : 'comparing' }
AOCCoord >> distanceTo: aCoord [
	^ pt distanceTo: aCoord point .
	
]

{ #category : 'comparing' }
AOCCoord >> hash [
	^ pt hash .
]

{ #category : 'initialization' }
AOCCoord >> initialize [
	super initialize.
	pt := 0 @ 0.
]

{ #category : 'comparing' }
AOCCoord >> isAdjacentTo: aCoord rule: adjacency [
	|supportsHoriz supportsDiag md delta|
	supportsHoriz := adjacency = AOCAdjacency rook or: adjacency = AOCAdjacency queen .
	supportsDiag :=  adjacency = AOCAdjacency bishop or: adjacency = AOCAdjacency queen .
	
	md := self manhattanDistanceTo: aCoord .
	(md = 1 and: supportsHoriz )
		ifTrue: [ ^ true ] .
	delta := self delta: aCoord .
	(delta x abs = 1 and: ((delta y abs = 1) and: supportsDiag ))
		ifTrue: [  ^ true ] .
		
	^ false .
]

{ #category : 'comparing' }
AOCCoord >> manhattanDistanceTo: aCoord [
	| delta |
	delta := self delta: aCoord .
	^ (delta x abs) + (delta y abs)
]

{ #category : 'arithmetic' }
AOCCoord >> offset: aDir distance: dist [
	| off |
	off := self class offset: aDir .
	off x: off x * dist .
	off y: off y * dist . 
	^ self + off . 
]

{ #category : 'accessing' }
AOCCoord >> point [
	^ pt.
]

{ #category : 'accessing' }
AOCCoord >> point: aPoint [
	pt := aPoint.
	^ self.
]

{ #category : 'accessing - structure variables' }
AOCCoord >> row [
	^ pt y .
]

{ #category : 'accessing - structure variables' }
AOCCoord >> x [
	^ pt x.
]

{ #category : 'accessing - structure variables' }
AOCCoord >> x: anInteger [
	pt setX: anInteger setY: pt y .
	^ self .
]

{ #category : 'accessing - structure variables' }
AOCCoord >> y [
	^ pt y.
]

{ #category : 'accessing - structure variables' }
AOCCoord >> y: anInteger [
	pt setX: pt x setY: anInteger .
	^ self.
]
