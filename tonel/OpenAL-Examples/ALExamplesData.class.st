Class {
	#name : #ALExamplesData,
	#superclass : #Object,
	#classVars : [
		'A4Frequency',
		'A4Id',
		'FrequencyTable',
		'InvSqrt12',
		'NoteDictionary',
		'OctaveNotes',
		'Sqrt12'
	],
	#pools : [
		'OpenALConstants'
	],
	#category : #'OpenAL-Examples'
}

{ #category : #'as yet unclassified' }
ALExamplesData class >> initialize [
	"
	self initialize
	"
	| currentFrequency |
	super initialize.
	
	A4Id := 58.
	A4Frequency := 440.
	Sqrt12 := ((2 ln) / 12) exp.
	InvSqrt12 := 1.0 / Sqrt12.
	OctaveNotes := #(c cs d ds e f fs g gs a as b).
	FrequencyTable := Array new: 108.
	
	"Move to 0"
	currentFrequency := A4Frequency.
	A4Id to: 1 by: -1 do: [ :i |
		FrequencyTable at: i put: currentFrequency.
		currentFrequency := currentFrequency * InvSqrt12.
	].

	"Move to 128"
	currentFrequency := A4Frequency.
	A4Id to: FrequencyTable size do: [ :i |
		FrequencyTable at: i put: currentFrequency.
		currentFrequency := currentFrequency * Sqrt12.
	].

	"Create the note dictionary"
	NoteDictionary := IdentityDictionary new.
	FrequencyTable withIndexDo: [ :freq :i |
		NoteDictionary at: (self noteIdToName: i) put: freq.
	]
]

{ #category : #'as yet unclassified' }
ALExamplesData class >> noteIdToName: id [
	| octave note |
	octave := (id - 1) // 12.
	note := ((id - 1) % 12) + 1.
	^ ((OctaveNotes at: note) , octave printString) asSymbol
]

{ #category : #'as yet unclassified' }
ALExamplesData >> a4 [
	^ 440
]

{ #category : #'as yet unclassified' }
ALExamplesData >> cosine: frequency phase: phase [
	| data random dt omega value |
	data := ByteArray new: self sampleRate.
	random := Random new.
	dt := 1.0 / self sampleRate.
	omega := 2* (Float pi) * frequency.
	1 to: data size do: [ :i |
		value := (omega*dt*i - phase) cos.
		data at: i put: (self floatToByte: value)
	].
	^ self makeBuffer: data
	
]

{ #category : #'as yet unclassified' }
ALExamplesData >> floatToByte: value [
	^ (((value*0.5 + 0.5) * 255) asInteger max: 0) min: 255
]

{ #category : #'as yet unclassified' }
ALExamplesData >> floatToSByte: value [
	^ ((value* 255) asInteger max: 0) min: 255
]

{ #category : #'as yet unclassified' }
ALExamplesData >> makeBuffer: data [
	| buffer |
	buffer := OpenAL genBuffer.
	OpenAL bufferData: buffer format: AL_FORMAT_MONO8 data: data size: data size freq: self sampleRate.
	^ buffer
]

{ #category : #'as yet unclassified' }
ALExamplesData >> noise [
	| data random |
	data := ByteArray new: self sampleRate.
	random := Random new.
	1 to: data size do: [ :i | data at: i put: (random nextInt: 255) ].
	^ self makeBuffer: data
	
]

{ #category : #'as yet unclassified' }
ALExamplesData >> note: note [
	| freq |
	freq := NoteDictionary at: note.
	^ self cosine: freq phase: 0.
]

{ #category : #'as yet unclassified' }
ALExamplesData >> sampleRate [
	^ 44100
]

{ #category : #'as yet unclassified' }
ALExamplesData >> sawtooth: frequency phase: phase [
	| data random dt value x|
	data := ByteArray new: self sampleRate.
	random := Random new.
	dt := 1.0 / self sampleRate.
	1 to: data size do: [ :i |
		x := i*dt*frequency - phase.
		value := x - (x floor).
		data at: i put: (self floatToByte: value)
	].
	^ self makeBuffer: data
	
]

{ #category : #'as yet unclassified' }
ALExamplesData >> sawtoothNote: note [
	| freq |
	freq := NoteDictionary at: note.
	^ self sawtooth: freq phase: 0.
]
