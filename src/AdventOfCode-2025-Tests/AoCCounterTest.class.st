Class {
	#name : 'AoCCounterTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-2025-Tests-Testing',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Testing'
}

{ #category : 'tests' }
AoCCounterTest >> testDecrement [
	| c |
	c := AoCCounter new count: 7.
	c decrement.
	self assert: c count equals: 6.
	c decrement.
	self assert: c count equals: 5.
]

{ #category : 'tests' }
AoCCounterTest >> testIncrement [
	| c |
	c := AoCCounter new.
	c increment.
	self assert: c count equals: 1.
	c increment.
	self assert: c count equals: 2.
]

{ #category : 'tests' }
AoCCounterTest >> testInitialize [
	| c |
	c := AoCCounter new.
	self assert: c count equals: 0
]
