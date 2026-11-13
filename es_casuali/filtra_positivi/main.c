/* Crea nel C un array di interi contenente numeri sia positivi che negativi, e alloca in memoria un secondo array vuoto.
 * Passali all'Assembly: la funzione deve copiare nel secondo array esclusivamente i numeri > 0,
 * restituendo al C la quantità esatta di numeri copiati per permettergli di stampare il nuovo array. */


#include <stdio.h>
#include <stdlib.h>

extern int filtra_positivi(const int *, int *, int);

int main(void) {
    int v1[8] = {-3, 5, 8, -2, 0, 6, -7, 2};
    int *v2 = malloc(8 * sizeof(int));
    if (v2 == NULL) {
        printf("Errore: allocazione memoria fallita\n");
        return 1;
    }
    int quanti_positivi = filtra_positivi(v1, v2, 8);
    if (quanti_positivi == 0) {
        printf("Non ci sono elementi positivi nell'array, l'esecuzione termina qua.\n");
        free(v2);
        return 0;
    }

    int *tmp = v2;
    v2 = realloc(v2, quanti_positivi * sizeof(int));
    if (v2 == NULL) {
        v2 = tmp;
        printf("Errore: reallocazione memoria fallita. v2 è ancora salvo\n");
    }

    printf("---- Array di soli positivi ----\n");
    for (int i = 0; i < quanti_positivi; i++) {
        printf("%d ", v2[i]);
    }
    printf("\n");

    free(v2);

    return 0;
}