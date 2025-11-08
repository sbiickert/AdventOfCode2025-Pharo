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
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
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
