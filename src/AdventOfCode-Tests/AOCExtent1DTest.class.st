Class {
	#name : 'AOCExtent1DTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-Testing',
	#package : 'AdventOfCode-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AOCExtent1DTest >> testIntersect [
	|e1 e2 result|
	e1 := AOCExtent1D newWithMin: 0 max: 10.
	e2 := AOCExtent1D newWithMin: 5 max: 15.
	result := e1 intersectionWith: e2 .
	self assert: (result equals: (AOCExtent1D newWithMin: 5 max: 10)).
	
	e2 := AOCExtent1D newWithMin: 11 max: 12 .
	result := e1 intersectionWith: e2 .
	self assert: result isEmpty .
	
	e2 := AOCExtent1D newWithMin: -1 max: 11 .
	result := e1 intersectionWith: e2 .
	self assert: result equals: (AOCExtent1D newWithMin: 0 max: 10) .

	e2 := AOCExtent1D newWithMin: -10 max: -8 .
	result := e1 intersectionWith: e2 .
	self assert: result isEmpty .
	
	e2 := AOCExtent1D newWithMin: -1 max: 5	.
	result := e1 intersectionWith: e2 .
	self assert: result equals: (AOCExtent1D newWithMin: 0 max: 5) .

]

{ #category : 'tests' }
AOCExtent1DTest >> testUnion [
	|e1 e2 results expected|
	e1 := AOCExtent1D newWithMin: 0 max: 10.
	e2 := AOCExtent1D newWithMin: 5 max: 15.
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: (AOCExtent1D newWithMin: 5 max: 10) .
		expected add: (AOCExtent1D newWithMin: 0 max: 4) .
		expected add: (AOCExtent1D newWithMin: 11 max: 15) .
	self assert: results equals: expected.

	e2 := AOCExtent1D newWithMin: 0 max: 10.
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: (AOCExtent1D newWithMin: 0 max: 10) .
	self assert: results equals: expected.
		
	e2 := AOCExtent1D new .
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: e1 .
	self assert: results equals: expected.
	
	e2 := AOCExtent1D newWithMin: 0 max: 6.
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: (AOCExtent1D newWithMin: 0 max: 6) .
		expected add: (AOCExtent1D newWithMin: 7 max: 10) .
	self assert: results equals: expected.
	
	e2 := AOCExtent1D newWithMin: 5 max: 6.
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: (AOCExtent1D newWithMin: 5 max: 6) .
		expected add: (AOCExtent1D newWithMin: 0 max: 4) .
		expected add: (AOCExtent1D newWithMin: 7 max: 10) .
	self assert: results equals: expected.

	e2 := AOCExtent1D newWithMin: 5 max: 10.
	results := e1 unionWith: e2 .
	expected := OrderedCollection new .
		expected add: (AOCExtent1D newWithMin: 5 max: 10) .
		expected add: (AOCExtent1D newWithMin: 0 max: 4) .
	self assert: results equals: expected.

	
	
]
