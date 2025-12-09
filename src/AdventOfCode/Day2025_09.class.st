"
AoC 2025 day 9 solution
"
Class {
	#name : 'Day2025_09',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_09 >> initialize [ 
	super initialize .
	day := 9 .
	year := 2025 .
	name := 'Movie Theater' .
	^ self .
]

{ #category : 'parsing' }
Day2025_09 >> parseRedTiles [
	|coords|
	coords := input collect: [ :line |
		|split|
		split := line splitOn: ',' .
		AOCCoord new point: (split first asInteger) @ (split last asInteger) .
	] .

	^ coords .
]

{ #category : 'execution' }
Day2025_09 >> solve [
	|p1 p2 redTiles|
	self loadInputForTest: self isTest .
	
	redTiles := self parseRedTiles .
	
	p1 := self solvePartOne: redTiles .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_09 >> solvePartOne: redTiles [

	| maxArea |
	maxArea := 0.

	(redTiles combinations: 2) do: [ :combo |
			| ext |
			ext := AOCExtent newWithCoords: combo.
			maxArea := maxArea max: ext area ].

	^ maxArea
]
