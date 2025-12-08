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
	
	Transcript showCr: ('Part 1: the password (count ending on zero) is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: the password (count passing zero) is {1}' 
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
	
	Transcript showCr: ('Part 1: the sum of invalid IDs is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: the sum of invalid IDs is {1}' 
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
	
	Transcript showCr: ('Part 1: the sum of max joltage with 2 batteries is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: the sum of max joltage with 12 batteries is {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay04 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_04 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1: the number of accessible rolls is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: the number of rolls that can be removed is {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay05 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_05 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1: the number of fresh ingredients is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: the number of fresh IDs is {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay06 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_06 new isTest: false .
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
Solution2025Test >> testDay07 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_07 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1: the beam is split {1} times' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2: there are {1} additional universes' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]

{ #category : 'tests' }
Solution2025Test >> testDay08 [
	| day results |
	Transcript showCr: 'Advent of Code 2025' .
	day := Day2025_08 new isTest: false .
	Transcript showCr: day description .	
	results := day solve .
	
	Transcript showCr: ('Part 1: the product of the largest 3 circuits is {1}' 
		format: (Array with: results first)) .

	Transcript showCr: ('Part 2:  {1}' 
		format: (Array with: results last)) .
		
	self assert: results first isNotNil .
	self assert: results last isNotNil .	
	
]
