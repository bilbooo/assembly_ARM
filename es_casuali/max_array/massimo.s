@ Dichiara un array di 10 interi nel codice C e passalo a una funzione Assembly insieme alla dimensione.
@ L'Assembly deve scorrere l'array, trovare il valore massimo e restituirlo al C.
@
@ ---- REGISTRI ----
@ r0 = addr base vettore, r1 = dim, r2 = max, r3 = arr[i]
@ r4 = i


    .text
    .global cerca_max
    .type cerca_max, %function

cerca_max:
    push {r4}
    mov r4, #0
    ldr r2, [r0, r4, lsl #2]                    @ il primo elemento è il massimo

loop:
    cmp r4, r1
    beq fine 
    ldr r3, [r0, r4, lsl #2]
    cmp r3, r2
    bgt aggiorna_max
    add r4, r4, #1
    b loop

aggiorna_max:
    mov r2, r3
    add r4, r4, #1
    b loop

fine:
    mov r0, r2
    pop {r4}
    bx lr
