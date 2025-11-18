"
Solution for 2020 day 14
"
Class {
	#name : 'Day2020_14',
	#superclass : 'AOCSolution',
	#instVars : [
		'memRE',
		'maskRE'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_14 >> initialize [ 
	super initialize .
	day := 14 .
	year := 2020 .
	name := 'Docking Data' .
	^ self .
]

{ #category : 'execution' }
Day2020_14 >> maskRegex [
	maskRE ifNil: [ maskRE := 'mask = (\w+)' asRegex ] .
	^ maskRE .
]

{ #category : 'execution' }
Day2020_14 >> memRegex [
	memRE ifNil: [ memRE := 'mem\[(\d+)\] = (\d+)' asRegex ] .
	^ memRE .
]

{ #category : 'execution' }
Day2020_14 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .

	p1 := self solvePartOne .
	p2 := self solvePartTwo  .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_14 >> solvePartOne [
	|mask memory address value translated|
	mask := nil .
	memory := Dictionary new .
	address := '0' . value := 0 .
	
	input do: [ :line |
		(self maskRegex matches: line)
			ifTrue: [
				mask := Mask_2020_14 new definition: (self maskRegex subexpression: 2) ]
			ifFalse: [
				self memRegex matches: line .
				address := self memRegex subexpression: 2 .
				value := (self memRegex subexpression: 3) asInteger .
				translated := mask translateValue: value .
				memory at: address put: translated .
			] .
	] .
	
	^ self sumMemory:memory . 
]

{ #category : 'execution' }
Day2020_14 >> solvePartTwo [
	|mask memory address value translated|
	mask := nil .
	memory := Dictionary new .
	address := '0' . value := 0 .
	
	input do: [ :line |
		(self maskRegex matches: line)
			ifTrue: [
				mask := Mask_2020_14 new definition: (self maskRegex subexpression: 2) ]
			ifFalse: [
				self memRegex matches: line .
				address := self memRegex subexpression: 2 .
				value := (self memRegex subexpression: 3) asInteger .
				translated := mask translateValue: value .
				memory at: address put: translated .
			] .
	] .
	
	^ self sumMemory:memory . 
]

{ #category : 'execution' }
Day2020_14 >> sumMemory: memoryDict [
	^ memoryDict values sum .
]
