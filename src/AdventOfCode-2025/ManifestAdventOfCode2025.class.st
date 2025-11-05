"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAdventOfCode2025',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-2025-Manifest',
	#package : 'AdventOfCode-2025',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2025 class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AoCInput class' #fileNameForDay:isTest: #true)) #'2025-11-05T13:29:48.102909-07:00') )
]
