/* Scrivi un programma in C che prende 2 numeri da riga di comando (base ed esponente) e li passa ad
 * una funzione in Assembly ARMv7. L'Assembly calcola l'elevamento a potenza e restituisce il risultato al C per stamparlo. */

#include <stdio.h>
#include <stdlib.h>

extern int potenza(int, int);

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Errore: hai inserito troppi argomenti.\n");
        return 1;
    }

    int risultato;
    int base = atoi(argv[1]);
    int esponente = atoi(argv[2]);
    if (esponente == 0) {
        printf("%d^0 = 1\n", base);
        return 0;
    }
    if (esponente < 0) {
        printf("Inserisci un esponente positivo.\n");
        return 1;
    }

    risultato = potenza(base, esponente);
    printf("%d^%d = %d\n", base, esponente, risultato);

    return 0;
}