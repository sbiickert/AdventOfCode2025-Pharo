"
This is the manifest.
"
Class {
	#name : 'ManifestAdventOfCode',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode-Manifest',
	#package : 'AdventOfCode',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOCGrid #glyphAt: #false)) #'2025-11-08T07:18:22.671792-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'Mask_2020_14 class' #resolveFloatingDefinition: #true)) #'2025-11-18T16:33:08.291093-07:00') #(#(#RGMethodDefinition #(#Day2025_03 #largestJoltageForBankPartTwo: #false)) #'2025-12-03T10:58:56.838044-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Passport_2020_04 #string: #false)) #'2025-11-09T16:47:21.729203-07:00') #(#(#RGMethodDefinition #(#Day2020_12 #solvePartTwo: #false)) #'2025-11-14T21:18:56.029036-07:00') #(#(#RGMethodDefinition #(#AOCExtent1D #unionWith: #false)) #'2025-12-05T13:50:09.852005-07:00') #(#(#RGMethodDefinition #(#Day2025_07 #solvePartTwo #false)) #'2025-12-07T07:30:24.554656-07:00') #(#(#RGMethodDefinition #(#Day2025_08 #solvePartOne #false)) #'2025-12-08T10:23:28.793464-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleModifiesCollectionRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Day2020_09 #solvePartOne: #false)) #'2025-11-11T15:19:52.048196-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleReCollectionAtCollectionSizeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOCExtent class' #newWithInts: #true)) #'2025-11-07T08:25:16.474143-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleReCyclomaticComplexityRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Day2025_08 #solvePartOne #false)) #'2025-12-08T10:23:37.931175-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleReNoNilAssignationInInitializeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOCExtent #initialize #false)) #'2025-11-06T20:04:25.583359-07:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOCGrid #asString #false)) #'2025-11-08T13:21:55.36273-07:00') )
]
