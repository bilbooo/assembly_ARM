    .text
	.global cerca
	.type cerca, %function
 
cerca:	                @ r0 puntatore, r1 valore da cercare
 
while:
    cmp r0,#0	        @ se null
	moveq pc,lr	        @ return (r0 è già 0)
	ldr r2,[r0]	        @ valore primo elemento lista
	cmp r2, r1	        @ controlla se == valore da cercare
	beq finet	        @ se si' termina con trovato
	ldr r0,[r0,#4]	    @ p = p.next
	b while		        @ e fai un altro giro
 
finet:
    mov r0, #1	        @ restituisci 1 (true)
	mov pc,lr 	        @ e ritorna