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
    push {lr}                       @ salvo indirizzo di ritorno
    cmp r1, #0                      @ caso base: b == 0 ?
    beq fine                        @ se si termino
    sub r1, r1, #1                  @ b - 1 (dentro la chiamta ricorsiva)
    add r0, r0, #1                  @ a + 1 (dentro la chiamata ricorsiva)
    bl somma                        @ ricorsione


fine:
    pop {pc}                        @ return
