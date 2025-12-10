"
AoC 2025 day 10 solution
"
Class {
	#name : 'Day2025_10',
	#superclass : 'AOCSolution',
	#instVars : [
		'machines'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_10 >> initialize [ 
	super initialize .
	day := 10 .
	year := 2025 .
	name := 'Factory' .
	^ self .
]

{ #category : 'execution' }
Day2025_10 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	machines := input collect: [ :line | Machine_2025_10 newFrom: line ] .
	
	p1 := self solvePartOne .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_10 >> solvePartOne [
	|totalPressCount|
	totalPressCount := 0 .
	
	machines do: [ :machine |
		|stack pressCount|
		pressCount := -1 .
		stack := OrderedCollection new .
		stack add: (OrderedCollection newFrom: #(0)) .
		
		[ pressCount < 0 ] whileTrue: [ 
			|newStack|
			newStack := OrderedCollection new. 
			stack do: [ :state |

				(pressCount < 0) ifTrue: [
					(state first = machine target) ifTrue: [
						"self halt ."
						pressCount := (state size) - 1 .
						"Transcript showCr: pressCount ."
					]
					ifFalse: [
						machine buttons do: [ :button |
							|newState|
							newState := state copy .
							newState add: button .
							newState at: 1 put: (state first bitXor: button) .
							newStack add: newState .
						] .
					] .
				] .
			
			] .
			stack := newStack .
		] .
		
		totalPressCount := totalPressCount + pressCount .
	] .

	^ totalPressCount .
]
