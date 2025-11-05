"
This is a comment.
"
Class {
	#name : 'AoCCounter',
	#superclass : 'Object',
	#instVars : [
		'count'
	],
	#category : 'AdventOfCode-2025',
	#package : 'AdventOfCode-2025'
}

{ #category : 'accessing' }
AoCCounter >> count [
	^ count.
]

{ #category : 'accessing' }
AoCCounter >> count: anInteger [
	count := anInteger.
]

{ #category : 'API' }
AoCCounter >> decrement [
	count := count - 1.
	^ self.
]

{ #category : 'accessing' }
AoCCounter >> increment [
	count := count + 1.
	^ self.
]

{ #category : 'initialization' }
AoCCounter >> initialize [
	super initialize.
	count := 0.
]
