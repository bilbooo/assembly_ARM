/* non mi ricordavo la funzione e mi serviva il codice per le istruzioni */

#include <stdio.h>

int ricerca_binaria(int *v, int n, int x) {
    int sx = 0;
    int dx = n - 1;

    while (sx <= dx) {
        int mid = (sx + dx) / 2;

        if (v[mid] == x) {
            return mid;
        }
        else if (v[mid] < x) {
            sx = mid + 1;
        }
        else {
            dx = mid - 1;
        }
    }

    return -1;
}

int main(void) {
    int array[10] = {1, 2, 3, 4, 5, 6 , 7, 8, 9, 10};

    int trovato = ricerca_binaria(array, 10, 5);
    printf("%d\n", trovato);
    
    trovato = ricerca_binaria(array, 10, 23);
    printf("%d\n", trovato);

    return 0;
}
