Class {
	#name : 'Solution2025Test',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
Solution2025Test >> testDay01 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_01 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1:  {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2:  {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay02 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_02 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1:  {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2:  {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay03 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_03 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1:  {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2:  {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]
