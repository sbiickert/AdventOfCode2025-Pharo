"
Solution for 2025 day 2
"
Class {
	#name : 'Day2025_02',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'validation' }
Day2025_02 >> allStringsEqual: stringCollection [
	1 to: stringCollection size do: [ :i |
		(stringCollection first = (stringCollection at: i)) ifFalse: [ ^ false ] .
	] .
	^ true .
]

{ #category : 'manipulating' }
Day2025_02 >> breakString: str into: count [
	|size parts|
	size := str size .
	parts := OrderedCollection new .
	(size isDivisibleBy: count) ifTrue: [
		|partSize|
		partSize := size / count .
		0 to: (count-1) do: [ :i |
			|start end|
			start := i * partSize + 1 .
			end := (i + 1) * partSize .
			parts add: (str copyFrom: start to: end)
		] .
	] .
	^ parts .
]

{ #category : 'validation' }
Day2025_02 >> idIsInvalidPartOne: idInteger [
	|parts|
	parts := self breakString: idInteger asString into: 2 .
	^ (parts size = 2) and: [parts first = parts last] .

]

{ #category : 'validation' }
Day2025_02 >> idIsInvalidPartTwo: idInteger [
	|parts idStr|
	idStr := idInteger asString .
	
	2 to: idStr size do: [ :count |
		parts := self breakString: idStr into: count .
		(parts size > 1) ifTrue: [
			(self allStringsEqual: parts) ifTrue: [ ^ true ] .			
		] .
	] .

	^ false .

]

{ #category : 'initialization' }
Day2025_02 >> initialize [ 
	super initialize .
	day := 2 .
	year := 2025 .
	name := 'Gift Shop' .
	^ self .
]

{ #category : 'parsing' }
Day2025_02 >> parseRangesFromInput [
	|strRanges result|
	strRanges := input first splitOn: $, .
	result := strRanges collect: [ :each |
		|se|
		se := each splitOn: $- .
		Array with: se first asInteger with: se last asInteger .
	] .
	^ result .
]

{ #category : 'execution' }
Day2025_02 >> solve [
	|p1 p2 ranges|
	self loadInputForTest: self isTest .

	ranges := self parseRangesFromInput .
	
	p1 := self solvePartOne: ranges .
	p2 := self solvePartTwo: ranges .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_02 >> solvePartOne: ranges [
	|sum|
	sum := 0 .
	
	ranges do: [ :range | 
		range first to: range last do: [ :id | 
			(self idIsInvalidPartOne: id) ifTrue: [ sum := sum + id ] .
		] . 
	] .
	
	^ sum .
	
]

{ #category : 'execution' }
Day2025_02 >> solvePartTwo: ranges [
	|sum|
	sum := 0 .
	
	ranges do: [ :range | 
		range first to: range last do: [ :id | 
			(self idIsInvalidPartTwo: id) ifTrue: [ sum := sum + id ] .
		] . 
	] .
	
	^ sum .
	
]
