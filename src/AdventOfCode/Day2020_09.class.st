Class {
	#name : 'Day2020_09',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_09 >> initialize [ 
	super initialize .
	day := 9 .
	year := 2020 .
	name := 'Encoding Error' .
	^ self .
]

{ #category : 'execution' }
Day2020_09 >> solve [
	|p1 p2 numbers|
	self loadInputForTest: self isTest .
	
	numbers := input collect: [ :each | each asInteger ] .

	p1 := self solvePartOne: numbers .
	p2 := self solvePartTwo: numbers target: p1.
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_09 >> solvePartOne: numbers [
	| preamble preambleSize |
	preamble := Set new .
	preambleSize := (self isTest) ifTrue: [ 5 ] ifFalse: [ 25 ] .
	1 to: (numbers size - 1) do: [ :addIndex |
		| dropIndex numberToAnalyze|
		dropIndex := addIndex - preambleSize .
		preamble add: (numbers at: addIndex) .
		(dropIndex > 0) ifTrue: [preamble remove: (numbers at: dropIndex) ] .
		
		(addIndex >= preambleSize ) ifTrue: [
			|isValid|
			numberToAnalyze := numbers at: addIndex + 1 .
			isValid := false .
			preamble do: [ :n |
				(preamble includes: (numberToAnalyze - n))
					ifTrue: [ isValid := true ] .
			] .
			isValid ifFalse: [ ^ numberToAnalyze ] .
		].
	] .
	^ 0 .
	
]

{ #category : 'execution' }
Day2020_09 >> solvePartTwo: numbers target: weakness [
	1 to: (numbers size -1) do: [ :i |
		(i + 1) to: numbers size do: [ :j |
			|contig|
			contig := numbers copyFrom: i to: j .
			(contig sum = weakness) ifTrue: [
				contig := contig sorted . 
				^ (contig first) + (contig last) .
			] .
		]
	] .

	^ 0 .
]
