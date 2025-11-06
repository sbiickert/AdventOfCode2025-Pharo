"
Base class for enumerations.
"
Class {
	#name : 'AoCEnum',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'comparing' }
AoCEnum >> = anEnum [
	^ self class = anEnum class and: [ self value = anEnum value ]
]

{ #category : 'comparing' }
AoCEnum >> hash [
	^ self class hash bitXor: self value hash.
]

{ #category : 'printing' }
AoCEnum >> printOn: aStream [
	super printOn: aStream.
	aStream << '(' << self value asString << ')'.
	^ self.
]

{ #category : 'evaluating' }
AoCEnum >> value [
	^ value.
]

{ #category : 'accessing' }
AoCEnum >> value: aValue [
	value := aValue.
	^ self.
]
