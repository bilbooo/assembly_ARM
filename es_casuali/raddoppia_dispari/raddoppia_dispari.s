@ Passa un array di interi dal C all'Assembly. L'Assembly deve scorrere l'array direttamente in memoria e
@ raddoppiare il valore esclusivamente ai numeri dispari, sovrascrivendoli.
@ Il C stamperà l'array prima e dopo per confermare la modifica.
@
@ ---- REGISTRI ----
@ r0 = addr base vettore, r1 = dim, r2 = v[i], r3 = i
@ r4 = risultato and


    .text
    .global double_odds
    .type double_odds, %function


double_odds:
    push {r4}
    mov r3, #0


loop:
    cmp r3, r1
    beq fine
    ldr r2, [r0, r3, lsl #2]
    and r4, r2, #1
    cmp r4, #1
    beq raddoppia
    add r3, r3, #1
    b loop


raddoppia:
    lsl r2, r2, #1
    str r2, [r0, r3, lsl #2]
    add r3, r3, #1
    b loop


fine:
    pop {r4}
    bx lr
