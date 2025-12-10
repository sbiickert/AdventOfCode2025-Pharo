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

{ #category : 'execution' }
Day2025_09 >> fillGrid: grid with: char [
	|startCoord|
	startCoord := AOCCoord new .
	
	grid extent left to: grid extent right do: [ :x |
		|c|
		c := AOCCoord new point: x @ grid extent top .
		((grid neighborsAt: c with: $#) size = 2) ifTrue: [ startCoord := c offset: AOCDir south distance: 1 ] .
	] .

	self floodFillGrid: grid with: char at: startCoord .

	^ self .

]

{ #category : 'execution' }
Day2025_09 >> floodFillGrid: grid with: char at: start [
	grid at: start put: char .
	(grid neighborsAt: start with: $.) 
		do: [ :n |
			self floodFillGrid: grid with: char at: n .
		] .

	^ self .

]

{ #category : 'initialization' }
Day2025_09 >> initialize [ 
	super initialize .
	day := 9 .
	year := 2025 .
	name := 'Movie Theater' .
	^ self .
]

{ #category : 'execution' }
Day2025_09 >> paintGrid: coords [

	| grid |
	grid := AOCGrid new.
	coords do: [ :c | grid at: c put: $# ]. "red"

	1 to: coords size do: [ :i |
		| line pos |
		line := i < coords size
			        ifTrue: [ AOCLine newWithStart: (coords at: i) end: (coords at: i + 1) ]
			        ifFalse: [ AOCLine newWithStart: (coords at: i) end: coords first ].
		pos := AOCPos new .
		pos coord: line start ; direction: line direction .
		pos moveForward: 1 .
		[ pos coord ~= line end ] whileTrue: [
			grid at: pos coord put: $X .
			pos moveForward: 1 .
		] .
	].

	self fillGrid: grid with: $X .
	
	"Transcript showCr: grid ."
	^ grid
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
	p2 := self solvePartTwo: redTiles .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_09 >> solvePartOne: redTiles [
	|allExtents|
	allExtents := (redTiles combinations: 2) collect: [ :combo |
			AOCExtent newWithCoords: combo ] .
	allExtents := allExtents sorted: [ :a :b | a area >= b area ] .

	^ allExtents first area .
]

{ #category : 'execution' }
Day2025_09 >> solvePartTwo: redTiles [

	| maps compressed grid allExtents maxArea |
	maps := AOCCoord createCompressionMaps: redTiles.
	compressed := redTiles collect: [ :c |
		              c
			              compressXMap: (maps at: 'xCompress')
			              yMap: (maps at: 'yCompress') ].

	grid := self paintGrid: compressed.

	allExtents := (compressed combinations: 2) collect: [ :combo |
		              AOCExtent newWithCoords: combo ].

	maxArea := 0.

	allExtents do: [ :ext |
			"Transcript showCr: ext asString ; endEntry ."
			(ext allCoords allSatisfy: [ :c |
					 | val |
					 val := grid at: c.
					 '#X' includes: val ]) ifTrue: [
					| expMin expMax expanded |
					expMin := ext min
						          compressXMap: (maps at: 'xExpand')
						          yMap: (maps at: 'yExpand').
					expMax := ext max
						          compressXMap: (maps at: 'xExpand')
						          yMap: (maps at: 'yExpand').
					expanded := AOCExtent newWithCoords: {
							            expMin.
							            expMax }.
					maxArea := maxArea max: expanded area .
					"Transcript showCr: maxArea ."
			] .
	].

	^ maxArea
]
