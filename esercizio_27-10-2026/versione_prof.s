@ Questo è un codice che scandisce una stringa in memoria e ne trasforma le lettere minuscule in maiuscole.
@ La minuscule partono da 'a' con codice 97, le maiuscole dalla 'A' con codice 65. Dunque per trasformare una
@ minuscolo in maiuscola basta sottrarre 32 al suo codice ascii. 
@ Provate ad eseguire il programma utilizzando CPUVERILATOR.
@ Modificate il codice per evitare che anche i caratteri di punteggiatura che hanno codice successive alle
@ minuscule (per esempio i caratteri '{' '}' e '|' vengano "trasformati" (suggerimento: occorre controllare sia che
@ il codice sia >= del codice della 'a' che minore o uguale del codice della 'z', prima di fare la trasformazione.
@ Il nome della condizione minore o uguale è "LE" in armv7).
@ Modificate il codice in modo che, se non occorra effettuare alcuna modifica, non venga eseguita la STRB del valore
@ precedentemente letto (suggerimento: rimuovere l'auto incremento del valore utilizzato per accedere al carattere nella
@ stringa dalla STRB, saltare la STRB se non serve e proseguire aggiornando il puntatore) */

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
cont:
	strb r1, [r0],#1		@ rimettiamo a posto il codice del nuovo carattere nella stringa 
						    @ e predisponiamo r0 a puntare al prossimo carattere
	b loop				    @ eseguiamo un'altra iterazione
	
fine:
						    @ scandita tutta la stringa, fine lavori
 
	
	.data
s:	.string "ciao vediamo se Marco mi dice qualcosa di Gianna"
