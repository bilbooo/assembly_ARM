@ Scrivere una funzione con il seguente prototipo: int cerca (int *V, int x);
@ La funzione deve effettuare una ricerca binaria, in maniera ricorsiva, del valore x
@ nell’array V, supponendo che V sia ordinato in senso crescente.
@ 
@ Risultato
@ Restituisce −1 se x non è stato trovato; altrimenti restituisce l’indice del vettore che contiene x.
@
@ ---- REGISTRI ----
@ r0 = indirizzo base di V (ingresso) / valore di ritorno (uscita), r1 = x, r2 = sx, r3 = dx
@ r4 = v[mid], r5 = mid, r6 = dimensione


.extern dimensione                                  @ dimensione presa dal main in C


    .text
    .global cerca
    .type cerca, %function

cerca:
    push {lr}                                       @ salvo indirizzo di ritorno
    push {r4-r6}                                    @ salvo i callee-saved
    mov r2, #0                                      @ sx = 0
    ldr r6, =dimensione                             @ metto in r6 l'indirizzo di memoria dove è contenuta la dimensione
    ldr r6, [r6]                                    @ metti in r6 ciò che è contenuto all'indirizzo di memoria di r6
    sub r3, r6, #1                                  @ dx = dimensione - 1
    bl rec_cerca                                    @ ricorsione
    pop {r4-r6}                                     @ ripristino i callee-saved
    pop {pc}                                        @ ripristino l'indirizzo di ritorno originale e termino cerca


rec_cerca:
    push {lr}
    push {r4-r6}
    
    cmp r2, r3                                      @ sx > dx ?
    bgt not_found                                   @ se sx > dx, l'intervallo di ricerca è vuoto: x non è presente
    
    sub r5, r3, r2                                  @ \
    lsr r5, r5, #1                                  @   --> mid = sx + (dx - sx) / 2
    add r5, r5, r2                                  @ /
    
    ldr r4, [r0, r5, lsl #2]                        @ r4 = V[mid], accedo all'indirizzo r0 + mid*4
    cmp r4, r1                                      @ v[mid] == x ?
    beq found                                       @ se si ho trovato
    blt move_sx                                     @ se v[mid] < x mi muovo a sx nell'array
    bgt move_dx                                     @ se v[mid] > x mi muovo a dx nell'array


move_sx:
    add r2, r5, #1                                  @ sx = m + 1 (nella chiamata ricorsiva)
    bl rec_cerca                                    @ ricorsione
    b end_rec                                       @ salto all'epilogo comune dopo il ritorno dalla chiamata ricorsiva


move_dx:
    sub r3, r5, #1                                  @ dx = m - 1 (nella chiamata ricorsiva)
    bl rec_cerca                                    @ ricorsione
    b end_rec                                       @ salto all'epilogo comune dopo il ritorno dalla chiamata ricorsiva


found:
    mov r0, r5                                      @ metto in r0 il risultato perche uso quello per ritornare i valori
    b end_rec                                       @ salto all'epilogo comune per ripristinare i registri e ritornare


not_found:
    mov r0, #-1                                     @ metto in r0 il valore -1 perche non ho trovato x
    b end_rec                                       @ salto all'epilogo comune per ripristinare i registri e ritornare


end_rec:
    pop {r4-r6}                                     @ ripristino callee-saved
    pop {pc}                                        @ return
