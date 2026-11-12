#include <stdio.h>
#define N 10

int dimensione = N;

extern int cerca(int *, int);

int main(void) {
    int arr[N] = {1, 3, 6, 7, 10, 14, 18, 21, 24, 29};
    int ris1 = cerca(arr, 7);               // stampa 3
    int ris2 = cerca(arr, 16);              // stampa -1
    printf("Ris 1 = %d, Ris 2 = %d\n", ris1, ris2);

    return 0;
}