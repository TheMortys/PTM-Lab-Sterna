ORG 0

	MOV R0, #30h
	MOV DPTR, #40h
	MOV R2, #8
	LCALL COPY
	SJMP $
		
		COPY:
		MOV A, @R0
		MOVX @DPTR, A
		INC R0
		INC DPTR
		DEC R2
		MOV A, R2
		
		JNZ COPY
		
		RET
		
END