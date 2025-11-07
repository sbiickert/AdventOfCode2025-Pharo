Class {
	#name : 'ManifestAdventOfCode2025',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-2025-Manifest',
	#package : 'AdventOfCode-2025',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2025 class >> ruleReCollectionAtCollectionSizeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOCExtent class' #fromInts: #true)) #'2025-11-07T08:25:16.474143-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode2025 class >> ruleReNoNilAssignationInInitializeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOCExtent #initialize #false)) #'2025-11-06T20:04:25.583359-07:00') )
]
