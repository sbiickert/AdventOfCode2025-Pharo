"
3 dimensional point class
"
Class {
	#name : 'AOCCoord3D',
	#superclass : 'Object',
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : 'AdventOfCode-Geometry',
	#package : 'AdventOfCode',
	#tag : 'Geometry'
}

{ #category : 'instance creation' }
AOCCoord3D class >> newWithX: xInt y: yInt z: zInt [
	|c|
	c := self new .
	c x: xInt .
	c y: yInt .
	c z: zInt .
	^ c .
]

{ #category : 'comparing' }
AOCCoord3D >> = aCoord [
	^ self class = aCoord class and: [
		x = aCoord x and: [
			y = aCoord y and: [ 
				z = aCoord z ] ] ] .
]

{ #category : 'converting' }
AOCCoord3D >> asString [ 
	^ '[{1},{2},{3}]' format: (Array with: x with: y with: z) .
]

{ #category : 'comparing' }
AOCCoord3D >> distanceTo: aCoord [
	^((x - aCoord x) squared + 
		(y - aCoord y) squared + 
		(z - aCoord z) squared) sqrt .
]

{ #category : 'comparing' }
AOCCoord3D >> hash [
	^ ((x hash) bitXor: (y hash)) bitXor: (z hash) .
]

{ #category : 'accessing' }
AOCCoord3D >> x [
	^ x .
]

{ #category : 'accessing' }
AOCCoord3D >> x: intValue [
	x := intValue .
	^ self .
]

{ #category : 'accessing' }
AOCCoord3D >> y [
	^ y .
]

{ #category : 'accessing' }
AOCCoord3D >> y: intValue [
	y := intValue .
	^ self .
]

{ #category : 'accessing' }
AOCCoord3D >> z [
	^ z .
]

{ #category : 'accessing' }
AOCCoord3D >> z: intValue [
	z := intValue .
	^ self .
]
