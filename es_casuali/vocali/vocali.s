@ Il programma C legge una stringa da riga di comando e la passa all'Assembly. La funzione Assembly deve contare
@ quante vocali minuscole ci sono nella stringa e restituire il conteggio finale al chiamante per la stampa
@
@ ---- REGISTRI ----
@ r0 = indirizzo base stringa/valore di ritorno, r1 = n_vocali, r2 = byte corrente della stringa, r3 = indice (scorre la stringa in input)
@ r4 = 'a', r5 = 'e', r6 = 'i', r7 = 'o', r8 = 'u'


    .text
    .global cerca_vocali
    .type cerca_vocali, %function

cerca_vocali:
    push {r4-r8}
    mov r1, #0
    mov r3, #0

    mov r4, #97
    mov r5, #101
    mov r6, #105
    mov r7, #111
    mov r8, #117


loop:
    ldrb r2, [r0, r3]
    cmp r2, #0
    beq fine
    cmp r2, r4
    beq aggiungi
    cmp r2, r5
    beq aggiungi
    cmp r2, r6
    beq aggiungi
    cmp r2, r7
    beq aggiungi
    cmp r2, r8
    beq aggiungi
    add r3, r3, #1
    b loop


aggiungi:
    add r1, r1, #1
    add r3, r3, #1
    b loop


fine:
    mov r0, r1
    pop {r4-r8}
    bx lr
