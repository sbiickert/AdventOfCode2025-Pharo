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

{ #category : 'nil' }
Day2025_10 >> addButton: button toJoltage: joltage [
	|newJoltage|
	newJoltage := joltage copy .
	button do: [ :b | newJoltage at: b put: (joltage at: b) + 1 ] .
	^ newJoltage 
]

{ #category : 'initialization' }
Day2025_10 >> initialize [ 
	super initialize .
	day := 10 .
	year := 2025 .
	name := 'Factory' .
	^ self .
]

{ #category : 'execution' }
Day2025_10 >> joltage: current overshoots: target [
	1 to: current size do: [ :i | ((current at: i) > (target at: i)) ifTrue: [ ^ true ] ] .
	^ false .
]

{ #category : 'execution' }
Day2025_10 >> solve [
	|p1 p2|
	self loadInputForTest: self isTest .
	
	machines := input collect: [ :line | Machine_2025_10 newFrom: line ] .
	
	p1 := self solvePartOne .
	p2 := self solvePartTwo .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_10 >> solvePartOne [

	| totalPressCount|
	totalPressCount := 0.

	machines do: [ :machine |
		| stack pressCount |
		pressCount := -1.
		stack := OrderedCollection new.
		stack add: #( 0 0 ). "First digit is state of display, last is press count"

		[ pressCount < 0 ] whileTrue: [
			| newStack |
			newStack := OrderedCollection new.
			stack do: [ :state |
					pressCount < 0 ifTrue: [
						newStack addAll:
							(machine buttonsBinary collect: [ :button |
								| newValue newState |
								newValue := state first bitXor: button .
								newState := { newValue . (state last + 1) } .
								(newValue = machine target) ifTrue: [
									pressCount := newState last .
								] .
								newState .
							]) .
					] .
			] .
			stack := newStack .
		].

		totalPressCount := totalPressCount + pressCount .
	].

	^ totalPressCount
]

{ #category : 'execution' }
Day2025_10 >> solvePartTwo [
	| totalPressCount|
	totalPressCount := 0.

	machines do: [ :machine |
		| stack pressCount |
		pressCount := -1.
		stack := OrderedCollection new.
		stack add: { machine zeroJoltage . 0 } . "First is state of joltage, last is press count"

		[ pressCount < 0 ] whileTrue: [
			| newStack |
			newStack := OrderedCollection new.
			stack do: [ :state |
					pressCount < 0 ifTrue: [
						machine buttons do: [ :button |
							| newValue newState |
							newValue := self addButton: button toJoltage: state first .
							newState := { newValue . (state last + 1) } .
							(self joltage: newValue overshoots: machine joltages) ifFalse: [
								(newValue = machine joltages) ifTrue: [
									pressCount := newState last .
								] ifFalse: [
									newStack add: newState .
								].
							] .
						] .
					] .
			] .
			stack := newStack .
		].
		self halt. 
		totalPressCount := totalPressCount + pressCount .
	].

	^ totalPressCount
]
