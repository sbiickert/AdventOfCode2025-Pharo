"
Utility class representing a passport for AoC 2020 day 4. Includes validation code.
"
Class {
	#name : 'Passport_2020_04',
	#superclass : 'Object',
	#instVars : [
		'cid',
		'byr',
		'iyr',
		'eyr',
		'hgt',
		'hcl',
		'ecl',
		'pid'
	],
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'accessing' }
Passport_2020_04 >> birthYear [
	^ byr asInteger .
]

{ #category : 'validating' }
Passport_2020_04 >> birthYearIsValid [
	^ self birthYear between: 1920 and: 2002 .
]

{ #category : 'accessing' }
Passport_2020_04 >> countryID [
	^ cid .
]

{ #category : 'accessing' }
Passport_2020_04 >> expiryYear [
	^ eyr asInteger .
]

{ #category : 'validating' }
Passport_2020_04 >> expiryYearIsValid [
	^ self expiryYear between: 2020 and: 2030 .
]

{ #category : 'accessing' }
Passport_2020_04 >> eyeColor [
	^ ecl .
]

{ #category : 'validating' }
Passport_2020_04 >> eyeColorIsValid [
	^ { 'amb'. 'blu'. 'brn'. 'gry'. 'grn'. 'hzl'. 'oth' } includes:  ecl .
]

{ #category : 'accessing' }
Passport_2020_04 >> hairColor [
	^ hcl .
]

{ #category : 'validating' }
Passport_2020_04 >> hairColorIsValid [
	^ hcl matchesRegex: '^#[a-f0-9]{6}$' .
]

{ #category : 'testing' }
Passport_2020_04 >> hasRequiredFields [
	^ byr isNotNil
		and: (eyr isNotNil
		and: (iyr isNotNil
		and: (ecl isNotNil
		and: (hcl isNotNil
		and: (hgt isNotNil
		and: pid isNotNil))))) .
]

{ #category : 'testing' }
Passport_2020_04 >> hasValidFields [
	^ self birthYearIsValid 
		and: (self expiryYearIsValid 
		and: (self issueYearIsValid 
		and: (self eyeColorIsValid 
		and: (self hairColorIsValid 
		and: (self heightIsValid 
		and: self passportIDIsValid ))))) .
]

{ #category : 'accessing' }
Passport_2020_04 >> height [
	^ hgt .
]

{ #category : 'validating' }
Passport_2020_04 >> heightIsValid [
	|re hgtValue hgtUnits|
	(hgt endsWithAnyOf: { 'in'. 'cm' }) ifFalse: [^ false] .
	
	re := '^(\d+)(\w{2})$' asRegex .
	re matches: hgt .
	
	hgtValue := (re subexpression: 2) asInteger .
	hgtUnits := re subexpression: 3 .
	
	^ (hgtUnits = 'cm')
		ifTrue: [ hgtValue between: 150 and: 193 ] 
		ifFalse: [ hgtValue between: 59 and: 76 ] .
]

{ #category : 'accessing' }
Passport_2020_04 >> issueYear [
	^ iyr asInteger .
]

{ #category : 'validating' }
Passport_2020_04 >> issueYearIsValid [
	^ self issueYear between: 2010 and: 2020 .
]

{ #category : 'accessing' }
Passport_2020_04 >> passportID [
	^ pid .
]

{ #category : 'validating' }
Passport_2020_04 >> passportIDIsValid [
	^ pid matchesRegex: '^[0-9]{9}$' .
]

{ #category : 'initialization' }
Passport_2020_04 >> string: aString [
	|elements tagValue|
	elements := aString splitOn: ' ' .
	elements do: [ :elem |
		tagValue := elem splitOn: ':' .
		(tagValue first = 'cid') ifTrue: [cid := tagValue last] .
		(tagValue first = 'byr') ifTrue: [byr := tagValue last] .
		(tagValue first = 'iyr') ifTrue: [iyr := tagValue last] .
		(tagValue first = 'eyr') ifTrue: [eyr := tagValue last] .
		(tagValue first = 'hgt') ifTrue: [hgt := tagValue last] .
		(tagValue first = 'hcl') ifTrue: [hcl := tagValue last] .
		(tagValue first = 'ecl') ifTrue: [ecl := tagValue last] .
		(tagValue first = 'pid') ifTrue: [pid := tagValue last] .	] .
	^ self .
]
