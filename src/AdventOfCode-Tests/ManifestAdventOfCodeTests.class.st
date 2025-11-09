"
This is the manifest.
"
Class {
	#name : 'ManifestAdventOfCodeTests',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-Tests-Manifest',
	#package : 'AdventOfCode-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCodeTests class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#Solution2020Test)) #'2025-11-08T19:05:49.753628-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCodeTests class >> ruleLiteralArrayCharactersRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOCGridTest #testGlyph #false)) #'2025-11-08T12:09:48.709913-07:00') )
]
