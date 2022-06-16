Class {
	#name : #IRAddFloat32Vector,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRAddFloat32Vector >> accept: aVisitor [
	
	^ aVisitor visitAddFloat32Vector: self
]
