@ Il programma C legge una parola (ad esempio da riga di comando) e la passa all'Assembly insieme alla sua lunghezza.
@ L'Assembly deve scorrere la parola e verificare se è palindroma, restituendo al C 1 (true) o 0 (false).
@
@ ---- REGISTRI ----
@ r0 = addr base parole, r1 = dim, r2 = word[start], r3 = word[end]
@ r4 = start, r5 = end, r6 = risultato

    .text
    .global palindrome
    .type palindrome, %function

palindrome:
    push {r4, r5, r6}
    mov r4, #0
    sub r5, r1, #1
    mov r6, #1


loop:
    cmp r4, r5
    bge fine
    ldrb r2, [r0, r4]
    ldrb r3, [r0, r5]
    cmp r2, r3
    beq match
    mov r6, #0
    b fine


match:
    mov r6, #1
    add r4, r4, #1
    sub r5, r5, #1
    b loop


fine:
    mov r0, r6
    pop {r4, r5, r6}
    bx lr
