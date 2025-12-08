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
Day2025_08 >> findIndexOfSet: setsColl withJB: jbox [
	1 to: setsColl size do: [ :i | 
		((setsColl at: i) includes: jbox) ifTrue: [^ i].
	] .
	^ 0 .
]

{ #category : 'execution' }
Day2025_08 >> getJBoxPairDistances [

	| result resultSorted |
	result := OrderedCollection new.
	result addAll: ((jBoxes combinations: 2) collect: [ :combo |
				 Array
					 with: combo first
					 with: combo last
					 with: (combo first distanceTo: combo last) ]).

	resultSorted := result sorted: [ :a :b | a last <= b last ] .
	
	^ resultSorted
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
	|distances jbSets result nLightStrands|
	jbSets := OrderedCollection new .

	nLightStrands := isTest ifTrue: [ 10 ] ifFalse: [ 1000 ] .
	
	distances := self getJBoxPairDistances .
	1 to: nLightStrands do: [ :i |
		|jbDist jb1 jb2 i1 i2|
		jbDist := distances at: i .
		jb1 := jbDist first .
		jb2 := jbDist at: 2 .
		"Transcript showCr: ('Joining {1} and {2}' format: (Array with: jb1 asString with: jb2 asString)) ."
		i1 := self findIndexOfSet: jbSets withJB: jb1 .
		i2 := self findIndexOfSet: jbSets withJB: jb2 .
		(i1 = 0 and: i2 = 0) ifTrue: [ jbSets add: (Array with: jb1 with: jb2) asSet . "Transcript showCr: 'New circuit'" ] .
		(i1 = 0 and: i2 > 0) ifTrue: [ (jbSets at: i2) add: jb1 . "Transcript showCr: 'Add 1st to circuit'" ] .
		(i1 > 0 and: i2 = 0) ifTrue: [ (jbSets at: i1) add: jb2 . "Transcript showCr: 'Add 2nd to circuit'" ] .
		(i1 > 0 and: [i2 > 0 and: [ i1 ~= i2 ]])
			ifTrue: [ jbSets at: i1 put: ((jbSets at: i1) union: (jbSets at: i2)). jbSets removeAt: i2 . "Transcript showCr: 'Union circuits'" ] .

	] .

	jbSets := jbSets sorted: [ :a :b | a size >= b size ] .

	result := 1 .
	1 to: 3 do: [ :i | result := result * ((jbSets at: i) size) ] .
	
	^ result .
]

{ #category : 'execution' }
Day2025_08 >> solvePartTwo [
	^ 2 .
]
