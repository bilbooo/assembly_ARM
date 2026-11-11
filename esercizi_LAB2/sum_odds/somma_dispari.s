@ Scrivere una funzione che, dato in ingresso il puntatore a un vettore di interi,
@ restituisca la somma dei valori dispari, con il seguente prototipo:
@ int sumodds (int *V, int n);
@
@ ---- REGISTRI ----
@ r0 = addr di V, r1 = n, r2 = numero in posizione 'contatore' del vettore, r3 = risultato and
@ r4 = somma dispari, r5 = contatore, r6 = copia di n, r7 = copia dell'addr di V
@ molto registri non sono usati, la versione _GPT è ottimizzata

    .text
    .global sumodds
    .type sumodds, %function

sumodds:
    push {lr}                                       @ addr di ret
    push {r4-r7}                                    @ uso dei callee-saved e allora li salvo prima di tutto sullo stack
    mov r7, r0                                      @ copio addr di V in r7
    mov r6, r1                                      @ copio dimensione n in r6
    mov r4, #0                                      @ somma dispari = 0
    mov r5, #0                                      @ contatore = 0

loop:
    cmp r5, r1                                      @ contatore < n ?
    bge fine                                        @ se >= termino
    ldr r2, [r0, r5, lsl #2]                        @ leggo da r0[r5] il valore e lo scrivo in r2 (shift logico a sx perche una word sono 4 byte)
    and r3, r2, #1                                  @ metto in r2 il risultato dall'and tra il numero in v[i] e 1 (controllo parità)
    cmp r3, #1                                      @ il risultato dall'and è 1 ?
    beq somma                                       @ se si, numero dispari e sommo
    add r5, r5, #1                                  @ contatore++
    b loop                                          @ prossima iterazione

somma:
    add r4, r4, r2                                  @ somma += v[i] (sommo se dispari)
    add r5, r5, #1                                  @ tornando all'inizio del ciclo devo incrementare anche qua
    b loop                                          @ torno al ciclo


fine:
    mov r0, r4                                      @ devo ritornare la somma tramite r0 non r4
    pop {r4-r7}                                     @ ripristino i callee-saved
    pop {pc}                                        @ metto in pc l'addr della prox istr da eseguire
