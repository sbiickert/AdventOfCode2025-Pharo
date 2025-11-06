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

{ #category : 'accessing' }
AoCInput class >> fileNameForDay: anInteger isTest: aBoolean [

	| paddedDay str |
	paddedDay := String streamContents: [ :s |
			             anInteger
				             printOn: s
				             base: 10
				             length: 2
				             padded: true ].
	str := aBoolean ifTrue: ['test'] ifFalse: ['challenge'].
	^ self path , '/day{1}_{2}.txt' format: { paddedDay. str }

]

{ #category : 'accessing' }
AoCInput class >> path [
	^ '/Users/sjb/Developer/Advent of Code/2025/AdventOfCode2025/Input' 
]

{ #category : 'reading' }
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

{ #category : 'reading' }
AoCInput class >> readInputFrom: fileName [
	^ self readInputFrom: fileName removeEmptyLines: false.

]

{ #category : 'reading' }
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
