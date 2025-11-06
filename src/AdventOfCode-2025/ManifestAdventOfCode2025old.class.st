"
Classes for solving Advent of Code 2025. This includes utility libraries for opening the input files, doing geometry puzzles and grid puzzles.

Solutions will be added as the event progresses.
"
Class {
	#name : 'ManifestAdventOfCode2025old',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-2025-Manifest',
	#package : 'AdventOfCode-2025',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2025old class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AoCInput class' #fileNameForDay:isTest: #true)) #'2025-11-05T13:29:48.102909-07:00') )
]
