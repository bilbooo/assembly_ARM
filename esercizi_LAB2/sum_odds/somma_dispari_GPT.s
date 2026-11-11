@ ---- REGISTRI ----
@ r0  = addr di V (incrementato durante il ciclo)
@ r1  = numero di elementi rimanenti
@ r2  = numero corrente del vettore
@ r3  = risultato AND
@ r12 = somma dispari


    .text
    .global sumodds
    .type sumodds, %function

sumodds:
    push {lr}                                       @ salvo l'indirizzo di ritorno
    mov r12, #0                                     @ somma dispari = 0

loop:
    cmp r1, #0                                      @ elementi rimanenti == 0?
    beq fine                                        @ se sì, termino
    ldr r2, [r0]                                    @ leggo il numero corrente
    and r3, r2, #1                                  @ controllo parità
    cmp r3, #1                                      @ il risultato dell'AND è 1?
    beq somma                                       @ se sì, numero dispari e sommo

incrementa:
    add r0, r0, #4                                  @ passo all'elemento successivo (incremento l'indirizzo)
    sub r1, r1, #1                                  @ elementi rimanenti--
    b loop                                          @ prossima iterazione

somma:
    add r12, r12, r2                                @ somma += V[i]
    b incrementa                                    @ incremento e torno al ciclo

fine:
    mov r0, r12                                     @ restituisco la somma
    pop {pc}                                        @ ripristino l'indirizzo di ritorno
