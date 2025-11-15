"
Solution for AoC 2020 day 12
"
Class {
	#name : 'Day2020_12',
	#superclass : 'AOCSolution',
	#category : 'AdventOfCode-Solution',
	#package : 'AdventOfCode',
	#tag : 'Solution'
}

{ #category : 'initialization' }
Day2020_12 >> initialize [ 
	super initialize .
	day := 12 .
	year := 2020 .
	name := 'Rain Risk' .
	^ self .
]

{ #category : 'execution' }
Day2020_12 >> moveShip: ship command: cmd [
	|off|
	off := AOCCoord offset: (AOCDir fromString: cmd first) .
	cmd last timesRepeat: [ ship coord: ship coord + off ] .
	^ ship .

]

{ #category : 'execution' }
Day2020_12 >> moveShip: ship towards: waypoint times: count [
	count timesRepeat: [ ship coord: ship coord + waypoint ] .
	^ ship .

]

{ #category : 'execution' }
Day2020_12 >> moveWaypoint: waypoint command: cmd [
	|off|
	off := AOCCoord offset: (AOCDir fromString: cmd first) .
	cmd last timesRepeat: [ waypoint point: (waypoint + off) point ] .
	^ waypoint .

]

{ #category : 'execution' }
Day2020_12 >> rotateShip: ship command: cmd [
	|rot count|
	rot := AOCRotation fromString: cmd first .
	count := cmd last / 90 .
	count timesRepeat: [ ship turn: rot ] .
	^ ship .

]

{ #category : 'execution' }
Day2020_12 >> rotateWaypoint: waypoint command: cmd [
	|rot count|
	rot := AOCRotation fromString: cmd first .
	count := cmd last / 90 .
	count timesRepeat: [
		|rotatedCoord|
		rotatedCoord := waypoint rotateAroundOrigin: (AOCRotation fromString: cmd first) .
		waypoint point: rotatedCoord point .
	] .
	^ waypoint .

]

{ #category : 'execution' }
Day2020_12 >> solve [
	|p1 p2 cmds|
	self loadInputForTest: self isTest .
	
	cmds := input collect: [ :line |
		|re|
		re := '([A-Z])(\d+)' asRegex .
		re matches: line .
		{ re subexpression: 2. (re subexpression: 3) asInteger } .
	] .

	p1 := self solvePartOne: cmds.
	p2 := self solvePartTwo: cmds .
	
	^ Array with: p1 with: p2 .
]

{ #category : 'execution' }
Day2020_12 >> solvePartOne: commands [
	|ship cases|

	ship := AOCPos new direction: AOCDir east .
	
	cases := Dictionary new .
	cases at: 'N' put: [:s :c | self moveShip: s command: c ] .
	cases at: 'S' put: [:s :c | self moveShip: s command: c ] .
	cases at: 'E' put: [:s :c | self moveShip: s command: c ] .
	cases at: 'W' put: [:s :c | self moveShip: s command: c ] .
	cases at: 'R' put: [:s :c | self rotateShip: s command: c ] .
	cases at: 'L' put: [:s :c | self rotateShip: s command: c ] .
	cases at: 'F' put: [:s :c | s moveForward: c last ] .
	
	commands do: [ :cmd |
		(cases at: (cmd first)) value: ship value: cmd .
	].

	^ ship coord manhattanDistanceTo: AOCCoord origin .
]

{ #category : 'execution' }
Day2020_12 >> solvePartTwo: commands [
	|ship waypoint cases|

	ship := AOCPos new direction: AOCDir east .
	waypoint := AOCCoord new point: 10 @ -1 .
	
	cases := Dictionary new .
	cases at: 'N' put: [:w :c | self moveWaypoint: w command: c ] .
	cases at: 'S' put: [:w :c | self moveWaypoint: w command: c ] .
	cases at: 'E' put: [:w :c | self moveWaypoint: w command: c ] .
	cases at: 'W' put: [:w :c | self moveWaypoint: w command: c ] .
	cases at: 'R' put: [:w :c | self rotateWaypoint: w command: c ] .
	cases at: 'L' put: [:w :c | self rotateWaypoint: w command: c ] .
	
	commands do: [ :cmd | (cmd first = 'F') 
		ifTrue: [ self moveShip: ship towards: waypoint times: cmd last]
		ifFalse: [ (cases at: (cmd first)) value: waypoint value: cmd ] .
	].

	^ ship coord manhattanDistanceTo: AOCCoord origin .
]
