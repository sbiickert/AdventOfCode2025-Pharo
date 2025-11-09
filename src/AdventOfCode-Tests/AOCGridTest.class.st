Class {
	#name : 'AOCGridTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCGridTest >> testCoordsHistogram [
	| g hist |
	g := AOCGrid new .
	
	g at: (AOCCoord new point: 1 @ 1) put: 'A' .
	g at: (AOCCoord new point: 2 @ 2) put: 'B' .
	g at: (AOCCoord new point: 3 @ 3) put: 'C' .
	g at: (AOCCoord new point: 4 @ 4) put: 'D' .
	g at: (AOCCoord new point: 1 @ 2) put: 'A' .
	
	self assert: g coords size equals: 5 .
	self assert: (g coordsWithValue: 'A') size equals: 2 .
	self assert: (g coordsWithValue: 'B') size equals: 1 .
	self assert: (g coordsWithValue: 'X') isEmpty .
	
	hist := g histogram .
	self assert: hist size equals: 4 .
	self assert: (hist at: 'A') equals: 2 .
	self assert: (hist at: 'B') equals: 1 .
	self deny: (hist includesKey: g default) .
	
	hist := g histogramIncludeUnset: true .
	self assert: hist size equals: 5 .
	self assert: (hist at: $.) equals: 11 .
	self assert: (hist includesKey: g default) .
	
	
]

{ #category : 'tests' }
AOCGridTest >> testExtent [

	| g ext |
	g := AOCGrid new.
	self assert: g extent isEmpty.

	g at: (AOCCoord new point: 1 @ 1) put: 'A'.
	g at: (AOCCoord new point: 4 @ 4) put: 'D'.

	self deny: g extent isEmpty.
	ext := g extent.

	self assert: ext min equals: (AOCCoord new point: 1 @ 1).
	self assert: ext max equals: (AOCCoord new point: 4 @ 4).

	g at: (AOCCoord new point: 2 @ 2) put: 'B'.
	self assert: ext equals: g extent.
	self deny: ext identicalTo: g extent
]

{ #category : 'tests' }
AOCGridTest >> testGetSet [
	| g coord |
	g := AOCGrid new .
	coord := AOCCoord new point: 1 @ 1 .
	self assert: (g at: coord) equals: $. .
	g at: coord put: 'Hello' .
	self assert: (g at: coord) equals: 'Hello' .
	
]

{ #category : 'tests' }
AOCGridTest >> testGlyph [
	| g coord dict value |
	g := AOCGrid new .
	coord := AOCCoord new point: 1 @ 1 .
	
	g at: coord put: 'Hello' .
	self assert: (g glyphAt: coord) equals: $H .
	
	dict := Dictionary newFromKeys: #( #test #glyph ) andValues: #( $X $O ) .
	g at: coord put: dict .
	self assert: (g glyphAt: coord) equals: $O .
	
	value := SampleGridValue new name: 'Bob'; hp: 10 .
	g at: coord put: value .
	self assert: (g glyphAt: coord) equals: $B .
	
]

{ #category : 'tests' }
AOCGridTest >> testInitialize [
	|g|
	g := AOCGrid new .
	self assert: (g extent isEmpty) .
	self assert: g rule equals: AOCAdjacency  rook .
	self assert: g default equals: $. .
	
	g := AOCGrid new rule: AOCAdjacency bishop; default: $X .
	self assert: (g extent isEmpty) .
	self assert: g rule equals: AOCAdjacency  bishop .
	self assert: g default equals: $X .
	
	
]

{ #category : 'tests' }
AOCGridTest >> testLoad [
	| lines g |
	lines := #('abcd' 'efgh' 'ijkl') .
	g := AOCGrid newWith: lines .
	
	self assert: (g extent area) equals: 12 .
	self assert: (g at: (AOCCoord new point: 2 @ 2)) equals: $f .
	self assert: (g at: (AOCCoord new point: 3 @ 3)) equals: $k .
]

{ #category : 'tests' }
AOCGridTest >> testNeighbors [
	| g coord nArray |
	g := AOCGrid new .
	coord := AOCCoord new point: 9 @ 9 .
	g at: coord put: 'X' .
	
	nArray := g neighborsAt: coord .
	self assert: nArray size equals: 4 .
	
	g rule: AOCAdjacency bishop .
	nArray := g neighborsAt: coord .
	self assert: nArray size equals: 4 .

	g rule: AOCAdjacency queen .
	nArray := g neighborsAt: coord .
	self assert: nArray size equals: 8 .
	


]
