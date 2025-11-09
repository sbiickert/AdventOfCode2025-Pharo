"
2020 day 2
"
Class {
	#name : 'Day2020_02',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_02 >> initialize [ 
	super initialize .
	day := 2 .
	year := 2020 .
	name := 'Password Philosophy' .
	^ self .
]

{ #category : 'testing' }
Day2020_02 >> isPasswordValid: aDict [
	| range count |
	range := Interval from: (aDict at: #min) 
							to: (aDict at: #max) .
	count := (aDict at: #password) occurrencesOf: (aDict at: #char) .
	^ range rangeIncludes: count .
	
]

{ #category : 'testing' }
Day2020_02 >> isPasswordValidPt2: aDict [
	| count char |
	count := 0 .
	char := aDict at: #char .
	(((aDict at: #password) at: (aDict at: #min)) = char) ifTrue: [count := count + 1] .
	(((aDict at: #password) at: (aDict at: #max)) = char) ifTrue: [count := count + 1] .
	^ count = 1 .

	
]

{ #category : 'parsing' }
Day2020_02 >> parseLine: aLine [
	| re |
	re := '(\d+)-(\d+) (\w)\: (\w+)' asRegex .
	re matches: aLine .
	^ Dictionary newFromKeys: #( #min #max #char #password ) andValues: 
		(Array with: (re subexpression: 2) asInteger
			    with: (re subexpression: 3) asInteger 
			    with: (re subexpression: 4) first 
			    with: (re subexpression: 5)) .
]

{ #category : 'execution' }
Day2020_02 >> solve [
	|p1 p2 parsedLines|
	self loadInputForTest: self isTest .
	
	parsedLines := input collect: [ :line | self parseLine: line ] .
	
	p1 := self solvePartOne: parsedLines .
	p2 := self solvePartTwo: parsedLines .
	
	^ Array with: p1 with: p2 .

]

{ #category : 'execution' }
Day2020_02 >> solvePartOne: parsedLines [
	| validPasswords |
	validPasswords := parsedLines select: [ :each | self isPasswordValid: each ] .
	^ validPasswords size .
]

{ #category : 'execution' }
Day2020_02 >> solvePartTwo: parsedLines [
	| validPasswords |
	validPasswords := parsedLines select: [ :each | self isPasswordValidPt2: each ] .
	^ validPasswords size .
]
