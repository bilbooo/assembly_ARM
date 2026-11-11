#include <stdio.h>

extern int sumodds(int *, int);

int main(void) {
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int somma = sumodds(arr, 10);
    printf("Somma dispari = %d\n", somma);

    return 0;
}
