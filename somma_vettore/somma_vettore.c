#include <stdio.h>

int somma(int *v, int dim) {
    int sum = 0;
    for (int i = 0; i < dim; i++) {
        sum = sum + v[i];
    }

    return sum;
}

int main(void) {
    int arr[5] = {1, 3, 4, 12, 8};

    printf("Somma totale = %d\n", somma(arr, 5));

    return 0;
}