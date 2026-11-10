@ Scrivere il codice della funzione int strlen(char *s) che calcola la
@ lunghezza di una stringa (null terminated) di indirizzo dato.

    .text
    .global main
    .type main, %function

main:
    push {lr}                       @ salvo come sempre L'indirizzo di ritorno
    ldr r1, =s                      @ &s[0], r1 = puntatore alla stringa
    mov r3, #0                      @ registro contatore inizializzato a 0

loop:
    ldrb r2, [r1, r3]               @ r2 = s[i]
    cmp r2, #0                      @ è il null terminator '\0' ?
    beq fine                        @ se si, termino e ritorno il conteggio
    add r3, r3, #1                  @ altrimenti vado avanti incrementando di 1 il contatore
    b loop                          @ ripeto l'iterazione

fine:
    mov r0, r3                      @ metto il valore del contatore in r0 cosi posso ritornarlo
    pop {pc}                        @ ripristino lr direttamente in pc: torno al chiamante


    .data
s:  .string "Mi chiamo Leonardo e sto programmando in Assembly ARMv7 per il corso di AESO\n"