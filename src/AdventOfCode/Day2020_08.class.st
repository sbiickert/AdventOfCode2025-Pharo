Class {
	#name : 'Day2020_08',
	#superclass : 'AOCSolution',
	#instVars : [
		'acc',
		'ptr'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2020_08 >> acc: anInteger [
	acc := acc + anInteger .
	^ self .
]

{ #category : 'execution' }
Day2020_08 >> accumulator [
	^ acc .
]

{ #category : 'initialization' }
Day2020_08 >> initialize [ 
	super initialize .
	day := 8 .
	year := 2020 .
	name := 'Handheld Halting' .
	acc := 0 .
	ptr := 0 .
	^ self .
]

{ #category : 'execution' }
Day2020_08 >> jmp: anInteger [
	ptr := ptr + anInteger .
	^ self .
]

{ #category : 'initialization' }
Day2020_08 >> resetDevice [
	acc := 0 .
	ptr := 1 .
	^ self .
]

{ #category : 'execution' }
Day2020_08 >> solve [
	|p1 p2 instructions|
	self loadInputForTest: self isTest .
	
	instructions := input collect: [ :each | each splitOn: ' ' ] .

	p1 := self solvePartOne: instructions .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_08 >> solvePartOne: instructions [
	|ptrHistory|
	self resetDevice .
	ptrHistory := Set new .
	
	[ptrHistory includes: ptr] whileFalse: [
		|instruction|
		instruction := instructions at: ptr .
		ptrHistory add: ptr .
		
		(instruction first = 'nop') ifTrue: [ self jmp: 1 ] .
		(instruction first = 'acc')
			ifTrue: [ 
				self acc: instruction last asInteger .
				self jmp: 1 .
			] .
		(instruction first = 'jmp')
			ifTrue: [
				self jmp: instruction last asInteger .
			] .
	] .
	
	^ acc .
]
