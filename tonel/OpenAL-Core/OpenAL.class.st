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
	^ self ffiCall: #( void alBuffer3f ( ALuint sid , ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #buffers }
OpenAL class >> buffer3i: bid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alBuffer3i ( ALuint sid , ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #buffers }
OpenAL class >> bufferData: bid format: bufferFormat data: data size: size freq: freq [
	^ self ffiCall: #( void alBufferData ( ALuint bid , ALenum bufferFormat , ALvoid* data , ALsizei size , ALsizei freq ) )
]

{ #category : #buffers }
OpenAL class >> bufferf: bid param: param value: value [
	^ self ffiCall: #( void alBufferf ( ALuint sid , ALenum param , ALfloat value ) )
]

{ #category : #buffers }
OpenAL class >> bufferfv: bid param: param values: values [
	^ self ffiCall: #( void alBufferfv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #buffers }
OpenAL class >> bufferi: bid param: param value: value [
	^ self ffiCall: #( void alBufferi ( ALuint sid , ALenum param , ALint value ) )
]

{ #category : #buffers }
OpenAL class >> bufferiv: bid param: param values: values [
	^ self ffiCall: #( void alBufferiv ( ALuint sid , ALenum param , ALint* values ) )
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
	^ self ffiCall: #( void alDeleteBuffers ( ALsizei n , ALuint* buffers ) )
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
	^ self ffiCall: #( void alDeleteSources ( ALsizei n , ALuint* sources ) )
]

{ #category : #'enable/disable' }
OpenAL class >> disable: capability [
	^ self ffiCall: #( void alDisable ( ALenum capability ) )
]

{ #category : #'global parameters' }
OpenAL class >> distanceModel: distanceModel [
	^ self ffiCall: #( void alDistanceModel ( ALenum distanceModel ) )
]

{ #category : #'global parameters' }
OpenAL class >> dopplerFactor: value [
	^ self ffiCall: #( void alDopplerFactor ( ALfloat value ) )
]

{ #category : #'global parameters' }
OpenAL class >> dopplerVelocity: value [
	^ self ffiCall: #( void alDopplerVelocity ( ALfloat value ) )
]

{ #category : #'enable/disable' }
OpenAL class >> enable: capability [
	^ self ffiCall: #( void alEnable ( ALenum capability ) )
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
	^ self ffiCall: #( void alGenBuffers ( ALsizei n , ALuint* buffers ) )
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
	^ self ffiCall: #( void alGenSources ( ALsizei n , ALuint* sources ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getBoolean: param [
	^ self ffiCall: #( ALboolean alGetBoolean ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getBooleanv: param data: data [
	^ self ffiCall: #( void alGetBooleanv ( ALenum param , ALboolean data) )
]

{ #category : #buffers }
OpenAL class >> getBuffer3f: bid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetBuffer3f ( ALuint sid , ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #buffers }
OpenAL class >> getBuffer3i: bid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetBuffer3i ( ALuint sid , ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #buffers }
OpenAL class >> getBufferf: bid param: param value: value [
	^ self ffiCall: #( void alGetBufferf ( ALuint sid , ALenum param , ALfloat* value ) )
]

{ #category : #buffers }
OpenAL class >> getBufferfv: bid param: param values: values [
	^ self ffiCall: #( void alGetBufferfv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #buffers }
OpenAL class >> getBufferi: bid param: param value: value [
	^ self ffiCall: #( void alGetBufferi ( ALuint sid , ALenum param , ALint* value ) )
]

{ #category : #buffers }
OpenAL class >> getBufferiv: bid param: param values: values [
	^ self ffiCall: #( void alGetBufferiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getDouble: param [
	^ self ffiCall: #( ALdouble alGetDouble ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getDoublev: param data: data [
	^ self ffiCall: #( void alGetDoublev ( ALenum param , ALdouble data) )
]

{ #category : #extensions }
OpenAL class >> getEnumValue: enumName [
	^ self ffiCall: #( ALCenum alGetEnumValue ( String enumName ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getError [
	^ self ffiCall: #( ALenum alGetError ( ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getFloat: param [
	^ self ffiCall: #( ALfloat alGetFloat ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getFloatv: param data: data [
	^ self ffiCall: #( void alGetFloatv ( ALenum param , ALfloat data) )
]

{ #category : #'state retrieval' }
OpenAL class >> getInteger: param [
	^ self ffiCall: #( ALint alGetInteger ( ALenum param ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getIntegerv: param data: data [
	^ self ffiCall: #( void alGetIntegerv ( ALenum param , ALint data) )
]

{ #category : #listener }
OpenAL class >> getListener3f: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetListener3f ( ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #listener }
OpenAL class >> getListener3i: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetListener3i ( ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #listener }
OpenAL class >> getListenerf: param value: value [
	^ self ffiCall: #( void alGetListenerf ( ALenum param , ALfloat* value ) )
]

{ #category : #listener }
OpenAL class >> getListenerfv: param values: values [
	^ self ffiCall: #( void alGetListenerfv ( ALenum param , ByteArray values ) )
]

{ #category : #listener }
OpenAL class >> getListeneri: param value: value [
	^ self ffiCall: #( void alGetListeneri ( ALenum param , ALint* value ) )
]

{ #category : #listener }
OpenAL class >> getListeneriv: param values: values [
	^ self ffiCall: #( void alGetListeneriv ( ALenum param , ALint* values ) )
]

{ #category : #extensions }
OpenAL class >> getProcAddress: extensionName [
	^ self ffiCall: #( void* alGetProcAddress ( String extensionName ) )
]

{ #category : #sources }
OpenAL class >> getSource3f: sid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetSource3f ( ALuint sid , ALenum param , ALfloat* value1 , ALfloat* value2 , ALfloat* value3 ) )
]

{ #category : #sources }
OpenAL class >> getSource3i: sid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alGetSource3i ( ALuint sid , ALenum param , ALint* value1 , ALint* value2 , ALint* value3 ) )
]

{ #category : #sources }
OpenAL class >> getSourcef: sid param: param value: value [
	^ self ffiCall: #( void alGetSourcef ( ALuint sid , ALenum param , ALfloat* value ) )
]

{ #category : #sources }
OpenAL class >> getSourcefv: sid param: param values: values [
	^ self ffiCall: #( void alGetSourcefv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #sources }
OpenAL class >> getSourcei: sid param: param value: value [
	^ self ffiCall: #( void alGetSourcei ( ALuint sid , ALenum param , ALint* value ) )
]

{ #category : #sources }
OpenAL class >> getSourceiv: sid param: param values: values [
	^ self ffiCall: #( void alGetSourceiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'state retrieval' }
OpenAL class >> getString: param [
	^ self ffiCall: #( String alGetString ( ALenum param ) )
]

{ #category : #buffers }
OpenAL class >> isBuffer: bid [
	^ self ffiCall: #( ALboolean alIsBuffer ( ALuint bid ) )
]

{ #category : #extensions }
OpenAL class >> isExtensionPresent: extensionName [
	^ self ffiCall: #( ALCboolean alIsExtensionPresent ( String extensionName ) )
]

{ #category : #sources }
OpenAL class >> isSource: sid [
	^ self ffiCall: #( ALboolean alIsSource ( ALuint sid ) )
]

{ #category : #listener }
OpenAL class >> listener3f: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alListener3f ( ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #listener }
OpenAL class >> listener3i: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alListener3i ( ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #listener }
OpenAL class >> listenerf: param value: value [
	^ self ffiCall: #( void alListenerf ( ALenum param , ALfloat value ) )
]

{ #category : #listener }
OpenAL class >> listenerfv: param values: values [
	^ self ffiCall: #( void alListenerfv ( ALenum param , ByteArray values ) )
]

{ #category : #listener }
OpenAL class >> listeneri: param value: value [
	^ self ffiCall: #( void alListeneri ( ALenum param , ALint value ) )
]

{ #category : #listener }
OpenAL class >> listeneriv: param values: values [
	^ self ffiCall: #( void alListeneriv ( ALenum param , ALint* values ) )
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
	^ self ffiCall: #( void alSource3f ( ALuint sid , ALenum param , ALfloat value1 , ALfloat value2 , ALfloat value3 ) )
]

{ #category : #sources }
OpenAL class >> source3i: sid param: param value: value1 value: value2 value: value3 [
	^ self ffiCall: #( void alSource3i ( ALuint sid , ALenum param , ALint value1 , ALint value2 , ALint value3 ) )
]

{ #category : #sources }
OpenAL class >> sourcePause: sid [
	^ self ffiCall: #( void alSourcePause ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourcePausev: n sources: sources [
	^ self ffiCall: #( void alSourcePausev ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourcePlay: sid [
	^ self ffiCall: #( void alSourcePlay ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourcePlayv: n sources: sources [
	^ self ffiCall: #( void alSourcePlayv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceQueueBuffers: sid numEntries: numEntries buffers: buffers [
	^ self ffiCall: #( void alSourceQueueBuffers ( ALuint sid , ALsizei numEntries , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> sourceRewindv: n sources: sources [
	^ self ffiCall: #( void alSourceRewindv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceRewing: sid [
	^ self ffiCall: #( void alSourceRewind ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourceStop: sid [
	^ self ffiCall: #( void alSourceStop ( ALuint sid ) )
]

{ #category : #sources }
OpenAL class >> sourceStopv: n sources: sources [
	^ self ffiCall: #( void alSourceStopv ( ALsizei n , ALuint* sources ) )
]

{ #category : #sources }
OpenAL class >> sourceUnqueueBuffers: sid numEntries: numEntries buffers: buffers [
	^ self ffiCall: #( void alSourceUnqueueBuffers ( ALuint sid , ALsizei numEntries , ALuint* buffers ) )
]

{ #category : #sources }
OpenAL class >> sourcef: sid param: param value: value [
	^ self ffiCall: #( void alSourcef ( ALuint sid , ALenum param , ALfloat value ) )
]

{ #category : #sources }
OpenAL class >> sourcefv: sid param: param values: values [
	^ self ffiCall: #( void alSourcefv ( ALuint sid , ALenum param , ALfloat* values ) )
]

{ #category : #sources }
OpenAL class >> sourcei: sid param: param value: value [
	^ self ffiCall: #( void alSourcei ( ALuint sid , ALenum param , ALint value ) )
]

{ #category : #sources }
OpenAL class >> sourceiv: sid param: param values: values [
	^ self ffiCall: #( void alSourceiv ( ALuint sid , ALenum param , ALint* values ) )
]

{ #category : #'global parameters' }
OpenAL class >> speedOfSound: value [
	^ self ffiCall: #( void alSpeedOfSound ( ALfloat value ) )
]
