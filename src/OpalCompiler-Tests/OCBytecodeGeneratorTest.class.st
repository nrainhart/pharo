Class {
	#name : #OCBytecodeGeneratorTest,
	#superclass : #TestCase,
	#category : #'OpalCompiler-Tests-Bytecode'
}

{ #category : #accessing }
OCBytecodeGeneratorTest class >> packageNamesUnderTest [
	^ #('OpalCompiler')
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addVector: arg1 with: arg2 [

	^ arg2
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addVector: arg1 with: arg2 intoVector: arg3 [

	| tmp1 tmp2 |
	tmp1 := 0.
	tmp2 := arg1 size.
	[ tmp2 = tmp1 ] whileFalse: [ 
		arg3.
		tmp1 := tmp1 + 2 ].
	^ arg3
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addVectorScalar: x with: y intoVector: z [

	^ 1 to: x size do: [ :i | z at: i put: ((x at: i) + (y at: i)) ]
]

{ #category : #helper }
OCBytecodeGeneratorTest >> bytecodeGenerator [
	^ IRBytecodeGenerator newWithEncoderClass: EncoderForSistaV1
]

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testArraySumUsingVectorBytecode [
	| cm x y result z |

	x := Float64Array withAll: #(1.0 2.0 3.0 4.0 5.0 6.0).
	y := Float64Array withAll: #(10.0 20.0 30.0 40.0 50.0 60.0).
	z := Float64Array new: 6.
		
	cm := IRBuilder buildMethod: [ :builder |"TODO handle arrays with an odd number of elements"
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };
				"storeTemp: #thirdVector;
				storeTemp: #secondVector;
				storeTemp: #firstVector;" "Not needed. Temps are automatically populated from args"
				pushLiteral: 0;
				storeTemp: #i;
				popTop; "storeTemp does not pop the element from the stack"
				pushTemp: #firstVector;
				send: #size;
				storeTemp: #end;
				popTop;
				jumpBackTarget: #loop;
				pushTemp: #end;
				pushTemp: #i;
				send: #=;
				jumpAheadTo: #exit if: true;
					pushTemp: #i;
					pushTemp: #firstVector;
					pushArrayToRegister;
					pushTemp: #i;
					pushTemp: #secondVector;
					pushArrayToRegister;
					addVector;
					pushTemp: #i;
					pushTemp: #thirdVector;
					storeRegisterIntoArray;
					popTop;
				pushTemp: #i;
				pushLiteral: 2;
				send: #+;
				storeTemp: #i;
				popTop;
				jumpBackTo: #loop;
				jumpAheadTarget: #exit;
				pushTemp: #thirdVector;
				returnTop
		 ].
	
	self class addSelector: #addVector:with:intoVector: withMethod: cm.
	
	result := self addVector: x with: y intoVector: z.

	self assertCollection: result equals: (Float64Array withAll: #(11.0 22.0 33.0 44.0 55.0 66.0)).
]

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testExample [
	| cm |
	cm := self bytecodeGenerator
		numArgs: 1;
		numTemps: 1;
		pushTemp: 1;
		pushInstVar: 2;
		send: #>;
		if: false goto: #else;
		pushLiteral: 'yes';
		returnTop;
		label: #else;
		pushLiteral: 'no';
		returnTop;
		compiledMethod.
	cm methodClass: self class.
	cm selector: #test.

	self assert: (cm isKindOf: CompiledMethod).
	self assert: (cm valueWithReceiver: 2 @ 2 arguments: #(1)) equals: 'no'.
	self assert: (cm valueWithReceiver: 2 @ 2 arguments: #(3)) equals: 'yes'.
	^ cm
]

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testExample2 [
	| cm |
	cm := self bytecodeGenerator
		numArgs: 1;
		numTemps: 1;
		pushInstVar: 2;
		pushTemp: 1;
		send: #<;
		if: false goto: #else;
		pushLiteral: 'yes';
		returnTop;
		label: #else;
		pushLiteral: 'no';
		returnTop;
		compiledMethod.

	self assert: (cm isKindOf: CompiledMethod).
	self assert: (cm valueWithReceiver: 2 @ 2 arguments: #(1)) equals: 'no'.
	self assert: (cm valueWithReceiver: 2 @ 2 arguments: #(3)) equals: 'yes'.
	^ cm
]

{ #category : #helper }
OCBytecodeGeneratorTest >> testMethod: cm against: string [
	| symbolic |
	self assert: cm isCompiledMethod.
	symbolic := String streamContents: [ :str | cm longPrintOn: str ].
	self assert: symbolic equals: string
]

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testTranspiledAddVectorBytecode [
	| cm x y result |

	x := Float64Array new: 2.
	x at: 1 put: 1.0.
	x at: 2 put: 2.0.
	y := Float64Array new: 2.
	y at: 1 put: 3.0.
	y at: 2 put: 4.0.
	
	cm := IRBuilder buildMethod: [ :builder |
		builder
				numArgs: 2; 		
				addTemps: { #firstVector. #secondVector };
				pushTemp: #firstVector;
				pushTemp: #secondVector;
				addVector;
				returnTop
		 ].
	
	self class addSelector: #addVector:with: withMethod: cm.
	
	result := self addVector: x with: y.

	self assert: (result at: 1) equals: 4.0.
	self assert: (result at: 2) equals: 6.0.
]
