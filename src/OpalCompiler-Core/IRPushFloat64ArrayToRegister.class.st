Class {
	#name : #IRPushFloat64ArrayToRegister,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRPushFloat64ArrayToRegister >> accept: aVisitor [
	^ aVisitor visitPushFloat64ArrayToRegister: self
]
