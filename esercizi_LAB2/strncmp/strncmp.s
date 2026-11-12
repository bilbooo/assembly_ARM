@ Scrivere una propria funzione equivalente a strncmp, che confronti al più i primi n
@ caratteri delle due stringhe passate come argomento.
@ int strncmp (char* s1 , char* s2 , int n);
@ 
@ Risultato
@ Restituisce 0 se le due stringhe coincidono nei caratteri confrontati, un valore diverso
@ da 0 altrimenti.
@
@ ---- REGISTRI ----
@ r0 = s1, r1 = s2, r2 = n, r3 = indice, r5 = byte letto di s1, r6 = byte letto s2, r12 = risultato


    .text
    .global my_strncmp
    .type my_strncmp, %function

my_strncmp:
    push {r5, r6}                                   @ salvo i calle-saved che verranno sporcati
    mov r12, #0                                     @ inizializzo a 0 perche se ho 2 stringhe vuote devo ritornare 0
    mov r3, #0                                      @ indice = 0

loop:
    cmp r3, r2                                      @ indice < n ?
    bge fine                                        @ se indice >= n esco dal loop
    ldrb r5, [r0, r3]                               @ carico in r5 il byte s1[indice]
    ldrb r6, [r1, r3]                               @ carico in r6 il byte s2[indice]
    cmp r5, r6                                      @ s1[indice] == s2[indice] ?
    beq continua                                    @ se si incremento l'indice e richiamo la funzione
    mov r12, #-1                                    @ se r5 != r6 vuol dire che i caratteri sono diversi, allora il risultato è -1
    b fine                                          @ esco dal ciclo

continua:
    cmp r5, #0                                      @ sono a fine stringa?
    beq fine                                        @ se si le stringhe coincidono e esco dal ciclo
    add r3, r3, #1                                  @ indice++
    mov r12, #0                                     @ se sono entrato in questa etichetta significa che i caratteri sono uguali, quindi metto r12 a 0
    b loop                                          @ prossima iterazione

fine:
    pop {r5, r6}                                    @ ripristino i callee-saved
    mov r0, r12                                     @ se non sono uguali, metto in r0 il risultato
    mov pc, lr                                      @ e ritorno
