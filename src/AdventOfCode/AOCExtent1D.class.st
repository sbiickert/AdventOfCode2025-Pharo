"
One dimensional extent. Implemented to do math for Day 5 2025.
"
Class {
	#name : 'AOCExtent1D',
	#superclass : 'Object',
	#instVars : [
		'min',
		'max'
	],
	#category : 'AdventOfCode-Geometry',
	#package : 'AdventOfCode',
	#tag : 'Geometry'
}

{ #category : 'instance creation' }
AOCExtent1D class >> newWithMin: minInteger max: maxInteger [
	|e|
	e := self new .
	e min: minInteger .
	e max: maxInteger .
	^ e .
	
]

{ #category : 'comparing' }
AOCExtent1D >> = other [
	^ (min = other min) and: (max = other max) .
]

{ #category : 'comparing' }
AOCExtent1D >> equals: other [
	^ self = other .
]

{ #category : 'comparing' }
AOCExtent1D >> hash [ 
	^ (min hash) bitXor: (max hash) .
]

{ #category : 'intersection' }
AOCExtent1D >> intersectionWith: other [
	|bigMin smallMax|
	
	"Returns an empty extent"
	((self isEmpty) or: other isEmpty) ifTrue: [ ^ self class new ] .
	
	bigMin := min max: other min .
	smallMax := max min: other max .
	
	(bigMin <= smallMax) ifTrue: [ ^self class newWithMin: bigMin max: smallMax ] .
	
	^ self class new .
]

{ #category : 'testing' }
AOCExtent1D >> isEmpty [
	^ (min isNil or: (max isNil)) .
]

{ #category : 'testing' }
AOCExtent1D >> isNotEmpty [
	^ (min isNotNil and: (max isNotNil)) .
]

{ #category : 'accessing' }
AOCExtent1D >> max [
	^ max .
]

{ #category : 'accessing' }
AOCExtent1D >> max: maxInteger [
	max := maxInteger asInteger .
	(self isEmpty) ifTrue: [ ^ self ] .
	
	(min > max)
		ifTrue: [
			|temp|
			temp := min .
			min := max . 
			max := temp .
		] .
	^ self .
]

{ #category : 'accessing' }
AOCExtent1D >> min [
	^ min .
]

{ #category : 'accessing' }
AOCExtent1D >> min: minInteger [
	min := minInteger asInteger .
	(self isEmpty) ifTrue: [ ^ self ] .
	
	(min > max)
		ifTrue: [
			|temp|
			temp := min .
			min := max . 
			max := temp .
		] .
	^ self .
]

{ #category : 'intersection' }
AOCExtent1D >> overlaps: other [
	^ (self intersectionWith: other) isNotEmpty
]

{ #category : 'accessing' }
AOCExtent1D >> size [
	^ max - min + 1 .
]

{ #category : 'printing' }
AOCExtent1D >> toString [
	^ '[{1}-{2}]' format: (Array with: min with: max) .
]

{ #category : 'intersection' }
AOCExtent1D >> unionWith: other [
	|results intersection smallMin bigMax|
	results := OrderedCollection new .
	
	"Transcript show: ('Union {1} and {2} } -> ' format: (Array with: self toString with: other toString)) ."
	
	"Will return self, regardless if self is empty"
	(other isEmpty) ifTrue: [ results add: self . "Transcript showCr: self toString ." ^ results ] .
	
	(self = other) ifTrue: [ results add: self . "Transcript showCr: self toString ." ^ results ] .
	
	intersection := self intersectionWith: other .
	(intersection isEmpty) ifTrue: [ results add: self . results add: other .
		"Transcript showCr: ('({1}, {2})' format: (results collect: [:e | e toString] )) ."
		^ results ] . 
	
	results add: intersection .
	smallMin := min min: other min .
	bigMax := max max: other max .
	
	(smallMin < intersection min)
		ifTrue: [ results add: (self class newWithMin: smallMin max: (intersection min - 1)) ] .
	
	(bigMax > intersection max)
		ifTrue: [ results add: (self class newWithMin: (intersection max + 1) max: bigMax) ] .

	"Transcript showCr: ('({1})' format: (Array with: ((results collect: [:e | e toString] ) joinUsing: ', '))) ."
	
	^ results .
]
