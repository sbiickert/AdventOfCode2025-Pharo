Class {
	#name : 'AOCRotationTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
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
