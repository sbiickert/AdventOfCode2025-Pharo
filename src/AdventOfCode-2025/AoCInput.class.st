"
The input capabilities for loading puzzle data.
"
Class {
	#name : 'AoCInput',
	#superclass : 'Object',
	#category : 'AdventOfCode-2025-Util',
	#package : 'AdventOfCode-2025',
	#tag : 'Util'
}

{ #category : 'General' }
AoCInput class >> readGroupedInputFrom: fileName [
	| lines groups group |
	lines := self readInputFrom: fileName.
	groups := OrderedCollection new.
	group := OrderedCollection new.
	lines do: [ :line |
		line isEmpty
			ifTrue: [ groups add: group. group := OrderedCollection new. ]
			ifFalse: [ group add: line. ].
	].
	group isNotEmpty ifTrue: [
		groups add: group.
	].
	^ groups
]

{ #category : 'General' }
AoCInput class >> readInputFrom: fileName [
	^ self readInputFrom: fileName removeEmptyLines: false.

]

{ #category : 'General' }
AoCInput class >> readInputFrom: fileName removeEmptyLines: aBoolean [
	| fileRef lines |
	lines := OrderedCollection new.
	fileRef := fileName asFileReference.
	fileRef readStreamDo: [ :stream |
		[ stream atEnd ] whileFalse: [ 
			| line |
			line := stream nextLine.
			(aBoolean & line isEmpty) ifFalse: [lines add: line].
		]
	].
	^ lines.
]
