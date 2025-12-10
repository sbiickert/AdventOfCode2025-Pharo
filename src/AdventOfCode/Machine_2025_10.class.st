"
The parsed state for each machine
"
Class {
	#name : 'Machine_2025_10',
	#superclass : 'Object',
	#instVars : [
		'iLightsTarget',
		'buttonsBinary',
		'buttons',
		'joltages',
		'src'
	],
	#category : 'AdventOfCode-SolutionHelper',
	#package : 'AdventOfCode',
	#tag : 'SolutionHelper'
}

{ #category : 'instance creation' }
Machine_2025_10 class >> newFrom: defn [
	|m|
	m := self new parseFrom: defn .
	^ m .
]

{ #category : 'accessing' }
Machine_2025_10 >> buttons [
	^ buttons copy .
]

{ #category : 'accessing' }
Machine_2025_10 >> buttonsBinary [
	^ buttonsBinary .
]

{ #category : 'initialization' }
Machine_2025_10 >> initialize [
	super initialize .
	iLightsTarget := 0 .
	buttonsBinary := OrderedCollection new .
	joltages := OrderedCollection new .
	src := '' .
]

{ #category : 'parsing' }
Machine_2025_10 >> intCollToNumber: iColl [
	|num|
	num := 0 .
	iColl do: [ :i |
		num := num bitAt: i+1 put: 1 .
	] .
	
	^ num .
]

{ #category : 'accessing' }
Machine_2025_10 >> joltages [
	^ joltages copy .
]

{ #category : 'parsing' }
Machine_2025_10 >> lightsStringToNumber: str [
	|temp|
	temp := str copyReplaceAll: '.' with: '0' .
	temp := temp copyReplaceAll: '#' with: '1' .
	temp := temp reversed . "to make the button numbers align with bits"
	^ ('2r' , temp) asNumber .
]

{ #category : 'parsing' }
Machine_2025_10 >> parseFrom: defn [
	"[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}"
	|split lights|
	
	split := OrderedCollection newFrom: (defn splitOn: ' ') .
	split := split collect: [ :s | 
		|t| t := s allButFirst . t allButLast . ] .
	
	lights := split removeFirst .
	
	buttons := split collect: [ :s | 
		|nums| 
		nums := s splitOn: $, .
		nums collect: [ :n | n asInteger ]
	] .	
	joltages := buttons removeLast .
	
	"lights is a string of . and #, 
	 buttons is a collection of collections of ints, 
	 joltages is a collection of ints"
	
	iLightsTarget := self lightsStringToNumber: lights .
	buttonsBinary := buttons collect: [ :b | self intCollToNumber: b ] .

	^ self .
]

{ #category : 'accessing' }
Machine_2025_10 >> target [
	^ iLightsTarget .
]
