ORG 0

	MOV R0, #30h ;mlodsze bity
	MOV R1, #40h ;starsze bity
	MOV DPTR, #50h
	MOV R2, #8
	LCALL COPY
	SJMP $
		
		COPY:
		MOV A, DPL
		MOV DPL, R1
		MOV R1, A
		MOV A, DPH
		MOV DPH, R0
		MOV R0, A
		MOVX A, @DPTR
		INC DPTR
		MOV A, DPL
		MOV DPL, R1
		MOV R1, A
		MOV A, DPH
		MOV DPH, R0
		MOV R0, A
		MOVX @DPTR, A
		INC DPTR
		
		DEC R2
		MOV A, R2
		JNZ COPY
		
		RET
		
END