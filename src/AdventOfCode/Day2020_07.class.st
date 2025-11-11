Class {
	#name : 'Day2020_07',
	#superclass : 'AOCSolution',
	#instVars : [
		'bags'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'accessing' }
Day2020_07 >> bags [
	^ bags .
]

{ #category : 'initialization' }
Day2020_07 >> initialize [ 
	super initialize .
	day := 7 .
	year := 2020 .
	name := 'Handy Haversacks' .
	^ self .
]

{ #category : 'execution' }
Day2020_07 >> solve [
	|p1 p2 bagsArray|
	self loadGroupedInputForTest: self isTest .
	
	bagsArray := input first collect: [ :each | Bag_2020_07 fromString: each ] . 
	
	bags := Dictionary new .
	
	bagsArray do: [ :bag | bags at: bag colorName put: bag ] .
	
	p1 := self solvePartOne .
	p2 := nil .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_07 >> solvePartOne [
	|bagsWithShinyGold|
	bagsWithShinyGold := bags values select: [ :bag |
		bag containsShinyGold: bags .
		"|containsSG|
		containsSG := bag containsShinyGold: bags .
		containsSG ifTrue: [ Transcript showCr: bag colorName ] .
		containsSG . "] .
	^ bagsWithShinyGold size .
]
