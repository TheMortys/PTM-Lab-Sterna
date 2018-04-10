ORG 0

	MOV R0, #30h ;mlodsze bity
	MOV R1, #40h ;starsze bity
	MOV DPTR, #50h ;adres docelowy
	MOV R2, #8 ;ilosc bitów do skopiowania (wyznacza ilosc obiegów petli)
	LCALL COPY
	SJMP $
		
		COPY:
		MOV A, DPL ;skopiowanie mlodszych bitow do akumulatora
		MOV DPL, R1 ;skopiowanie R1 do DPL
		MOV R1, A
		MOV A, DPH ;skopiowanie starszych bitow do akumulatora
		MOV DPH, R0 ;skopiowanie R0 do DPL
		MOV R0, A
		;po pierwszym obiegu DPTR = 0x3040
		MOVX A, @DPTR ;przeniesienie wartosci z zew do akumulatora
		INC DPTR ;inkrementacja wskaznika
		;teraz DPTR = 0x3041
		MOV A, DPL
		MOV DPL, R1
		MOV R1, A
		MOV A, DPH
		MOV DPH, R0
		MOV R0, A
		;po pierwszym obiegu DPTR = 0x0050
		MOVX @DPTR, A ;przeniesienie wartosci z akumulatora do zew
		INC DPTR ;inkrementacja wskaznika
		;teraz DPTR = 0x0051
		DEC R2 ;dekrementacja R2
		MOV A, R2
		JNZ COPY ;wykonywanie dopóki wartosc A > 0
		
		RET
		
END