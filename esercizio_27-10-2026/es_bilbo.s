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
@ stringa dalla STRB, saltare la STRB se non serve e proseguire aggiornando il puntatore)


    .text
_main:
    ldr r0, =s          @ recupero add stringa 's'

_loop:
    ldrb r1, [r0]       @ carico il char corrent
    cmp r1, #0          @ controllo per il NULL terminator (sono arrivato a fine stringa)
    beq _end            @ se si, ho finito
    cmp r1, #97         @ controllo se la lettere è >= ad 'a' (97 in ASCII)
    blt _continue       @ se è <= non sono nel range che mi interessa e vado avanti con l'iterazione (salto la conversione)
    cmp r1, #122      @ controllo se la lettera è <= a 'z' (122 in ASCII)
    ble _toupper        @ se è <= 122 vuol dire che è una lettera minuscola e allora devo convertire
    b _continue         @ se è > 122 significa che non è una lettera e skippo

_continue:
    add r0, r0, #1      @ vado al char successivo
    b _loop

_toupper:
    sub r1, r1, #32     @ sottraggo 32 cosi passo dalla lettera minusc a MAIUSC
    strb r1, [r0]
	b _continue

_end:


    .data
s:  .string "ciao vediamo  {se Marco} mi | dice qualcosa di Gianna"
