"
AoC 2025 day 11 solution
"
Class {
	#name : 'Day2025_11',
	#superclass : 'AOCSolution',
	#instVars : [
		'connections',
		'connectionsR',
		'paths',
		'pathCount',
		'nodesDownStreamOfDAC',
		'nodesDownStreamOfFFT'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2025_11 >> distanceToOut: tag [
	|distance current|
	distance := 0 .
	current := tag .
	
	[ current ~= 'out' ] whileTrue: [ current := ((connections at: current) first) . distance := distance + 1 ] .

	^ distance .
]

{ #category : 'as yet unclassified' }
Day2025_11 >> findAllNodesUpstreamOf: tag [
	|all search|
	all := Set new.
	
	search := Set newFrom: (connectionsR at: tag) .
	[search isNotEmpty] whileTrue: [
		|nextSearch|
		nextSearch := Set new .
		search do: [ :upTag |
			all add: upTag .
			nextSearch addAll: (connectionsR at: upTag) .
		] .
		search := nextSearch .
	] .

	^ all .
]

{ #category : 'execution' }
Day2025_11 >> findPaths2: hereTag working: path [
	|outputs bFftImpossible bDacImpossible|
	
	(hereTag = 'out') ifTrue: [
		|pathStr|
		pathStr := ($, join: path) asString .
		((pathStr includesSubstring: 'dac') and: [ (pathStr includesSubstring: 'fft')])
			ifTrue: [ pathCount := pathCount + 1 "paths add: pathStr" ] .
		^ self .
	] .

	bDacImpossible := (nodesDownStreamOfDAC includes: hereTag) and: [ (path includes: 'dac') not ] .
	bFftImpossible := (nodesDownStreamOfFFT includes: hereTag) and: [ (path includes: 'fft') not ] .

	(bDacImpossible or: [bFftImpossible]) ifTrue: [ ^ self ] .
		
	outputs := connections at: hereTag .
	outputs do: [ :out |
		|newPath|
		
		newPath := path copy .
		newPath add: out .
		
		self findPaths2: out working: newPath .
	] .

	^ self .
]

{ #category : 'execution' }
Day2025_11 >> findPaths2: hereTag working: path visited: tagSet [
	|outputs startTag|
	
	startTag := path first .
	(hereTag = 'out') ifTrue: [
		|pathSet|
		pathSet := Set newFrom: path .
		(startTag = 'svr') ifTrue: [
			((pathSet includes: 'dac') and: [ (pathSet includes: 'fft')])	 ifTrue: [
				(paths at: startTag) add: ($, join: path) asString .
			] .
		] ifFalse: [
			((pathSet includes: 'dac') or: [ (pathSet includes: 'fft')])	 ifTrue: [
				(paths at: startTag) add: ($, join: path) asString .
			] .
		] .

		^ self .
	] .
	
	((paths includesKey: hereTag) and: [ hereTag ~= startTag ])
	ifTrue: [
		"We have already completely mapped the connections beyond this, multiply this path times found paths"
		|pathStr|
		"self halt."
		pathStr := ($, join: path) asString .
		(paths at: hereTag) do: [ :suffix |
			|full|
			full := $, join: {pathStr . suffix} .
			(startTag = 'svr') ifTrue: [
				((full includes: 'dac') and: [ (full includes: 'fft')])	 ifTrue: [(paths at: startTag) add: full ]
			] 
			ifFalse: [ (paths at: startTag) add: full ] .
		]
	]

	ifFalse: [ 
		outputs := connections at: hereTag .
		outputs do: [ :out |
			|newVisited newPath|
			(tagSet includes: out) ifTrue: [ self halt  ] . "loop found"
			
			newVisited := tagSet copy .
			newVisited add: out .
			newPath := path copy .
			newPath add: out .
			
			self findPaths2: out working: newPath visited: newVisited .
		] .
	] .

	^ self .
]

{ #category : 'execution' }
Day2025_11 >> findPaths: hereTag working: path [
	|outputs|
	
	(hereTag = 'out') ifTrue: [
		paths add: ($, join: path) asString .
		^ self .
	] .
	
	outputs := connections at: hereTag .
	outputs do: [ :out |
		|newPath|
		
		newPath := path copy .
		newPath add: out .
		
		self findPaths: out working: newPath .
	] .

	^ self .
]

{ #category : 'initialization' }
Day2025_11 >> initialize [ 
	super initialize .
	day := 11 .
	year := 2025 .
	name := 'Reactor' .
	^ self .
]

{ #category : 'parsing' }
Day2025_11 >> parseConnections: index [
	connections := Dictionary new .
	connectionsR := Dictionary new .
	
	(input at: index) do: [ :line |
		|s1 s2|
		s1 := line splitOn: ': ' .
		s2 := s1 last splitOn: ' ' .
		connections at: s1 first put: s2 .
		
		s2 do: [ :out |
			(connectionsR includesKey: out) ifFalse: [ connectionsR at: out put: (OrderedCollection new) ] .
			(connectionsR at: out) add: s1 first .
			(connectionsR includesKey: s1 first) ifFalse: [ connectionsR at: s1 first put: (OrderedCollection new) ] .
		] .
	] .

	^ self .
]

{ #category : 'execution' }
Day2025_11 >> solve [
	|p1 p2|
	self loadGroupedInputForTest: self isTest .
	
	self parseConnections: 1 .	
	p1 := self solvePartOne .
	
	(self isTest) ifTrue: [self parseConnections: 2] .	
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_11 >> solvePartOne [
	|working|
	paths := OrderedCollection new . "will store finished paths"
	working := OrderedCollection newFrom: { 'you' } .
	
	self findPaths: 'you' working: working .

	^ paths size .
]

{ #category : 'execution' }
Day2025_11 >> solvePartTwo [
	|working dacUpstream fftUpstream|
	"paths := OrderedCollection new ." "will store paths"
	pathCount := 0 .
	
	dacUpstream := self findAllNodesUpstreamOf: 'dac' .
	dacUpstream add: 'dac' .
	nodesDownStreamOfDAC := (Set newFrom: connections keys) difference: dacUpstream .

	fftUpstream := self findAllNodesUpstreamOf: 'fft' .
	fftUpstream add: 'fft' .
	nodesDownStreamOfFFT := (Set newFrom: connections keys) difference: fftUpstream .	
	
	working := Set newFrom: { 'svr' } .
	self findPaths2: 'svr' working: working .	
		
	^ pathCount .
]
