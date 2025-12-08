"
AoC 2025 day 8 solution
"
Class {
	#name : 'Day2025_08',
	#superclass : 'AOCSolution',
	#instVars : [
		'jBoxes'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2025_08 >> connectJBoxesUntil: limit [
	|distances circuits maxLightStrands|
	
	"Circuits start as single junction boxes"
	circuits := OrderedCollection new .
	circuits addAll: (jBoxes collect: [ :jb | Set new add: jb; yourself ]) .
	
	distances := self getJBoxPairDistances .
		
	maxLightStrands := (limit > 0) ifTrue: [ limit ] ifFalse: [ distances size ] .

	1 to: maxLightStrands do: [ :i |
		|jbDist jb1 jb2 i1 i2|
		jbDist := distances at: i .
		jb1 := jbDist at: 1 .
		jb2 := jbDist at: 2 .

		i1 := self findIndexOfSet: circuits withJB: jb1 .
		i2 := self findIndexOfSet: circuits withJB: jb2 .
		( i1 ~= i2 )
			ifTrue: [ circuits at: i1 put: ((circuits at: i1) union: (circuits at: i2)). circuits removeAt: i2 ] .
			
		(limit <= 0 and: [ circuits size = 1 ]) ifTrue: [
			"Only return the last two joined junction boxes. All that's needed for solvePartTwo."
			^ Set new add: jb1; add: jb2; yourself ] .
	] .

	"Return all the circuits"
	^ circuits .
]

{ #category : 'execution' }
Day2025_08 >> findIndexOfSet: setsColl withJB: jbox [
	1 to: setsColl size do: [ :i | 
		((setsColl at: i) includes: jbox) ifTrue: [^ i].
	] .
	^ 0 .
]

{ #category : 'execution' }
Day2025_08 >> getJBoxPairDistances [

	| result |
	result := OrderedCollection new.
	result addAll: ((jBoxes combinations: 2) collect: [ :combo |
				 Array
					 with: combo first
					 with: combo last
					 with: (combo first distanceTo: combo last) ]).

	^ result sorted: [ :a :b | a last <= b last ] .

]

{ #category : 'initialization' }
Day2025_08 >> initialize [ 
	super initialize .
	day := 8 .
	year := 2025 .
	name := 'Playground' .
	^ self .
]

{ #category : 'parsing' }
Day2025_08 >> parseJunctionBoxes [

	jBoxes := OrderedCollection new.
	jBoxes addAll: (input collect: [ :line |
				 | split |
				 split := line splitOn: ','.
				 AOCCoord3D
					 newWithX: (split first) asInteger
					 y: (split at: 2) asInteger
					 z: (split at: 3) asInteger ]).
	^ jBoxes
]

{ #category : 'execution' }
Day2025_08 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	jBoxes := self parseJunctionBoxes .
	
	p1 := self solvePartOne .
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_08 >> solvePartOne [
	|jbSets result nLightStrands|
	nLightStrands := isTest ifTrue: [ 10 ] ifFalse: [ 1000 ] .
	
	jbSets := self connectJBoxesUntil: nLightStrands .
	jbSets := jbSets sorted: [ :a :b | a size >= b size ] .

	result := (1 to: 3) inject: 1 into: [ :acc :i | acc * ((jbSets at: i) size) ] .
	
	^ result .
]

{ #category : 'execution' }
Day2025_08 >> solvePartTwo [
	|jbSets result|
	jbSets := self connectJBoxesUntil: 0 .
	
	result := jbSets inject: 1 into: [ :acc :jb | acc * jb x ] .
	
	^ result .
]
