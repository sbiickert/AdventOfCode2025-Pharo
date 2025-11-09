"
Geometry class that contains a location and a direction. Good for navigating grids and mazes.
"
Class {
	#name : 'AOCPos',
	#superclass : 'Object',
	#instVars : [
		'coord',
		'dir'
	],
	#category : 'AdventOfCode-Geometry',
	#package : 'AdventOfCode',
	#tag : 'Geometry'
}

{ #category : 'accessing' }
AOCPos >> coord [
	^ coord .
]

{ #category : 'accessing' }
AOCPos >> coord: aCoord [
	coord := aCoord .
	^ self .
]

{ #category : 'accessing' }
AOCPos >> direction [
	^ dir .
]

{ #category : 'accessing' }
AOCPos >> direction: aDir [
	dir := aDir .
]

{ #category : 'initialization' }
AOCPos >> initialize [
	super initialize .
	coord := AOCCoord origin .
	dir := AOCDir none .
	^ self .
]

{ #category : 'modifying' }
AOCPos >> moveForward: distance [
	|vector|
	vector := AOCCoord offset: dir .
	vector x: vector x * distance .
	vector y: vector y * distance .
	coord := coord + vector .
	^ self .
]

{ #category : 'modifying' }
AOCPos >> turn: aRotationDirection [
	|dirs step index|
	dirs := AOCAdjacency rook directions .
	step := aRotationDirection = AOCRotation clockwise
		ifTrue: [1]
		ifFalse: [-1] .
	index := dirs indexOf: dir .
	index := (index + step) .
	(index < 1) ifTrue: [ index := dirs size ] .
	(index > dirs size) ifTrue: [ index := 1 ] .
	dir := dirs at: index .
	^ self .
]
