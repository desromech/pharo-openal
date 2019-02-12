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
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcCaptureSamples ( self , ALCvoid* buffer , ALCsizei samples) )
]

{ #category : #capture }
ALCdevice >> captureClose [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcCaptureCloseDevice ( self ) )
]

{ #category : #capture }
ALCdevice >> captureStart [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcCaptureStart ( self ) )
]

{ #category : #capture }
ALCdevice >> captureStop [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcCaptureStop ( self ) )
]

{ #category : #'initialize-release' }
ALCdevice >> close [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcCloseDevice ( self ) )
]

{ #category : #'context creation' }
ALCdevice >> createContext: attributeList [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCcontext alcCreateContext ( self , ALCint*  attributeList) )
]

{ #category : #getters }
ALCdevice >> getEnumValue: enumName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCenum alcGetEnumValue ( self , String enumName ) )
]

{ #category : #getters }
ALCdevice >> getError [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCenum alcGetError ( self ) )
]

{ #category : #getters }
ALCdevice >> getIntegerv: param size: size data: data [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alcGetIntegerv ( self , ALCenum param , ALCsizei size , ALCint* data ) )
]

{ #category : #extensions }
ALCdevice >> getProcAddress: extensionName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void* alcGetProcAddress ( self , String extensionName ) )
]

{ #category : #getters }
ALCdevice >> getString: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( String alcGetString ( self , ALCenum param ) )
]

{ #category : #extensions }
ALCdevice >> isExtensionPresent: extensionName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcIsExtensionPresent ( self , String extensionName ) )
]
