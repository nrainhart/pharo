Class {
	#name : #IRAddFloat64Vector,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRAddFloat64Vector >> accept: aVisitor [
	
	^ aVisitor visitAddFloat64Vector: self
]
