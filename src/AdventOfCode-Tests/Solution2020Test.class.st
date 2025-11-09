Class {
	#name : 'Solution2020Test',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
Solution2020Test >> testDay01 [
	| day results |
	Transcript showCr: 'Advent of Code 2020' .
	day := Day2020_01 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	self assert: results first isNotNil .
	Transcript showCr: ('Part One Solution is {1}' format: (Array with: results first)) .
	self assert: results last isNotNil .	
	Transcript showCr: ('Part Two Solution is {1}' format: (Array with: results last)) .

	
]
