@ Scrivere una funzione con il prototipo: int somma (int a, int b);
@ La funzione prende in ingresso due numeri interi a e b, con b ≥ 0, ed è definita come:
@               somma(a, 0) = a,
@               somma(a, b) = somma(a + 1, b − 1).
@  
@ Nota: a e b sono numeri piccoli.
@
@
@ ---- REGISTRI ----
@ r0 = a, r1 = b, r2 = somma_tot


    .text
    .global somma
    .type somma, %function

somma:
    push {lr}
    cmp r1, #0
    beq fine
    sub r1, r1, #1
    add r0, r0, #1
    bl somma


fine:
    pop {pc}
