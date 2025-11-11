"
Helper class for 2020 day 7 Handy Haversacks.
"
Class {
	#name : 'Bag_2020_07',
	#superclass : 'Object',
	#instVars : [
		'colorName',
		'contents'
	],
	#category : 'AdventOfCode-SolutionHelper',
	#package : 'AdventOfCode',
	#tag : 'SolutionHelper'
}

{ #category : 'instance creation' }
Bag_2020_07 class >> fromString: aString [
	|colorAndContents re reGroup dict|
	colorAndContents := aString splitOn: ' bags contain ' .
	
	re := '\d+ [\w ]+ bag' asRegex .
	reGroup := '(\d+) ([\w ]+) bag' asRegex .
	dict := Dictionary new .

	re matchesIn: colorAndContents last collect: [ :m |
		reGroup matches: m .
		dict at: (reGroup subexpression: 3) put: (reGroup subexpression: 2) asInteger .
	] .

	^ self new colorName: colorAndContents first; contents: dict .
]

{ #category : 'accessing' }
Bag_2020_07 >> colorName [
	^ colorName .
]

{ #category : 'accessing' }
Bag_2020_07 >> colorName: aName [
	colorName := aName .
	^ self .
]

{ #category : 'accessing' }
Bag_2020_07 >> containsShinyGold: bagsDict [
	self isEmpty ifTrue: [^ false] .
	(contents keys includes: 'shiny gold') ifTrue: [  ^ true ] .
	contents keysDo: [ :cName | ((bagsDict at: cName) containsShinyGold: bagsDict) ifTrue: [ ^ true ] ] .
	^ false .
]

{ #category : 'accessing' }
Bag_2020_07 >> contents: aDict [
	contents := aDict .
	^ self .
]

{ #category : 'accessing' }
Bag_2020_07 >> contentsSize: bagsDict [
	|bagCount|
	bagCount := 0 .
	contents keysAndValuesDo: [ :cName :count |
		|bag|
		bag := bagsDict at: cName .
		bagCount := bagCount + (count * (1 + (bag contentsSize: bagsDict))) .
	] .
	^ bagCount .
]

{ #category : 'accessing' }
Bag_2020_07 >> isEmpty [
	^ contents isEmpty .
]
