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
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_02 >> solvePartOne: ranges [
	|sum|
	sum := 0 .
	
	ranges do: [ :range | 
		range first to: range last do: [ :id | 
			|strID size firstPart secondPart mid|
			strID := id asString .
			size := strID size .
			(size isDivisibleBy: 2) ifTrue: [
				mid := size / 2 .
				firstPart := strID copyFrom: 1 to: mid .
				secondPart := strID copyFrom: (mid + 1) to: size .
				(firstPart = secondPart) ifTrue: [
					"Transcript showCr: id ."
					sum := sum + id .
				] .
			] .
		] . 
	] .
	
	^ sum .
	
]
