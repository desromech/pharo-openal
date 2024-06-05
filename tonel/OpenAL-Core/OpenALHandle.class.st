"
I represent a handle to an OpenAL object.
"
Class {
	#name : 'OpenALHandle',
	#superclass : 'FFIExternalObject',
	#category : 'OpenAL-Core-OpenAL-Core',
	#package : 'OpenAL-Core',
	#tag : 'OpenAL-Core'
}

{ #category : 'as yet unclassified' }
OpenALHandle class >> ffiLibraryName [
	^ OpenAL ffiLibraryName
]

{ #category : 'library' }
OpenALHandle >> ffiLibraryName [
	^ self class ffiLibraryName
]
