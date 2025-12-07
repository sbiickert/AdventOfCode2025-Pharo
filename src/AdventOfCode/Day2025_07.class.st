"
AoC 2025 day 7 solution
"
Class {
	#name : 'Day2025_07',
	#superclass : 'AOCSolution',
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
	
	p1 := self solvePartOne .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_07 >> solvePartOne [
	|grid emitter beams splitCount|
	grid := AOCGrid newWith: input .
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
