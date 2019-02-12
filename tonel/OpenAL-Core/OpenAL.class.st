"
This class provides NativeBoost wrappers for the OpenAL library.
"
Class {
	#name : #OpenAL,
	#superclass : #Object,
	#classVars : [
		'ModuleHandle',
		'ModuleSession'
	],
	#pools : [
		'OpenALConstants',
		'OpenALTypes'
	],
	#category : #'OpenAL-Core-OpenAL-Core'
}

{ #category : #buffers }
OpenAL class >> buffer3f: bid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBuffer3f ( ALuint sid , ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #buffers }
OpenAL class >> buffer3i: bid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBuffer3i ( ALuint sid , ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #buffers }
OpenAL class >> bufferData: bid format: bufferFormat data: data size: size freq: freq [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBufferData ( ALuint bid , ALenum bufferFormat , ALvoid* data , ALsizei size , ALsizei freq ) )
]

{ #category : #buffers }
OpenAL class >> bufferf: bid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBufferf ( ALuint sid , ALenum param , ALfloat value ) )
]

{ #category : #buffers }
OpenAL class >> bufferfv: bid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBufferfv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #buffers }
OpenAL class >> bufferi: bid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBufferi ( ALuint sid , ALenum param , ALint value ) )
]

{ #category : #buffers }
OpenAL class >> bufferiv: bid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alBufferiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'library path' }
OpenAL class >> checkLibraryName: aName [
	Transcript show: aName printString; cr.
	^ (ExternalAddress loadSymbol: 'alcCreateContext' from: aName) notNil
]

