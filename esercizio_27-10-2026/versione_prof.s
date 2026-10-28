	.text				    @ questo è il segmento che contiene le istruzioni
	
main:					    @ definiamo un main ... 
	ldr r0,=s 			    @ recupero dell'indirizzo della stringa in memoria
loop:					    @ per ogni carattere della stringa eseguiamo una iterazione
	ldrb r1,[r0]		    @ carichiamo il byte puntato dalla stringa nel registro r1
	cmp r1,#0			    @ controlliamo se sia arrivato in fondo (NULL terminated string)
	beq	fine			    @ se siamo arrivati, abbiamo finito 
	cmp r1,#97			    @ confrontiamo il carattere letto con 'a'
	blt cont			    @ se non è una lettera minuscola, allora saltiamo il passaggio della trasformazione
	sub r1,r1,#32		    @ togliamo dalla lettera la diff fra il codice di 'a' (97) e quello di 'A' (65) 
cont:	strb r1, [r0],#1	@ rimettiamo a posto il codice del nuovo carattere nella stringa 
						    @ e predisponiamo r0 a puntare al prossimo carattere
	b loop				    @ eseguiamo un'altra iterazione
	
fine:
						    @ scandita tutta la stringa, fine lavori
 
	
	.data
s:	.string "ciao vediamo se Marco mi dice qualcosa di Gianna"