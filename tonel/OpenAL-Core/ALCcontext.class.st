"
I represent a handle to an OpenAL context.
"
Class {
	#name : #ALCcontext,
	#superclass : #OpenALHandle,
	#pools : [
		'OpenALCConstants',
		'OpenALCTypes'
	],
	#category : #'OpenAL-Core-Context'
}

{ #category : #'pause resume' }
ALCcontext >> currentDuring: aBlock [
	"TODO: Use a mutex"
	self makeCurrent.
	aBlock value.
]

{ #category : #initialize }
ALCcontext >> destroy [
	^ self ffiCall: #( void alcDestroyContext ( self ) )
]

{ #category : #accessing }
ALCcontext >> device [
	^ self ffiCall: #( void alcGetContextsDevice ( self ) )
]

{ #category : #'current context' }
ALCcontext >> makeCurrent [
	^ self ffiCall: #( ALCboolean alcMakeContextCurrent ( self ) )
]

{ #category : #'pause resume' }
ALCcontext >> process [
	^ self ffiCall: #( void alcProcessContext ( self ) )
]

{ #category : #'pause resume' }
ALCcontext >> suspend [
	^ self ffiCall: #( void alcSuspendContext ( self ) )
]
