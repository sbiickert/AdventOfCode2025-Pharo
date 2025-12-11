"
AoC 2025 day 11 solution
"
Class {
	#name : 'Day2025_11',
	#superclass : 'AOCSolution',
	#instVars : [
		'connections',
		'paths'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2025_11 >> findPaths: hereTag working: path visited: tagSet [
	|outputs|
	
	(hereTag = 'out') ifTrue: [
		paths add: path .
		^ self .
	] .
	
	outputs := connections at: hereTag .
	outputs do: [ :out |
		|newVisited newPath|
		(tagSet includes: out) ifTrue: [ self halt  ] . "loop found"
		
		newVisited := tagSet copy .
		newVisited add: out .
		newPath := path copy .
		newPath add: out .
		
		self findPaths: out working: newPath visited: newVisited .
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
	(input at: index) do: [ :line |
		|s1 s2|
		s1 := line splitOn: ': ' .
		s2 := s1 last splitOn: ' ' .
		connections at: s1 first put: s2 .
	] .

	^ connections .
]

{ #category : 'execution' }
Day2025_11 >> solve [
	|p1 p2|
	self loadGroupedInputForTest: self isTest .
	
	self parseConnections: 1 .	
	p1 := self solvePartOne .
	
	(self isTest) ifTrue: [self parseConnections: 2] .	
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_11 >> solvePartOne [
	|working visited|
	paths := OrderedCollection new . "will store finished paths"
	working := OrderedCollection newFrom: { 'you' } .
	visited := Set newFrom: { 'you' } .
	
	self findPaths: 'you' working: working visited: visited .
	
	^ paths size .
]
