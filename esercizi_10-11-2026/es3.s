@ Scrivere il codice assembler per un main che stampa "ciao" utilizzando una printf.

    .text
    .global main
    .type main, %function

main:
    push {r3, lr}       @ salvo lr: bl lo sovrascrive e mi serve per tornare al chiamante (r3 solo per allineare lo stack a 8 byte)
    ldr r0, =s          @ r0 = indirizzo della stringa (1° argomento di printf)
    bl printf           @ stampa la stringa (e sovrascrive lr)
    mov r0, #0          @ valore di ritorno di main = 0
    pop {r3, pc}        @ ripristino lr direttamente in pc: torno al chiamante


    .data
s:  .string "ciao\n"