Class {
	#name : #Float64Array,
	#superclass : #ArrayedCollection,
	#type : #DoubleWordLayout,
	#category : #'Collections-Native-Base'
}

{ #category : #accessing }
Float64Array >> at: anIndex [

	^ Float fromIEEE64Bit: (self basicAt: anIndex) 
]

{ #category : #accessing }
Float64Array >> at: anIndex put: aFloat [

	self basicAt: anIndex put: aFloat asIEEE64BitWord.
	^ aFloat
]
