@ codice che calcola il fattoriale di un numero

    .text
    .global main
    .type main, %function

main:
    @ prima di chiamare altre funzioni, salvo il mio indirizzo di ritorno sullo stack, perche potrei perdere il contenuto di lr
    push {lr}
    mov r0, #4          @ metto in r0 il valore di cui calcolare il fattoriale
    bl fact             @ chiamo la funzione fact
    mov r0, #6
    bl fact
    pop {pc}            @ ripristino l'indirizzo di ritorno e termino la funzione


    .text
    .global fact
    .type fact, %function

fact:
    cmp r0, #1
    moveq pc, lr        @ caso base
    @ ogni volta che una funzione chiama un'altra funzione tramite 'bl', deve preoccuparsi di non perdere il proprio indirizzo di ritorno
    push {lr}
    push {r0}           @ metto n sullo stack
    sub r0, r0, #1      @ calcolo n - 1
    bl fact
    pop {r1}            @ riprendo l'n - 1 che avevo messo sullo stack con la push {r0}
    mul r0, r0, r1      @ e moltiplico i 2 numeri
    pop {pc}            @ come la pop {pc} del main