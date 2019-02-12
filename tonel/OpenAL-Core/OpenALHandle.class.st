"
I represent a handle to an OpenAL object.
"
Class {
	#name : #OpenALHandle,
	#superclass : #FFIExternalObject,
	#category : #'OpenAL-Core-OpenAL-Core'
}

{ #category : #'as yet unclassified' }
OpenALHandle class >> ffiLibraryName [
	^ OpenAL ffiLibraryName
]

{ #category : #library }
OpenALHandle >> ffiLibraryName [
	^ self class ffiLibraryName
]
