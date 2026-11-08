@ ==== REGISTRI ====
@ MAIN
@ r4 = num, r5 = risultato
@
@ FIBONACCI
@ r0 = n, r4 = copia di n
@ r5 = ris 1^ call rec
@ r6 = ris 2^ call rec

    .text
    .global main
    .type main, %function

main:
    push {lr}                   @ salvo l'indirizzo di ritorno
    push {r4, r5, r6}           @ salvo sullo stack i callee-saved
    mov r4, #6                  @ num = indice del numero di Fibonacci da calcolare
    mov r0, r4                  @ si usa r0 come registro per passare i parametri e quindi metto li il valore
    bl fibonacci                @ chiamata alla funzione fibonacci
    mov r5, r0                  @ salvo in r5 il risultato della chiamata alla funzione
    mov r0, #0                  @ return 0
    pop {r4, r5, r6}            @ ripristino
    pop {pc}                    @ ripristino in PC l'indirizzo di ritorno salvato all'inizio


    .global fibonacci
    .type fibonacci, %function

fibonacci:
    push {lr}                   @ salvo LR, l'indirizzo di ritorno al chiamante (main o fibonacci)
    push {r4, r5, r6}           @ salvo r4-r6 (callee-saved), perché li uso e il chiamante si aspetta di ritrovarli intatti
    cmp r0, #0                  @ n == 0
    beq caso_base               @ se n == 0 salto al caso base
    cmp r0, #1                  @ n == 1
    beq caso_base               @ se n == 1 salto al caso base
    mov r4, r0                  @ copio in r4 il valore di n (r0)
    sub r0, r4, #1              @ r4 conserva n, perché r0 verrà sovrascritto dal valore di ritorno
    bl fibonacci                @ chiamo fibonacci(n - 1)
    mov r5, r0                  @ salvo il valore ritornato (in r0 appunto), dentro r5
    sub r0, r4, #2              @ calcolo n - 2
    bl fibonacci                @ chiamo fibonacci (n - 2)
    mov r6, r0                  @ salvo il valore ritornato
    add r0, r5, r6              @ calcolo fibonacci(n - 1) + fibonacci(n - 2) e lo metto in r0
    pop {r4, r5, r6}            @ ripristino i registri callee-saved
    pop {pc}


caso_base:
    mov r0, #1                  @ return 1
    pop {r4, r5, r6}            @ ripristino i valori dei callee-saved
    pop {pc}                    @ ritorno al chiamante: carico in PC l'indirizzo salvato
