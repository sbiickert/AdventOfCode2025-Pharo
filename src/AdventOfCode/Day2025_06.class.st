"
AoC 2025 day 6 solution
"
Class {
	#name : 'Day2025_06',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2025_06 >> findEquationExtents: grid [
	|opXColl extents y|
	opXColl := OrderedCollection new .
	
	y := grid extent bottom .
	grid extent left to: grid extent right do: [ :x |
		((grid at: (AOCCoord new point: x @ y)) ~= Character space) ifTrue: [ opXColl add: x ] .
	] . 
	opXColl add: (grid extent right) + 2 . "Dealing with the last extent"

	extents := OrderedCollection new .
	1 to: (opXColl size - 1) do: [ :i |
		|min max x1 x2|
		x1 := opXColl at: i .
		x2 := (opXColl at: i+1) - 2 .
		min := AOCCoord new point: x1 @ 1 .
		max := AOCCoord new point: x2 @ y .
		extents add: (AOCExtent newWithCoords: (Array with: min with: max)) .
	] .

	^ extents . 
]

{ #category : 'initialization' }
Day2025_06 >> initialize [ 
	super initialize .
	day := 6 .
	year := 2025 .
	name := 'Trash Compactor' .
	^ self .
]

{ #category : 'parsing' }
Day2025_06 >> parseCephalopodMath1 [
	|lines equations eq|
	lines := input collect: [ :line |
		|singlespaced|
		singlespaced := line copyWithRegex: '\s+' matchesReplacedWith: ' ' .
		singlespaced := singlespaced copyWithRegex: '\s+$' matchesReplacedWith: '' .
		singlespaced := singlespaced copyWithRegex: '^\s+' matchesReplacedWith: '' .
		singlespaced splitOn: ' ' .
	] .

	equations := OrderedCollection new .
	1 to: lines first size do: [ :col |
		eq := OrderedCollection new .
		1 to: lines size do: [ :row |
			(row < lines size)
				ifTrue: [ eq add: ((lines at: row) at: col) asInteger ]
				ifFalse: [ eq add: ((lines at: row) at: col)] .
		] .
		equations add: eq .
	] .

	^ equations .
]

{ #category : 'parsing' }
Day2025_06 >> parseCephalopodMath2 [

	| grid extents equations |
	grid := AOCGrid newWith: input.
	extents := self findEquationExtents: grid.

	equations := OrderedCollection new.
	equations addAll: (extents collect: [ :ex |
				 | op eq |
				 eq := OrderedCollection new.
				 op := grid at: ex sw.
				 ex left to: ex right do: [ :x |
						 | str |
						 str := ''.
						 1 to: ex bottom - 1 do: [ :y |
						 str := str , (grid at: (AOCCoord new point: x @ y)) asString ].
						 eq add: str asInteger ].
				 eq add: op asString.
				 eq ]).

	^ equations
]

{ #category : 'execution' }
Day2025_06 >> solve [
	|p1 p2 equations|
	self loadInputForTest: self isTest .
	
	equations := self parseCephalopodMath1 .
	p1 := self solvePart: equations .
	equations := self parseCephalopodMath2 .
	p2 := self solvePart: equations .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_06 >> solvePart: equations [
	|total|
	total := equations inject: 0 into: [ :sum :eq |
		| eqCopy op startValue interim |
		eqCopy := eq copy.
		op := eqCopy removeLast.

		startValue := op = '+'
		                ifTrue: [ 0 ]
		                ifFalse: [ 1 ].
		interim := eqCopy inject: startValue into: [ :acc :each |
			  op = '+'
				  ifTrue: [ acc + each ]
				  ifFalse: [ acc * each ] ] .
		sum + interim .
	] .

	^ total .
]
