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
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcDestroyContext ( self ) )
]

{ #category : #accessing }
ALCcontext >> device [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcGetContextsDevice ( self ) )
]

{ #category : #'current context' }
ALCcontext >> makeCurrent [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcMakeContextCurrent ( self ) )
]

{ #category : #'pause resume' }
ALCcontext >> process [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcProcessContext ( self ) )
]

{ #category : #'pause resume' }
ALCcontext >> suspend [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcSuspendContext ( self ) )
]
