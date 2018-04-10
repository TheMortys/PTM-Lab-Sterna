ORG 0

	MOV R0, #30h ;adres zrodlowy
	MOV R1, #40h ;adres docelowy
	MOV R2, #8 ;ilosc bitow do skopiowania (ilosc obiegów petli)
	LCALL COPY
	SJMP $
		
		COPY:
		MOV A, @R0 ;przeniesienie wartosci z R0 do akumulatora
		MOV @R1, A ;przeniesienie wartosci z akumulatora do R1
		INC R0 ;inkrementacja wskaznika zródlowego
		INC R1 ;inkrementacja wskaznika docelowego
		DEC R2 ;dekrementacja R2
		MOV A, R2 ;wpisanie R2 do akumulatora
		
		JNZ COPY ;wykonywanie kopiowania dopóki A>0
		
		RET
		
END