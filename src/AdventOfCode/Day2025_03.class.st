"
AoC 2025 day 3 solution
"
Class {
	#name : 'Day2025_03',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'accessing' }
Day2025_03 >> indexOfSmallestValueIn: coll [
	|minIndex minValue|
	minIndex := 1 .
	minValue := coll first .
	2 to: (coll size) do: [ :i |
		((coll at: i) < minValue ) ifTrue: [ minIndex := i . minValue := coll at: i ] .
	] .

	^ minIndex .
]

{ #category : 'initialization' }
Day2025_03 >> initialize [ 
	super initialize .
	day := 3 .
	year := 2025 .
	name := 'Lobby' .
	^ self .
]

{ #category : 'accessing' }
Day2025_03 >> intValueOf: strInteger ifCharDroppedAt: index [
	^ (self removeCharFromString: strInteger at: index) asInteger .
]

{ #category : 'calculating' }
Day2025_03 >> largestJoltageForBankPartOne: bank [

	| maxJoltage |
	maxJoltage := 0.

	bank combinations: 2 atATimeDo: [ :combo |
			| joltage |
			joltage := (combo joinUsing: '') asInteger.
			maxJoltage := maxJoltage max: joltage ].

	^ maxJoltage
]

{ #category : 'calculating' }
Day2025_03 >> largestJoltageForBankPartTwo: bank [

	| mutableBank |

	mutableBank := bank .
	[mutableBank size > 12] whileTrue: [
		| bankInt dropLosses minIndex |
		bankInt := mutableBank asInteger .
		dropLosses := OrderedCollection new .
		
		1 to: mutableBank size do: [ :i |
			|dropValue|
			dropValue := self intValueOf: mutableBank ifCharDroppedAt: i .
			dropLosses add: bankInt - dropValue .
		] .

		minIndex := self indexOfSmallestValueIn: dropLosses .
		mutableBank := self removeCharFromString: mutableBank at: minIndex .
		dropLosses removeAt: minIndex .
	] .
	
	"Transcript showCr: mutableBank ."
	
	^ mutableBank asInteger .
]

{ #category : 'removing' }
Day2025_03 >> removeCharFromString: str at: index [
	|s1 s2|
	s1 := str copyFrom: 1 to: (index - 1) .
	s2 := str copyFrom: index + 1 to: (str size) .
	^ s1 , s2 .
	
]

{ #category : 'execution' }
Day2025_03 >> solve [
	|p1 p2 banks|
	self loadInputForTest: self isTest .

	banks := input .
	
	p1 := self solvePartOne: banks .
	p2 := self solvePartTwo: banks .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_03 >> solvePartOne: banks [
	|joltages|
	
	joltages := banks collect: [ :bank | self largestJoltageForBankPartOne: bank ] .
	
	^ joltages sum .
]

{ #category : 'execution' }
Day2025_03 >> solvePartTwo: banks [
	|joltages|
	
	joltages := banks collect: [ :bank | self largestJoltageForBankPartTwo: bank ] .
	
	^ joltages sum .
]
