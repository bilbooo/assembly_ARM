@ Scrivere una funzione con il seguente prototipo: int cerca (int *V, int x);
@ La funzione deve effettuare una ricerca binaria, in maniera ricorsiva, del valore x
@ nell’array V, supponendo che V sia ordinato in senso crescente.
@ 
@ Risultato
@ Restituisce −1 se x non è stato trovato; altrimenti restituisce l’indice del vettore che contiene x.
@
@ ---- REGISTRI ----
@ r0 = addr *v/risultato da ritornare al C, r1 = x, r2 = sx, r3 = dx
@ r4 = v[mid], r5 = mid, r6 = dimensione


.extern dimensione


    .text
    .global cerca
    .type cerca, %function

cerca:
    push {lr}
    push {r4-r6}
    mov r2, #0
    ldr r6, =dimensione
    ldr r6, [r6]
    sub r3, r6, #1
    bl rec_cerca
    pop {r4-r6}
    pop {pc}


rec_cerca:
    push {lr}
    push {r4-r6}
    
    cmp r2, r3
    bgt not_found
    
    sub r5, r3, r2
    lsr r5, r5, #1
    add r5, r5, r2
    ldr r4, [r0, r5, lsl #2]

    cmp r4, r1
    beq found
    blt move_sx
    bge move_dx


move_sx:
    add r2, r5, #1
    bl rec_cerca
    b end_rec


move_dx:
    sub r3, r5, #1
    bl rec_cerca
    b end_rec


found:
    mov r0, r5
    b end_rec


not_found:
    mov r0, #-1
    b end_rec


end_rec:
    pop {r4-r6}
    pop {pc}
