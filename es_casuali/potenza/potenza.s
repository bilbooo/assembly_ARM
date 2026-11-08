@ funzione che calcola la potenza dati base ed esponente
@
@ r0 = base in ingresso, r1 = esponente, r2 = base non modificata

    .text
    .global potenza
    .type potenza, %function

potenza:
    mov r2, r0                  @ salvo la base originale
    mov r0, #1                  @ inizializzo il risultato = 1

loop:
    cmp r1, #0                  @ esponente > 0 ?
    beq fine                    @ se si finisco
    mul r0, r0, r2              @ calcolo della potenza 
    sub r1, r1, #1              @ decremento l'esponente che funge da contatore
    b loop

fine:
    mov pc, lr                  @ return