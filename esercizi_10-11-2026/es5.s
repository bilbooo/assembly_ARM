@ Scrivere il codice di una funziona che esegue una ricerca binaria su un vettore ordinato:
@ int cercabin(int *vec, int n, int x) cerca x nel vettore vec, di lunghezza n.
@
@ PER CODICE C GUARDARE FILE ES5.C
@ L'algoritmo restituisce la posizione dell'elemento se trovato oppure -1 se non trovato
@ r0 = v, r1 = n, r2 = x, r4 = sx, r5 = dx, r6 = mid, r7 = trovato (indice dell'elemento se trovato oppure -1)


    .text
    .global main
    .type main, %function

main:
    push {r4, lr}           @ salvo lr altrimenti si sporca (r4 utile all'allineamento)

    @ --- prima ricerca: cerca 5 ---
    ldr r0, =v              @ carico addr mem del vettore in r0
    mov r1, #10             @ dimensione del vettore = 10   
    mov r2, #5              @ cerco 5
    bl binary_search        @ chiamata alla funzione
    mov r1, r0              @ risultato → r1 (la funzione ritorna il risultato in r0 e io lo metto in r1)
    ldr r0, =s              @ formato della stringa → r0
    bl printf               @ stampa 4

    @ --- seconda ricerca: cerca 23 ---
    ldr r0, =v              @ ricarico perché printf li ha clobberati
    mov r1, #10
    mov r2, #23
    bl binary_search
    mov r1, r0
    ldr r0, =s
    bl printf               @ stampa -1

    mov r0, #0              @ buona norma: main ritorna 0
    pop {r4, pc}            @ return e allineamento ad 8 byte



    .text
    .global binary_search
    .type binary_search, %function

binary_search:
    push {r4-r7}
    mov r4, #0
    sub r5, r1, #1
    mov r7, #-1

loop:
    cmp r4, r5
    bgt fine
    add r6, r4, r5
    lsr r6, r6, #1
    @ qua iniziano gli if, else if e else
    ldr r3, [r0, r6, lsl #2]            @ r3 = v[r6] --> indirizzo = r0 + (r6 * 4 perché word = 4 byte)
    cmp r3, r2
    beq trovato
    blt go_right
    sub r5, r6, #1
    b loop

go_right:
    add r4, r6, #1
    b loop

trovato:
    mov r7, r6
    b fine

fine:
    mov r0, r7
    pop {r4-r7}
    pop {pc}



    .data
v:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
s:  .string "%d\n"