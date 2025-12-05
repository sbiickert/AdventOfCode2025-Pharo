"
AoC 2025 solution for day 5
"
Class {
	#name : 'Day2025_05',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2025_05 >> initialize [ 
	super initialize .
	day := 5 .
	year := 2025 .
	name := 'Cafeteria' .
	^ self .
]

{ #category : 'parsing' }
Day2025_05 >> parseRange: str [
	^ (str splitOn: $-) collect: [ :s | s asInteger ] .
]

{ #category : 'execution' }
Day2025_05 >> solve [
	|p1 p2 ids ranges|
	self loadGroupedInputForTest: self isTest .
	
	ids := input last collect: [ :line | line asInteger ] .
	ranges := input first collect: [ :line | self parseRange: line ] .
	
	p1 := self solvePartOne: ranges ids: ids .
	p2 := self solvePartTwo: ranges .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2025_05 >> solvePartOne: ranges ids: ids [
	|freshIDs|

	freshIDs := ids select: [ :id |
		|isFresh|
		isFresh := false .
		
		ranges do: [ :r |
			(id between: r first and: r last) ifTrue: [ isFresh := true ]
		] .
		
		isFresh .
	] .
	
	^ freshIDs size .
]

{ #category : 'execution' }
Day2025_05 >> solvePartTwo: ranges [
	|modified isChanged|
	
	modified := ranges collect: [ :r | AOCExtent1D newWithMin: (r first) max: (r last) ] .
	isChanged := true .
		
	[ isChanged ] whileTrue: [ 
		isChanged := false .
		
		1 to: modified size -1 do: [ :i |
			i + 1 to: modified size do: [ :j |
				isChanged ifFalse: [
					
					((modified at: i) overlaps: (modified at: j)) ifTrue: [ 
						|unionResults|
						unionResults:= (modified at: i) unionWith: (modified at: j) .
						modified removeAt: j .
						modified removeAt: i .
						modified addAll: unionResults .
						isChanged := true .
					] .
				].
			].
		].

		"Transcript showCr: ('({1})' format: (Array with: ((modified collect: [:e | e toString] ) joinUsing: ', '))) .
		self halt."
	] .

	^ (modified collect: [ :ext | ext size ]) sum .

]
