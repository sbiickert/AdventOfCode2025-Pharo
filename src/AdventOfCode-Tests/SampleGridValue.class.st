"
Used for testing AOCGrid. Implements #glyph for printing.
"
Class {
	#name : 'SampleGridValue',
	#superclass : 'Object',
	#instVars : [
		'name',
		'hp'
	],
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'accessing' }
SampleGridValue >> glyph [
	^ name first asUppercase .
]

{ #category : 'accessing' }
SampleGridValue >> hp [
	^ hp .
]

{ #category : 'accessing' }
SampleGridValue >> hp: anInteger [
	hp := anInteger .
	^ self .
]

{ #category : 'accessing' }
SampleGridValue >> name [
	^ name .
]

{ #category : 'accessing' }
SampleGridValue >> name: aString [
	name := aString .
	^ self .
]
