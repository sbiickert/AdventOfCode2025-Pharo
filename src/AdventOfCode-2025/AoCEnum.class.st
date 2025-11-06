"
Base class for enumerations.
"
Class {
	#name : 'AOCEnum',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'comparing' }
AOCEnum >> = anEnum [
	^ self class = anEnum class and: [ self value = anEnum value ]
]

{ #category : 'comparing' }
AOCEnum >> hash [
	^ self class hash bitXor: self value hash.
]

{ #category : 'printing' }
AOCEnum >> printOn: aStream [
	super printOn: aStream.
	aStream << '(' << self value asString << ')'.
	^ self.
]

{ #category : 'evaluating' }
AOCEnum >> value [
	^ value.
]

{ #category : 'accessing' }
AOCEnum >> value: aValue [
	value := aValue.
	^ self.
]
