Class {
	#name : #IRPushArrayToRegister,
	#superclass : #IRInstruction,
	#category : #'OpalCompiler-Core-IR-Nodes'
}

{ #category : #visiting }
IRPushArrayToRegister >> accept: aVisitor [
	^ aVisitor visitPushArrayToRegister: self
]
