@ Scrivere due funzioni: int conv(char c) converte un carattere esadecimale {0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f} nel suo
@ valore decimale, e int convstring(char * s) converte una stringa con soli caratteri esadecimali nel valore della stringa.
@ Ad esempio: conv('a') deve restituire 10, conv('8') deve restituire 8, convstring("28") deve restiuire 40, convstring("1000f")
@ deve restituire 65551.
@
@ ---- REGISTRI ----
@ r0 = c / *s / valore di ritorno, r1 = copia di *s, r2 = res, r3 = i
@ r4 = s[i], r5 = cifra


    .text
    .global conv
    .type conv, %function

conv:
    cmp r0, #'0'
    blt termina_conv
    cmp r0, #'9'
    ble tra_09
    cmp r0, #'a'
    blt termina_conv
    cmp r0, #'f'
    ble tra_af

termina_conv:
    mvn r0, #0
    bx lr

tra_09:
    sub r0, r0, #'0'
    bx lr

tra_af:
    sub r0, r0, #'a'
    add r0, r0, #10
    bx lr


    .text
    .global convstring
    .type convstring, %function

convstring:
    push {r4-r6, lr}                        @ r6 per allineamento
    mov r1, r0
    mov r2, #0
    mov r3, #0

loop:
    ldrb r4, [r1, r3]
    cmp r4, #0
    beq fine
    mov r0, r4
    bl conv
    mov r5, r0
    cmn r5, #1
    beq termina_convs
    lsl r2, r2, #4
    add r2, r2, r5
    add r3, r3, #1
    b loop

termina_convs:
    mvn r0, #0
    pop {r4-r6, pc}

fine:
    mov r0, r2
    pop {r4-r6, pc}
