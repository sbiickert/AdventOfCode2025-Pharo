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

{ #category : 'execution' }
Mask_2020_14 class >> resolveFloatingDefinition: definition [
	|definitions|

	definitions := OrderedCollection new .
	definitions add: definition .
	
	1 to: 36 do: [ :i | |c|
		c := definition at: i .
		(c = $X) ifTrue: [
			|copies0 copies1|
			copies0 := OrderedCollection new .
			copies1 := OrderedCollection new .
			definitions do: [ :defn |
				copies0 add: (defn copy replaceFrom: i to: i with: '2') . "2 will force a zero"
				copies1 add: (defn copy replaceFrom: i to: i with: '1') .
			] .

			definitions := copies0 .
			definitions addAll: copies1 .
		] .
	] .

	^ definitions .
]

{ #category : 'accessing' }
Mask_2020_14 >> definition [ 
	^ def .
]

{ #category : 'accessing' }
Mask_2020_14 >> definition: strValue [
	def := OrderedCollection new .
	strValue reversed do: [ :c |
		(c = $X)
			ifTrue: [ def add: nil ]
			ifFalse: [ def add: (c asString asInteger) ] .
	] .

	^ self .
]

{ #category : 'execution' }
Mask_2020_14 >> translateAddress: anInt [
	|result|
	result := anInt .
	
	1 to: 36 do: [ :i |
		|d b|
		d := def at: i .
		b := 2 raisedTo: (i - 1) .
		(d = 1) ifTrue: [ result := result bitOr: b ] .
		(d = 2) ifTrue: [ b := b bitInvert . result := result bitAnd: b ] .	
	] .
	
	^ result .
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
