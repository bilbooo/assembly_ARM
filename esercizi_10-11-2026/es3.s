@ Scrivere il codice assembler per un main che stampa "ciao" utilizzando una printf.

    .text
    .global main
    .type main, %function

main:
    push {lr}
    ldr r0, =s
    bl printf
    mov r0, #0
    pop {pc}


    .data
s:  .string "ciao\n"