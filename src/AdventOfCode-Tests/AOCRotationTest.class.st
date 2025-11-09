Class {
	#name : 'AOCRotationTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCRotationTest >> testEquality [
	| cw1 cw2 ccw |
	cw1 := AOCRotation clockwise.
	cw2 := AOCRotation cw.
	self assert: cw1 equals: cw2.
	ccw := AOCRotation counterclockwise.
	self assert: (cw1 ~= ccw).
]
