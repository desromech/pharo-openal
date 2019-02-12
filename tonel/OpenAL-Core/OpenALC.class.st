"
I am wrapper of the OpenAL context functions.
"
Class {
	#name : #OpenALC,
	#superclass : #Object,
	#pools : [
		'OpenALCConstants',
		'OpenALCTypes'
	],
	#category : #'OpenAL-Core-Context'
}

{ #category : #'device opening' }
OpenALC class >> captureOpenDevice: deviceName frequency: frequency format: captureFormat bufferSize: bufferSize [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCdevice alcCaptureOpenDevice ( String deviceName , ALCuint frequency , ALCenum captureFormat , ALCsizei bufferSize) )
]

{ #category : #accessing }
OpenALC class >> currentContext [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCcontext alcGetCurrentContext ( ) )
]

{ #category : #accessing }
OpenALC class >> currentContext: context [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcMakeContextCurrent ( ALCcontext context ) )
]

{ #category : #'ffi library' }
OpenALC class >> ffiLibraryName [
	^ OpenAL ffiLibraryName
]

{ #category : #accessing }
OpenALC class >> nullCurrentContext [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alcMakeContextCurrent ( nil ) )
]

{ #category : #'device opening' }
OpenALC class >> openDefaultDevice [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCdevice alcOpenDevice ( nil ) )
]

{ #category : #'device opening' }
OpenALC class >> openDevice: deviceName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCdevice alcOpenDevice ( String deviceName ) )
]
