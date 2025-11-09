Class {
	#name : 'Solution2020Test',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'printing' }
Solution2020Test >> sendToTranscript: messageArray [
	Transcript showCr: (messageArray joinUsing: Character cr) .
]

{ #category : 'tests' }
Solution2020Test >> testDay01 [
	| day results |
	Transcript showCr: 'Advent of Code 2020' .
	day := Day2020_01 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	self assert: results first isNotNil .
	Transcript showCr: ('Part 1: the product of the two #s adding to 2020 is {1}' 
		format: (Array with: results first)) .
	self assert: results last isNotNil .	
	Transcript showCr: ('Part 2: the product of the three #s adding to 2020 is {1}' 
		format: (Array with: results last)) .


	
]

{ #category : 'tests' }
Solution2020Test >> testDay02 [
	| day results |
	Transcript showCr: 'Advent of Code 2020' .
	day := Day2020_02 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	self assert: results first isNotNil .
	Transcript showCr: ('Part 1: there are {1} valid passwords'
		format: (Array with: results first)) .
	self assert: results last isNotNil .	
	Transcript showCr: ('Part 2: there are {1} valid passwords' 
		format: (Array with: results last)) .

	
]

{ #category : 'tests' }
Solution2020Test >> testDay03 [
	| day results |
	Transcript showCr: 'Advent of Code 2020' .
	day := Day2020_03 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	self assert: results first isNotNil .
	Transcript showCr: ('Part 1: you hit {1} trees'
		format: (Array with: results first)) .
	self assert: results last isNotNil .	
	Transcript showCr: ('Part 2: the product of hit trees is {1}' 
		format: (Array with: results last)) .

	
]
