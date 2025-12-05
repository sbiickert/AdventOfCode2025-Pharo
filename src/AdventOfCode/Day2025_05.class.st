"
AoC 2025 solution for day 5
"
Class {
	#name : 'Day2025_05',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_05 >> initialize [ 
	super initialize .
	day := 5 .
	year := 2025 .
	name := 'Cafeteria' .
	^ self .
]

{ #category : 'parsing' }
Day2025_05 >> parseRange: str [
	^ (str splitOn: $-) collect: [ :s | s asInteger ] .
]

{ #category : 'execution' }
Day2025_05 >> solve [
	|p1 p2 ids ranges|
	self loadGroupedInputForTest: self isTest .
	
	ids := input last collect: [ :line | line asInteger ] .
	ranges := input first collect: [ :line | self parseRange: line ] .
	
	p1 := self solvePartOne: ranges ids: ids .
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_05 >> solvePartOne: ranges ids: ids [
	|freshIDs|

	freshIDs := ids select: [ :id |
		|isFresh|
		isFresh := false .
		
		ranges do: [ :r |
			(id between: r first and: r last) ifTrue: [ isFresh := true ]
		] .
		
		isFresh .
	] .
	
	^ freshIDs size .
]

{ #category : 'execution' }
Day2025_05 >> solvePartTwo [
	^ nil .
]
