Class {
	#name : 'Day2020_04',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_04 >> initialize [ 
	super initialize .
	day := 4 .
	year := 2020 .
	name := 'Passport Processing' .
	^ self .
]

{ #category : 'execution' }
Day2020_04 >> solve [
	|p1 p2 pStrings passports|
	self loadGroupedInputForTest: self isTest .
	
	pStrings := input collect: [ :group |
		group joinUsing: ' ' .
	] .

	passports := pStrings collect: [ :each | Passport_2020_04 new string: each ] .
	
	passports := passports select: [ :passport | passport hasRequiredFields ] .
	
	p1 := passports size .
	
	passports := passports select: [ :passport | passport hasValidFields ] .	
	p2 := passports size .
	
	^ Array with: p1 with: p2 .
]
