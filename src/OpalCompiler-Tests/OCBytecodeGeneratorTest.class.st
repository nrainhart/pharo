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
OCBytecodeGeneratorTest >> addFloat32Vector: arg1 with: arg2 intoVector: arg3 [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :builder |"TODO handle arrays with a number of elements that is not a multiple of 4"
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

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
					pushFloat32ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat32ArrayToRegister;

					addFloat32Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat32RegisterIntoArray;
					popTop;

				pushTemp: #i;
				pushLiteral: 4;
				send: #+;
				storeTemp: #i;
				popTop;

				jumpBackTo: #loop;
				jumpAheadTarget: #exit;
				pushTemp: #thirdVector;
				returnTop
		 ].
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addFloat64Vector: arg1 with: arg2 intoVector: arg3 [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :builder |"TODO handle arrays with a number of elements that is not a multiple of 4"
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

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
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
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
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addFloat64VectorUnrolled: arg1 with: arg2 intoVector: arg3 [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :builder |"TODO handle arrays with a number of elements that is not a multiple of 4"
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

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
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
					popTop;
					
					pushTemp: #i;
					pushLiteral: 2;
					send: #+;
					storeTemp: #i;
					popTop;
					
					pushTemp: #i;
					pushTemp: #firstVector;
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
					popTop;
					
					pushTemp: #i;
					pushLiteral: 2;
					send: #+;
					storeTemp: #i;
					popTop;
					
					pushTemp: #i;
					pushTemp: #firstVector;
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
					popTop;
					
					pushTemp: #i;
					pushLiteral: 2;
					send: #+;
					storeTemp: #i;
					popTop;
					
					pushTemp: #i;
					pushTemp: #firstVector;
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
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
OCBytecodeGeneratorTest >> addVectorPrimitive: term1 with: term2 intoVector: result [

	<primitive: 574>
	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) + (term2 at: i) ]
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> addVectorScalar: term1 with: term2 intoVector: result [

	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) + (term2 at: i) ]
]

{ #category : #helper }
OCBytecodeGeneratorTest >> bytecodeGenerator [
	^ IRBytecodeGenerator newWithEncoderClass: EncoderForSistaV1
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> gaddFloat32Vector: v1 with: v2 intoVector: v3 [

	| i end register1 register2 |
	i := 0.
	end := v1 size.
	[ i = end ] whileFalse: [
		register1 := v1 vector128At: i.
		register2 := v2 vector128At: i.
		v3 vector128At: i put: (register1 addFloat32with: register2).
		i := i + 4 ].
	^ v3
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> subFloat64Vector: arg1 with: arg2 intoVector: arg3 [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :builder |"TODO handle arrays with a number of elements that is not a multiple of 2"
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

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
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
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
]

{ #category : #'as yet unclassified' }
OCBytecodeGeneratorTest >> subVectorScalar: term1 with: term2 intoVector: result [

	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) - (term2 at: i) ]
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

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testFloat32ArraySumUsingVectorBytecode [
	| x y result z |

	x := FloatArray withAll: #(1.0 2.0 3.0 4.0).
	y := FloatArray withAll: #(10.0 20.0 30.0 40.0).
	z := FloatArray new: 4.

	result := self addFloat32Vector: x with: y intoVector: z.

	self assertCollection: result equals: (FloatArray withAll: #(11.0 22.0 33.0 44.0)).
]

{ #category : #'tests - execution' }
OCBytecodeGeneratorTest >> testFloat64ArraySumUsingVectorBytecode [
	| cm x y result z |

	x := Float64Array withAll: (1.0 to: 6.0).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.

	result := self addFloat64Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float64Array withAll: #(11.0 22.0 33.0 44.0 55.0 66.0)).
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
				addFloat64Vector;
				returnTop
		 ].
	
	self class addSelector: #addVector:with: withMethod: cm.
	
	result := self addVector: x with: y.

	self assert: (result at: 1) equals: 4.0.
	self assert: (result at: 2) equals: 6.0.
]
