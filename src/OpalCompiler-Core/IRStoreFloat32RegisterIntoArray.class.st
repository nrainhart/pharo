Class {
	#name : #IRStoreFloat32RegisterIntoArray,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRStoreFloat32RegisterIntoArray >> accept: aVisitor [
	^ aVisitor visitStoreFloat32RegisterIntoArray: self
]
