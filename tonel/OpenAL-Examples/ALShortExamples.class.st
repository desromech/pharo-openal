Class {
	#name : #ALShortExamples,
	#superclass : #Object,
	#pools : [
		'OpenALCConstants',
		'OpenALConstants'
	],
	#category : #'OpenAL-Examples'
}

{ #category : #'as yet unclassified' }
ALShortExamples >> doReMi [
	"
	self new doReMi
	"
	
	"Create the context"
	| contextAttributes device context buffer source notes |
	notes := #(c4 d4 e4 f4 g4 a4 b4 c5 b4 a4 g4 f4 e4 d4 c4).
	
	contextAttributes := ALContextAttributes new.
	device := OpenALC openDefaultDevice.
	context := device createContext: contextAttributes asList.
	context process.
	
	context currentDuring: [
		
		"Play the notes"
		notes do: [ :note |
			"Create the buffer"
			buffer := ALExamplesData new note: note.
		
			"Create the source"
			source := OpenAL genSource.
			OpenAL sourcei: source param: AL_BUFFER value: buffer;
			sourcei: source param: AL_LOOPING value: AL_TRUE.
		
			"Play the source"
			OpenAL sourcePlay: source.
		
			"Play for sometime "
			(Delay forMilliseconds: 500) wait.
		
			"Delete the source and the buffer"
			OpenAL deleteSource: source;
				deleteBuffer: buffer.
		]
	].

	OpenALC nullCurrentContext.
	context destroy.
	device close.

]

{ #category : #'as yet unclassified' }
ALShortExamples >> doReMi2 [
	"
	self new doReMi2
	"
	
	"Create the context"
	| contextAttributes device context buffer source notes bpm measure wholeDuration note duration |
	bpm := 120. "Beats per minute"
	measure := 4/4.
	wholeDuration := 60 * 1000 / (bpm * measure).
	notes := {
		#c4 . 2/4 . #c4 . 1/4 . #c4 . 1/4 .
		#d4 . 2/4 . #d4 . 1/4 . #d4 . 1/4 .
		#e4 . 1/4 . #e4 . 1/4 . #e4 . 2/4 .
		#f4 . 1/8 . #f4 . 1/8 . #f4 . 1/4 . #f4 . 2/4 .
		#g4 . 1 .
		#a4 . 2/4 . #a4 . 1/4 . #a4 . 1/8 . #a4 . 1/8 .
		#b4 . 1/4 . #c5 . 1
	}.

	
	contextAttributes := ALContextAttributes new.
	device := OpenALC openDefaultDevice.
	context := device createContext: contextAttributes asList.
	context process.
	
	context currentDuring: [
		
		"Play the notes"
		1 to: notes size / 2 do: [ :i  |
			note := notes at: i*2 - 1.
			duration := notes at: i*2.
			 
			"Create the buffer"
			buffer := ALExamplesData new sawtoothNote: note.
		
			"Create the source"
			source := OpenAL genSource.
			OpenAL sourcei: source param: AL_BUFFER value: buffer;
			sourcei: source param: AL_LOOPING value: AL_TRUE.
		
			"Play the source"
			OpenAL sourcePlay: source.
		
			"Play for sometime "
			(Delay forMilliseconds: duration*wholeDuration) wait.
		
			"Delete the source and the buffer"
			OpenAL deleteSource: source;
				deleteBuffer: buffer.
		]
	].

	OpenALC nullCurrentContext.
	context destroy.
	device close.

]

{ #category : #'as yet unclassified' }
ALShortExamples >> noisePlayer [
	"
	self new noisePlayer
	"
	
	"Create the context"
	| contextAttributes device context buffer source |
	contextAttributes := ALContextAttributes new.
	device := OpenALC openDefaultDevice.
	context := device createContext: contextAttributes asList.
	context process.
	
	context currentDuring: [
		
		"Create the buffer"
		buffer := ALExamplesData new noise.
		
		"Create the source"
		source := OpenAL genSource.
		OpenAL sourcei: source param: AL_BUFFER value: buffer;
			sourcei: source param: AL_LOOPING value: AL_TRUE.
		
		"Play the source"
		OpenAL sourcePlay: source.
		
		"Play for sometime "
		(Delay forSeconds: 3) wait.
		
		"Delete the source and the buffer"
		OpenAL deleteSource: source;
			deleteBuffer: buffer.
	].

	OpenALC nullCurrentContext.
	context destroy.
	device close.

]
