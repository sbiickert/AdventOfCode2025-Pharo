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

{ #category : 'initialization' }
Day2025_06 >> initialize [ 
	super initialize .
	day := 6 .
	year := 2025 .
	name := 'Trash Compactor' .
	^ self .
]

{ #category : 'parsing' }
Day2025_06 >> parseCephalopodMath [
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

{ #category : 'execution' }
Day2025_06 >> solve [
	|p1 p2 equations|
	self loadInputForTest: self isTest .
	
	equations := self parseCephalopodMath .
	
	p1 := self solvePartOne: equations .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_06 >> solvePartOne: equations [
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
		"self halt ."
		sum + interim .
	] .

	^ total .
]
