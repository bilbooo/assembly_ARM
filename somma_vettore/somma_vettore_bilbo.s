@ dato un vettore e la dimensione, calcolo la somma di tutti gli elementi

@ r0 = v (indirizzo base), r1 = n, r2 = i, r3 = sum, r4 = v[i]

    .text
    .global main
    .type main, %function

main:
    push {lr}
    ldr r0, =v
    ldr r1, =n
    ldr r1, [r1]
    bl somma
    pop {pc}


    .text
    .global conta
    .type conta, %function

somma:
    push {r4}                   @ andrà usato per v[i] e non essendo temporaneo devo salvarne lo stato
    mov r2, #0
    mov r3, #0

loop:
    cmp r2, r1
    beq fine
    ldr r4, [r0, r2, lsl #2]    @ 
    add r3, r3, r4
    add r2, r2, #1
    b loop

fine:
    mov r0, r3
    pop {r4}
    mov pc, lr


    .data
v:  .word 1, 3, 4, 12, 8
n:  .word 5