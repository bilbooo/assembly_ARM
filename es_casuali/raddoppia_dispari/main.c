/* Passa un array di interi dal C all'Assembly. L'Assembly deve scorrere l'array direttamente in memoria e
 * raddoppiare il valore esclusivamente ai numeri dispari, sovrascrivendoli.
 * Il C stamperà l'array prima e dopo per confermare la modifica. */


#include <stdio.h>

/* serve per forza la dimensione */
extern void *double_odds(int *, int);

void stampa_array(int *array, int dim) {
    for (int i = 0; i < dim; i++) {
        printf("%d ", array[i]);
    }
}

int main(void) {
    int v[7] = {1, 2, 3, 4, 5, 6, 7};
    printf("**** PRIMA ****\n");
    stampa_array(v, 7);
    double_odds(v, 7);
    printf("\n\n**** DOPO ****\n");
    stampa_array(v, 7);
    printf("\n");

    return 0;
}
