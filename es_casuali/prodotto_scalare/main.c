/* Dichiara 2 array di interi della stessa dimensione nel codice C. Passali alla funzione Assembly insieme alla loro grandezza.
 * L'Assembly deve calcolare il prodotto scalare (moltiplicando gli elementi a 2 a 2 e sommandoli tutti) e restituire
 * il risultato finale al C per la stampa. */


 #include <stdio.h>

 extern int prodotto_scalare(int *, int *, int);

 int main(void) {
    int v1[8] = {1, 5, 8, 2, 2, 6, 7, 2};
    int v2[8] = {4, 3, 6, 7, 5, 2, 3, 5};
    int result = prodotto_scalare(v1, v2, 8);
    printf("Prodotto scalare = %d\n", result);

    return 0;
 }
