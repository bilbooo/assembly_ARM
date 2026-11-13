@ Dichiara 2 array di interi della stessa dimensione nel codice C. Passali alla funzione Assembly insieme alla loro grandezza.
@ L'Assembly deve calcolare il prodotto scalare (moltiplicando gli elementi a 2 a 2 e sommandoli tutti) e restituire
@ il risultato finale al C per la stampa.
@
@ ---- REGISTRI ----
@ r0 = addr v1, r1 = addr v2, r2 = dim v1, r3 = indice
@ r4 = moltiplicazione tra elementi, r5 = somma totale, r6 = v1[i], r7 = v2[i]


    .text
    .global prodotto_scalare
    .type prodotto_scalare, %function

prodotto_scalare:
    push {r4-r7}
    mov r3, #0
    mov r5, #0


loop:
    mov r4, #1
    cmp r3, r2
    beq fine
    ldr r6, [r0, r3, lsl #2]
    ldr r7, [r1, r3, lsl #2]
    mul r4, r6, r7
    add r5, r5, r4
    add r3, r3, #1
    b loop


fine:
    mov r0, r5
    pop {r4-r7}
    bx lr
