@ dato un vettore e la dimensione, calcolo la somma di tutti gli elementi

@ r0 = v (indirizzo base), r1 = n, r2 = i, r3 = sum, r4 = v[i]

    .text
    .global main
    .type main, %function

main:
    push {lr}                   @ salvo indirizzo di ritorno come al solito
    ldr r0, =v                  @ carico in r0 l'indirizzo di memoria di partenza (o del primo elemento del vettore)
    ldr r1, =n                  @ carico in r1 l'indirizzo di memoria di 'n'        r1 = &n in C
    ldr r1, [r1]                @ metti in r1 ciò che è contenuto all'indirizzo di memoria di n (ovvero 5)      r1 = *r1 in C
    bl somma                    @ salto alla funzione somma
    pop {pc}                    @ return


    .text
    .global conta
    .type conta, %function

somma:
    push {r4}                   @ andrà usato per v[i] e non essendo temporaneo devo salvarne lo stato
    mov r2, #0                  @ inizializzo i = 0
    mov r3, #0                  @ inizializzo sum = 0

loop:
    cmp r2, r1                  @ i < n? equivale alla seconda istruzione del for dopo i = 0
    beq fine                    @ se si, ho scorso tutto l'array e ho finito, salto a fine
    ldr r4, [r0, r2, lsl #2]    @ sarebbe come scrivere r4 = MEM[r0 + (r2 * 4)]         r4 = v[i] in C
    add r3, r3, r4              @ sum = sum + v[i]
    add r2, r2, #1              @ i++
    b loop                      @ qua ci arrivo se ovviamente non sono entrato in 'beq fine'

fine:
    mov r0, r3                  @ voglio restituire il risultato in r0
    pop {r4}                    @ riporto r4 (reg non temporaneo) al suo valore iniziale
    mov pc, lr                  @ return


    .data
v:  .word 1, 3, 4, 12, 8        @ vettore v[n] = {1,3,4,12,8}
n:  .word 5                     @ n = 5