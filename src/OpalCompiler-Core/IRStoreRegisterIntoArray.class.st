Class {
	#name : #IRStoreRegisterIntoArray,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRStoreRegisterIntoArray >> accept: aVisitor [
	^ aVisitor visitStoreRegisterIntoArray: self
]
