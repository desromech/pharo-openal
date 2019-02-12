"
I represent the OpenAL context creation attributes.
"
Class {
	#name : #ALContextAttributes,
	#superclass : #Object,
	#instVars : [
		'frequency',
		'refresh',
		'sync',
		'monoSources',
		'stereoSources'
	],
	#classVars : [
		'DefaultFrequency'
	],
	#pools : [
		'OpenALCConstants',
		'OpenALCTypes'
	],
	#category : #'OpenAL-Core-Context'
}

{ #category : #configuration }
ALContextAttributes class >> defaultFrequency [
	^ DefaultFrequency ifNil: [ DefaultFrequency := 44800 ].
]

{ #category : #configuration }
ALContextAttributes class >> defaultFrequency: anInteger [
	DefaultFrequency := anInteger
]

{ #category : #private }
ALContextAttributes >> addAttribute: attribute value: value into: list [
	value ifNotNil: [ 
		list add: attribute;
			add: value
	]
]

{ #category : #converting }
ALContextAttributes >> asList [
	| list externalList |
	list := OrderedCollection new.
	self
		addAttribute: ALC_FREQUENCY value: frequency into: list;
		addAttribute: ALC_REFRESH value: refresh into: list;
		addAttribute: ALC_SYNC value: sync into: list;
		addAttribute: ALC_MONO_SOURCES value: monoSources into: list;
		addAttribute: ALC_STEREO_SOURCES value: stereoSources into: list.
	externalList := ExternalAddress gcallocate: 4 * list size.
	list doWithIndex: [ :word :i | externalList unsignedLongAt: i put: (word bitAnd: 16rFFFFFFFF)].
	^ externalList
]

{ #category : #accessing }
ALContextAttributes >> frequency [
	^ frequency
]

{ #category : #accessing }
ALContextAttributes >> frequency: anObject [
	frequency := anObject
]

{ #category : #initialization }
ALContextAttributes >> initialize [
	super initialize.
	frequency := self class defaultFrequency.
]

{ #category : #accessing }
ALContextAttributes >> monoSources [
	^ monoSources
]

{ #category : #accessing }
ALContextAttributes >> monoSources: anObject [
	monoSources := anObject
]

{ #category : #accessing }
ALContextAttributes >> refresh [
	^ refresh
]

{ #category : #accessing }
ALContextAttributes >> refresh: anObject [
	refresh := anObject
]

{ #category : #accessing }
ALContextAttributes >> stereoSources [
	^ stereoSources
]

{ #category : #accessing }
ALContextAttributes >> stereoSources: anObject [
	stereoSources := anObject
]

{ #category : #accessing }
ALContextAttributes >> sync [
	^ sync
]

{ #category : #accessing }
ALContextAttributes >> sync: anObject [
	sync := anObject
]
