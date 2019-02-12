"
This class provides NativeBoost type definitions for the typedef used in OpenAL.
"
Class {
	#name : #OpenALTypes,
	#superclass : #SharedPool,
	#classVars : [
		'ALboolean',
		'ALbyte',
		'ALchar',
		'ALdouble',
		'ALenum',
		'ALfloat',
		'ALint',
		'ALshort',
		'ALsizei',
		'ALubyte',
		'ALuint',
		'ALushort',
		'ALvoid'
	],
	#category : #'OpenAL-Core-OpenAL-Core'
}

{ #category : #'class initialization' }
OpenALTypes class >> initialize [
	"
	self initialize.
	"
	super initialize.
	ALboolean := #char.
	ALchar := #char.
	ALbyte := #char.
	ALubyte := #uchar.
	ALshort := #short.
	ALushort := #ushort.
	ALint := #int.
	ALuint := #uint.
	ALsizei := #int.
	ALenum := #int.
	ALfloat := #float.
	ALdouble := #double.
	ALvoid := #void.
]
