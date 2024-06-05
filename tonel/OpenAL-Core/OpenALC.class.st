"
I am wrapper of the OpenAL context functions.
"
Class {
	#name : 'OpenALC',
	#superclass : 'Object',
	#pools : [
		'OpenALCConstants',
		'OpenALCTypes'
	],
	#category : 'OpenAL-Core-Context',
	#package : 'OpenAL-Core',
	#tag : 'Context'
}

{ #category : 'device opening' }
OpenALC class >> captureOpenDevice: deviceName frequency: frequency format: captureFormat bufferSize: bufferSize [
	^ self ffiCall: #( ALCdevice alcCaptureOpenDevice ( String deviceName , ALCuint frequency , ALCenum captureFormat , ALCsizei bufferSize) )
]

{ #category : 'accessing' }
OpenALC class >> currentContext [
	^ self ffiCall: #( ALCcontext alcGetCurrentContext ( ) )
]

{ #category : 'accessing' }
OpenALC class >> currentContext: context [
	^ self ffiCall: #( ALCboolean alcMakeContextCurrent ( ALCcontext context ) )
]

{ #category : 'ffi library' }
OpenALC class >> ffiLibraryName [
	^ OpenAL ffiLibraryName
]

{ #category : 'accessing' }
OpenALC class >> nullCurrentContext [
	^ self currentContext: nil
]

{ #category : 'device opening' }
OpenALC class >> openDefaultDevice [
	^ self openDevice: nil
]

{ #category : 'device opening' }
OpenALC class >> openDevice: deviceName [
	^ self ffiCall: #( ALCdevice alcOpenDevice ( String deviceName ) )
]
