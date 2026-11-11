@ Scrivere una funzione char *creacopia(char *s) che restituisce una copia di una stringa ricevuta come parametro.
@ La funzione deve allocare lo spazio necessario a creare la copia utilizzando una malloc.
@
@ ---- REGISTRI ----
@
@ MAIN
@ r0 = indirizzo stringa originale (parametro creacopia)
@ r0 = indirizzo della copia (valore restituito da creacopia)
@ r1 = indirizzo della copia (secondo parametro printf)
@ r4 = registro utilizzato per allineamento stack
@
@ CREACOPIA
@ r0 = indirizzo stringa originale (parametro)
@ r4 = indirizzo stringa originale (src)
@ r0 = lunghezza stringa (risultato my_strlen)
@ r0 = indirizzo memoria allocata (risultato malloc)
@ r5 = contatore del ciclo di copia
@ r6 = indirizzo stringa copiata (dst)
@ r3 = carattere temporaneo da copiare
@
@ MY_STRLEN
@ r0 = indirizzo stringa da analizzare (parametro)
@ r1 = contatore / lunghezza stringa
@ r2 = carattere letto dalla stringa
@ r0 = lunghezza stringa (valore restituito)




    .text
    .global main
    .type main, %function

main:
    push {r4, lr}                   @ salvo indirizzo di ritorno (r4 serve per allineamento)
    ldr r0, =s1                     @ carico in r0 l'indirizzo della string da copiare
    bl creacopia                    @ chiamo la funzione di copia
    mov r1, r0                      @ puntatore alla copia
    ldr r0, =s2                     @ formato printf
    bl printf                       @ chiamo printf
    mov r0, #0                      @ return 0
    pop {r4, pc}                    @ ripristino r4 e il vecchio lr diventa pc



    .global creacopia
    .type creacopia, %function

creacopia:
    push {r4, r5, r6, lr}           @ salvo i registri callee-saved
    mov r4, r0                      @ salvo indirizzo src
    bl my_strlen                    @ r0 = lunghezza stringa (necessaria solo alla malloc, infatti r0 viene subito sovrascritto proprio dalla malloc)
    add r0, r0, #1                  @ spazio per '\0'
    bl malloc                       @ r0 = indirizzo memoria allocata
    mov r6, r0                      @ salvo indirizzo destinazione
    mov r5, #0                      @ contatore = 0

loop:
    ldrb r3, [r4, r5]               @ leggo src[i]
    strb r3, [r6, r5]               @ scrivo dst[i]
    cmp r3, #0                      @ terminatore ?
    beq fine                        @ si, allora termino
    add r5, r5, #1                  @ contatore++
    b loop                          @ prossima iterazione

fine:
    mov r0, r6                      @ ritorno il puntatore alla copia
    pop {r4-r6}                     @ solita storia dei callee-saved
    pop {pc}                        @ ripristino l'indirizzo di ritorno in PC


my_strlen:
    mov r1, #0                      @ inizializzo il contatore

strlen_loop:
    ldrb r2, [r0, r1]               @ scrivo in r2 ciò che leggo all'indirizzo [r0 + r1], equivale a r2 = s[i]
    cmp r2, #0                      @ terminatore ?
    beq ret_strlen                  @ se si ritorno
    add r1, r1, #1                  @ contatore++
    b strlen_loop                   @ prox iterazione

ret_strlen:
    mov r0, r1                      @ sposto il risultato (lunghezza, in r1) in r0, registro usato per il valore di ritorno
    mov pc, lr                      @ return


    .data
s1: .string "Questo codice Assembly ARMv7 crea la copia di una stringa qualsiasi\n"
s2: .string "---- STRINGA COPIATA ----\n%s"
