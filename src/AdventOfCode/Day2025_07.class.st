"
AoC 2025 day 7 solution
"
Class {
	#name : 'Day2025_07',
	#superclass : 'AOCSolution',
	#instVars : [
		'grid'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_07 >> initialize [ 
	super initialize .
	day := 7 .
	year := 2025 .
	name := 'Laboratories' .
	^ self .
]

{ #category : 'execution' }
Day2025_07 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	grid := AOCGrid newWith: input .
	
	p1 := self solvePartOne .
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_07 >> solvePartOne [
	|emitter beams splitCount|
	
	emitter := (grid coordsWithValue: $S) first .
	splitCount := 0 .
	beams := Set new .
	beams add: (AOCCoord new point: (emitter x) @ (emitter y + 1)) .
	
	emitter y + 2 to: grid extent bottom do: [ :y |
		|newbeams|
		newbeams := Set new .
		beams do: [ :beam |
			| below |
			below := beam offset: AOCDir south distance: 1 .
			((grid at: below) = $^)
				ifTrue: [
					newbeams add: (AOCCoord new point: (beam x - 1) @ (y + 1)) .
					newbeams add: (AOCCoord new point: (beam x + 1) @ (y + 1)) .
					splitCount := splitCount + 1 .
				]
				ifFalse: [
					newbeams add: (AOCCoord new point: (beam x) @ (y + 1)) .
				] .
		] .
		beams := newbeams .
	] .
	
	^ splitCount .
]

{ #category : 'execution' }
Day2025_07 >> solvePartTwo [
	|emitter beams universeCount|

	emitter := (grid coordsWithValue: $S) first .
	universeCount := 1 .
	beams := Dictionary new . "key is AOCCoord, value is count of beams at that coord"
	beams at: (AOCCoord new point: (emitter x) @ (emitter y + 1)) put: 1 .
	
	emitter y + 2 to: grid extent bottom do: [ :y |
		|newbeams|
		newbeams := Dictionary new .
		beams associations do: [ :association |
			| below beam count |
			beam := association key .
			count := association value .
			below := beam offset: AOCDir south distance: 1 .
			
			((grid at: below) = $^)
				ifTrue: [
					|c1 c2|
					c1 := AOCCoord new point: (beam x - 1) @ (y + 1) .
					c2 := AOCCoord new point: (beam x + 1) @ (y + 1) .
					newbeams at: c1 put: (newbeams at: c1 ifAbsent: [0]) + count .
					newbeams at: c2 put: (newbeams at: c2 ifAbsent: [0]) + count .
					universeCount := universeCount + count .
				]
				ifFalse: [
					|c|
					c := AOCCoord new point: (beam x) @ (y + 1) .
					newbeams at: c put: (newbeams at: c ifAbsent: [0]) + count .
				] .
		] .
		beams := newbeams .
	] .
	
	^ universeCount .
]
