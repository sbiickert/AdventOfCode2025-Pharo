Class {
	#name : 'Day2020_03',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'execution' }
Day2020_03 >> countTreeCollisionsWithTrajectory: trajectory onHill: hill [
	| toboggan count |
	toboggan := AOCCoord new point: 1 @ 1 .
	count := 0 .
	
	[toboggan y <= hill extent bottom] whileTrue: [
		(toboggan x > hill extent right) ifTrue: [ toboggan x: toboggan x - hill extent width ] .
		((hill at: toboggan) = $#) ifTrue: [ count := count + 1 ] .
		toboggan := toboggan + trajectory .
	] .
	
	^ count .
]

{ #category : 'initialization' }
Day2020_03 >> initialize [ 
	super initialize .
	day := 3 .
	year := 2020 .
	name := 'Toboggan Trajectory' .
	^ self .
]

{ #category : 'execution' }
Day2020_03 >> solve [
	|p1 p2 hill|
	self loadInputForTest: self isTest .
	
	hill := AOCGrid newWith: input .
	
	p1 := self solvePartOne: hill .
	p2 := self solvePartTwo: hill .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_03 >> solvePartOne: grid [
	| trajectory |
	trajectory := AOCCoord new point: 3 @ 1 .
	
	^ self countTreeCollisionsWithTrajectory: trajectory onHill: grid .
]

{ #category : 'execution' }
Day2020_03 >> solvePartTwo: grid [
	| trajectories counts |
	trajectories := OrderedCollection new .
	
	trajectories add: (AOCCoord new point: 1 @ 1) .
	trajectories add: (AOCCoord new point: 3 @ 1) .
	trajectories add: (AOCCoord new point: 5 @ 1) .
	trajectories add: (AOCCoord new point: 7 @ 1) .
	trajectories add: (AOCCoord new point: 1 @ 2) .
	
	counts := trajectories collect: [ :trajectory | 
		self countTreeCollisionsWithTrajectory: trajectory onHill: grid . ] .
		
	^ counts inject: 1 into: [:accumulator :each | accumulator * each] . 
]
