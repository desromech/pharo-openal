Class {
	#name : #BaselineOfOpenAL,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenAL
}

{ #category : #baselines }
BaselineOfOpenAL >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec 
			package: 'OpenAL-Core';
			package: #'OpenAL-Examples' with: [
				spec requires: #('OpenAL-Core' ). ]. ].

]
