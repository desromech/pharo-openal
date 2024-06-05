"
I represent the datatypes used by the OpenAL context functions.
"
Class {
	#name : 'OpenALCTypes',
	#superclass : 'SharedPool',
	#classVars : [
		'ALCboolean',
		'ALCbyte',
		'ALCchar',
		'ALCdouble',
		'ALCenum',
		'ALCfloat',
		'ALCint',
		'ALCshort',
		'ALCsizei',
		'ALCubyte',
		'ALCuint',
		'ALCushort',
		'ALCvoid'
	],
	#category : 'OpenAL-Core-Context',
	#package : 'OpenAL-Core',
	#tag : 'Context'
}

{ #category : 'class initialization' }
OpenALCTypes class >> initialize [
	"
	self initialize.
	"
	super initialize.
	ALCboolean := #char.
	ALCchar := #char.
	ALCbyte := #char.
	ALCubyte := #uchar.
	ALCshort := #short.
	ALCushort := #ushort.
	ALCint := #int.
	ALCuint := #uint.
	ALCsizei := #int.
	ALCenum := #int.
	ALCfloat := #float.
	ALCdouble := #double.
	ALCvoid := #void.
]
