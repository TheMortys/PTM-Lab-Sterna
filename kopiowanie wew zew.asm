ORG 0

	MOV R0, #30h ;adres zródlowy
	MOV DPTR, #40h ;adres docelowy
	MOV R2, #8 ;ilosc bitów do skopiowania
	LCALL COPY
	SJMP $
		
		COPY:
		MOV A, @R0 ;przeniesienie wartosci z R0 do akumulatora
		MOVX @DPTR, A ;przeniesienie wartosci z akumulatora do pam zew.
		INC R0 ;inkrementacja wskaznika zródlowego
		INC DPTR ;inkrementacja wskaznika docelowego
		DEC R2 ;dekrementacja R2
		MOV A, R2 ;wpisanie R2 do akumulatora
		
		JNZ COPY ;wykonywanie kopiowania dopóki A>0
		
		RET
		
END