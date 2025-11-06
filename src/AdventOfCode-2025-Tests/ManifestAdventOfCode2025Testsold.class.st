"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAdventOfCode2025Testsold',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-2025-Tests-Manifest',
	#package : 'AdventOfCode-2025-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2025Testsold class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AoCInputTest class' #testInitialize #true)) #'2025-11-05T13:00:16.123585-07:00') #(#(#RGMethodDefinition #(#AoCInputTest #testInitialize #false)) #'2025-11-05T13:01:40.643662-07:00') )
]