{ #category : #buffers }
OpenAL class >> deleteBuffer: buffer [
	| bufferArray |
	bufferArray := ExternalAddress allocate: 4.
	bufferArray unsignedLongAt: 1 put: buffer. 
	[
		self deleteSources: 1 sources: bufferArray.
	] ensure: [ bufferArray free ]
]

{ #category : #buffers }
OpenAL class >> deleteBuffers: n buffers: buffers [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDeleteBuffers ( ALsizei n , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> deleteSource: source [
	| sourceArray |
	sourceArray := ExternalAddress allocate: 4.
	sourceArray unsignedLongAt: 1 put: source. 
	[
		self deleteSources: 1 sources: sourceArray.
	] ensure: [ sourceArray free ]
]

{ #category : #sources }
OpenAL class >> deleteSources: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDeleteSources ( ALsizei n , ALuint* sources ) )
]

{ #category : #'enable/disable' }
OpenAL class >> disable: capability [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDisable ( ALenum capability ) )
]

{ #category : #'global parameters' }
OpenAL class >> distanceModel: distanceModel [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDistanceModel ( ALenum distanceModel ) )
]

{ #category : #'global parameters' }
OpenAL class >> dopplerFactor: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDopplerFactor ( ALfloat value ) )
]

{ #category : #'global parameters' }
OpenAL class >> dopplerVelocity: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alDopplerVelocity ( ALfloat value ) )
]

{ #category : #'enable/disable' }
OpenAL class >> enable: capability [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alEnable ( ALenum capability ) )
]

{ #category : #'library path' }
OpenAL class >> ffiLibraryName [
	^ self loadLibrary
]

{ #category : #'library path' }
OpenAL class >> findOpenAL [
	"Look for OpenAL using different names."
	#(
	opeanl
	libopenal.so
	openal.dll
	'/usr/lib/libopenal.so'
	'/usr/lib32/libopenal.so'
	'/usr/lib/i386-linux-gnu/libopenal.so'
	'/usr/lib/i386-linux-gnu/libopenal.so.1'
	'/usr/lib64/libopenal.so'
	'/usr/lib/x86_64-linux-gnu/libopenal.so'
	'/usr/lib/x86_64-linux-gnu/libopenal.so.1'
	) do: [ :nm | [(self checkLibraryName: nm) ifTrue: [ ^ nm ] ] ifError: [nil] ].
	self error: 'Failed to find openal library.'
]

{ #category : #buffers }
OpenAL class >> genBuffer [
	| res |
	res := ExternalAddress allocate: 4.
	[
		self genBuffers: 1 buffers: res.
		^ res unsignedLongAt: 1
	] ensure: [ res free ]
]

{ #category : #buffers }
OpenAL class >> genBuffers: n buffers: buffers [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGenBuffers ( ALsizei n , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> genSource [
	| res |
	res := ExternalAddress allocate: 4.
	[
		self genSources: 1 sources: res.
		^ res unsignedLongAt: 1
	] ensure: [ res free ]
]

{ #category : #sources }
OpenAL class >> genSources: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGenSources ( ALsizei n , ALuint* sources ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getBoolean: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALboolean alGetBoolean ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getBooleanv: param data: data [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBooleanv ( ALenum param , ALboolean data) )
]

{ #category : #buffers }
OpenAL class >> getBuffer3f: bid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBuffer3f ( ALuint sid , ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #buffers }
OpenAL class >> getBuffer3i: bid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBuffer3i ( ALuint sid , ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #buffers }
OpenAL class >> getBufferf: bid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBufferf ( ALuint sid , ALenum param , ALfloat* value ) )
]

{ #category : #buffers }
OpenAL class >> getBufferfv: bid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBufferfv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #buffers }
OpenAL class >> getBufferi: bid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBufferi ( ALuint sid , ALenum param , ALint* value ) )
]

{ #category : #buffers }
OpenAL class >> getBufferiv: bid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetBufferiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getDouble: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALdouble alGetDouble ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getDoublev: param data: data [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetDoublev ( ALenum param , ALdouble data) )
]

{ #category : #extensions }
OpenAL class >> getEnumValue: enumName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCenum alGetEnumValue ( String enumName ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getError [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALenum alGetError ( ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getFloat: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALfloat alGetFloat ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getFloatv: param data: data [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetFloatv ( ALenum param , ALfloat data) )
]

{ #category : #'state retrieval' }
OpenAL class >> getInteger: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALint alGetInteger ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getIntegerv: param data: data [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetIntegerv ( ALenum param , ALint data) )
]

{ #category : #listener }
OpenAL class >> getListener3f: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListener3f ( ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #listener }
OpenAL class >> getListener3i: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListener3i ( ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #listener }
OpenAL class >> getListenerf: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListenerf ( ALenum param , ALfloat* value ) )
]

{ #category : #listener }
OpenAL class >> getListenerfv: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListenerfv ( ALenum param , ByteArray values ) )
]

{ #category : #listener }
OpenAL class >> getListeneri: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListeneri ( ALenum param , ALint* value ) )
]

{ #category : #listener }
OpenAL class >> getListeneriv: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetListeneriv ( ALenum param , ALint* values ) )
]

{ #category : #extensions }
OpenAL class >> getProcAddress: extensionName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void* alGetProcAddress ( String extensionName ) )
]

{ #category : #sources }
OpenAL class >> getSource3f: sid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSource3f ( ALuint sid , ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #sources }
OpenAL class >> getSource3i: sid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSource3i ( ALuint sid , ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #sources }
OpenAL class >> getSourcef: sid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSourcef ( ALuint sid , ALenum param , ALfloat* value ) )
]

{ #category : #sources }
OpenAL class >> getSourcefv: sid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSourcefv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #sources }
OpenAL class >> getSourcei: sid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSourcei ( ALuint sid , ALenum param , ALint* value ) )
]

{ #category : #sources }
OpenAL class >> getSourceiv: sid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alGetSourceiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getString: param [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( String alGetString ( ALenum param ) )
]

{ #category : #buffers }
OpenAL class >> isBuffer: bid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALboolean alIsBuffer ( ALuint bid ) )
]

{ #category : #extensions }
OpenAL class >> isExtensionPresent: extensionName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALCboolean alIsExtensionPresent ( String extensionName ) )
]

{ #category : #sources }
OpenAL class >> isSource: sid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( ALboolean alIsSource ( ALuint sid ) )
]

{ #category : #listener }
OpenAL class >> listener3f: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListener3f ( ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #listener }
OpenAL class >> listener3i: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListener3i ( ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #listener }
OpenAL class >> listenerf: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListenerf ( ALenum param , ALfloat value ) )
]

{ #category : #listener }
OpenAL class >> listenerfv: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListenerfv ( ALenum param , ByteArray values ) )
]

{ #category : #listener }
OpenAL class >> listeneri: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListeneri ( ALenum param , ALint value ) )
]

{ #category : #listener }
OpenAL class >> listeneriv: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alListeneriv ( ALenum param , ALint* values ) )
]

{ #category : #'library path' }
OpenAL class >> loadLibrary [
	ModuleSession ~~ Smalltalk session ifTrue: [
		ModuleHandle := self findOpenAL.
		ModuleSession := Smalltalk session.
	].
	^ ModuleHandle
]

{ #category : #sources }
OpenAL class >> source3f: sid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSource3f ( ALuint sid , ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #sources }
OpenAL class >> source3i: sid param: param value: value1 value: value2 value: value3 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSource3i ( ALuint sid , ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #sources }
OpenAL class >> sourcePause: sid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcePause ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourcePausev: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcePausev ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourcePlay: sid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcePlay ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourcePlayv: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcePlayv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceQueueBuffers: sid numEntries: numEntries buffers: buffers [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceQueueBuffers ( ALuint sid , ALsizei numEntries , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> sourceRewindv: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceRewindv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceRewing: sid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceRewind ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourceStop: sid [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceStop ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourceStopv: n sources: sources [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceStopv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceUnqueueBuffers: sid numEntries: numEntries buffers: buffers [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceUnqueueBuffers ( ALuint sid , ALsizei numEntries , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> sourcef: sid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcef ( ALuint sid , ALenum param , ALfloat value ) )
]

{ #category : #sources }
OpenAL class >> sourcefv: sid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcefv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #sources }
OpenAL class >> sourcei: sid param: param value: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourcei ( ALuint sid , ALenum param , ALint value ) )
]

{ #category : #sources }
OpenAL class >> sourceiv: sid param: param values: values [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSourceiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'global parameters' }
OpenAL class >> speedOfSound: value [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void alSpeedOfSound ( ALfloat value ) )
]
