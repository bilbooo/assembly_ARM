@ Crea nel C un array di interi contenente numeri sia positivi che negativi, e alloca in memoria un secondo array vuoto.
@ Passali all'Assembly: la funzione deve copiare nel secondo array esclusivamente i numeri > 0,
@ restituendo al C la quantità esatta di numeri copiati per permettergli di stampare il nuovo array.
@
@ ---- REGISTRI ----
@ r0 = addr base v1/ret value, r1 = addr base v2, r2 = dim
@ r4 = indice v1, r5 = indice v2, r6 = v1[i]



    .text
    .global filtra_positivi
    .type filtra_positivi, %function

filtra_positivi:
    push {r4-r7}                            @ r7 per allineamento
    mov r4, #0
    mov r5, #0


loop:
    cmp r4, r2
    beq fine
    ldr r6, [r0, r4, lsl #2]
    cmp r6, #0
    bgt aggiungi_pos
    add r4, r4, #1
    b loop


aggiungi_pos:
    str r6, [r1, r5, lsl #2]
    add r4, r4, #1
    add r5, r5, #1
    b loop


fine:
    mov r0, r5
    pop {r4-r7}
    bx lr
