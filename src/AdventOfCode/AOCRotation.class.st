"
Enumeration class for clockwise and counterclockwise rotations.
"
Class {
	#name : 'AOCRotation',
	#superclass : 'AOCEnum',
	#category : 'AdventOfCode-Util',
	#package : 'AdventOfCode',
	#tag : 'Util'
}

{ #category : 'enumeration' }
AOCRotation class >> ccw [
	^ self counterclockwise.
]

{ #category : 'enumeration' }
AOCRotation class >> clockwise [
	^ self new value: #cw.
]

{ #category : 'enumeration' }
AOCRotation class >> counterclockwise [
	^ self new value: #ccw.
]

{ #category : 'enumeration' }
AOCRotation class >> cw [
	^ self clockwise.
]

{ #category : 'instance creation' }
AOCRotation class >> fromString: rotString [
	| ucRot |
	ucRot := rotString asUppercase.
	(#('CW' 'R') includes: ucRot) ifTrue: [^ self clockwise].
	(#('CCW' 'L') includes: ucRot) ifTrue: [^ self counterclockwise].

]
