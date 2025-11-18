"
Helper class for 2020 day 14. Mask object takes a string definition and offers pt 1 and pt 2 translations.
"
Class {
	#name : 'Mask_2020_14',
	#superclass : 'Object',
	#instVars : [
		'def'
	],
	#category : 'AdventOfCode-SolutionHelper',
	#package : 'AdventOfCode',
	#tag : 'SolutionHelper'
}

{ #category : 'accessing' }
Mask_2020_14 >> definition [ 
	^ def .
]

{ #category : 'accessing' }
Mask_2020_14 >> definition: strValue [
	def := OrderedCollection new .
	strValue reversed do: [ :c |
		(c = $0) ifTrue: [ def add: 0] ifFalse: [ (c = $1) ifTrue: [ def add: 1 ] ifFalse: [ def add: nil ] ]
	] .
	^ self .
]

{ #category : 'execution' }
Mask_2020_14 >> translateValue: anInt [
	|result|
	result := anInt .
	
	1 to: 36 do: [ :i |
		|d|
		d := def at: i .
		d ifNotNil: [ |b|
			b := 2 raisedTo: (i - 1) .
			(d = 0)
				ifTrue: [ b := b bitInvert . result := result bitAnd: b ]
				ifFalse: [ result := result bitOr: b ] .
		] .
	] .
	
	^ result .
]
