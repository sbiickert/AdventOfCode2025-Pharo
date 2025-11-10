Class {
	#name : 'Day2020_05',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'utilities' }
Day2020_05 class >> boardingPassTable [
	^ String withAll: (Character allByteCharacters 
		collect: [ :c | 
			('LF' includes: c) 
				ifTrue: [ $0 ] 
				ifFalse: [ 
					('BR' includes: c) 
						ifTrue: [ $1 ] 
						ifFalse: [ c ]]] ) .
]

{ #category : 'initialization' }
Day2020_05 >> initialize [ 
	super initialize .
	day := 5 .
	year := 2020 .
	name := 'Binary Boarding' .
	^ self .
]

{ #category : 'execution' }
Day2020_05 >> translateToRowAndCol: aString [
	|row col|

	row := (aString copyFrom: 1 to: 7) translateWith: self class boardingPassTable .
	col := (aString copyFrom: 8 to: 10) translateWith: self class boardingPassTable .
	
	^ { ('2r', row) asNumber  . ('2r', col) asNumber. } "2r prefix indicates a binary string (radix 2)"
]
