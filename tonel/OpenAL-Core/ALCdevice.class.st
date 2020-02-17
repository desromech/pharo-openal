"
I represent a handle to an OpenAL device.
"
Class {
	#name : #ALCdevice,
	#superclass : #OpenALHandle,
	#pools : [
		'OpenALCConstants',
		'OpenALCTypes'
	],
	#category : #'OpenAL-Core-Context'
}

{ #category : #capture }
ALCdevice >> captureBuffer: buffer samples: samples [
	^ self ffiCall: #( void alcCaptureSamples ( self , ALCvoid* buffer , ALCsizei samples) )
]

{ #category : #capture }
ALCdevice >> captureClose [
	^ self ffiCall: #( ALCboolean alcCaptureCloseDevice ( self ) )
]

{ #category : #capture }
ALCdevice >> captureStart [
	^ self ffiCall: #( void alcCaptureStart ( self ) )
]

{ #category : #capture }
ALCdevice >> captureStop [
	^ self ffiCall: #( void alcCaptureStop ( self ) )
]

{ #category : #'initialize-release' }
ALCdevice >> close [
	^ self ffiCall: #( ALCboolean alcCloseDevice ( self ) )
]

{ #category : #'context creation' }
ALCdevice >> createContext: attributeList [
	^ self ffiCall: #( ALCcontext alcCreateContext ( self , ALCint*  attributeList) )
]

{ #category : #getters }
ALCdevice >> getEnumValue: enumName [
	^ self ffiCall: #( ALCenum alcGetEnumValue ( self , String enumName ) )
]

{ #category : #getters }
ALCdevice >> getError [
	^ self ffiCall: #( ALCenum alcGetError ( self ) )
]

{ #category : #getters }
ALCdevice >> getIntegerv: param size: size data: data [
	^ self ffiCall: #( void alcGetIntegerv ( self , ALCenum param , ALCsizei size , ALCint* data ) )
]

{ #category : #extensions }
ALCdevice >> getProcAddress: extensionName [
	^ self ffiCall: #( void* alcGetProcAddress ( self , String extensionName ) )
]

{ #category : #getters }
ALCdevice >> getString: param [
	^ self ffiCall: #( String alcGetString ( self , ALCenum param ) )
]

{ #category : #extensions }
ALCdevice >> isExtensionPresent: extensionName [
	^ self ffiCall: #( ALCboolean alcIsExtensionPresent ( self , String extensionName ) )
]
