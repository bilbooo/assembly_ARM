/* Dichiara un array di 10 interi nel codice C e passalo a una funzione Assembly insieme alla dimensione.
 * L'Assembly deve scorrere l'array, trovare il valore massimo e restituirlo al C. */


 #include <stdio.h>

 extern int cerca_max(int *, int);

 int main(void) {
    int arr[10] = {4, -2, 8, 100, -56, 23, 9, -17, 10, 0};
    int max = cerca_max(arr, 10);
    printf("max = %d\n", max);

    return 0;;
 }
