"
Line segment with a start and an end AOCCoord
"
Class {
	#name : 'AOCLine',
	#superclass : 'Object',
	#instVars : [
		'start',
		'end'
	],
	#category : 'AdventOfCode-Geometry',
	#package : 'AdventOfCode',
	#tag : 'Geometry'
}

{ #category : 'instance creation' }
AOCLine class >> newWithStart: startCoord end: endCoord [
	|line|
	line := self new .
	line start: startCoord .
	line end: endCoord .
	^ line .
]

{ #category : 'comparing' }
AOCLine >> = other [
	^ start = other start and: [ end = other end ] .
]

{ #category : 'accessing' }
AOCLine >> direction [
	self isZeroLength ifTrue: [ ^ AOCDir none ] .
	
	self isHorizontal ifTrue: [ 
		(start x > end x) ifTrue: [ ^ AOCDir west ] ifFalse: [ ^ AOCDir east ] ] .
	self isVertical ifTrue: [ 
		(start y > end y) ifTrue: [ ^ AOCDir north ] ifFalse: [ ^ AOCDir south ] ] .
	
	(start x < end x and: [start y < end y]) ifTrue: [ ^ AOCDir se ] .
	(start x > end x and: [start y < end y]) ifTrue: [ ^ AOCDir sw ] .
	(start x > end x and: [start y > end y]) ifTrue: [ ^ AOCDir nw ] .
	(start x < end x and: [start y > end y]) ifTrue: [ ^ AOCDir ne ] .
	
	"Should never get here"
	^ AOCDir none .
]

{ #category : 'accessing' }
AOCLine >> end [
	^ end .
]

{ #category : 'accessing' }
AOCLine >> end: aCoord [
	end := aCoord .
	^ self .
]

{ #category : 'initialization' }
AOCLine >> initialize [
	super initialize.
	start := AOCCoord new point: 0 @ 0 .
	end := AOCCoord new point: 0 @ 0 .
]

{ #category : 'testing' }
AOCLine >> intersects: other [
	|denom tnum unum t u|
	
	"This is untested, may not work"
	denom := ((end y - start y) * (other end x - other start x)) - 
				((end x - start x) * (other end y - other start y)) .
	
	tnum := ((other end x - other start x) * (start y - other start y)) -
				((other end y - other start y) * (start x - other start x)) .
				
	unum := ((end x - start x) * (start y - other start y)) -
				((end y - start y) * (start x - other start x)) .
				
	t := tnum / denom .
	u := unum / denom .
	
	^ (t between: 0 and: 1) and: (u between: 0 and: 1) .
]

{ #category : 'testing' }
AOCLine >> isHorizontal [ 
	^ self isNotZeroLength and: [start y = end y] .
]

{ #category : 'testing' }
AOCLine >> isNotZeroLength [
	^ start ~= end .
]

{ #category : 'testing' }
AOCLine >> isVertical [ 
	^ self isNotZeroLength and: [start x = end x] .
]

{ #category : 'testing' }
AOCLine >> isZeroLength [
	^ start = end .
]

{ #category : 'accessing' }
AOCLine >> length [
	^ start distanceTo: end .
]

{ #category : 'accessing' }
AOCLine >> start [
	^ start .
]

{ #category : 'accessing' }
AOCLine >> start: aCoord [
	start := aCoord .
	^ self .
]
