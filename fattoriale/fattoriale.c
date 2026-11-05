#include <stdio.h>
#include <stdlib.h>

size_t fattoriale(int n) {
    if (n == 1) return 1;

    return (n * fattoriale(n - 1));
}

int main(int argc, char **argv) {
    size_t risultato = 0;
    int num = atoi(argv[1]);
    if (num < 0) {
        printf("Numeri negativi non sono accettati\n");
        return 1;
    }

    risultato = fattoriale(num);
    printf("%d! = %zu\n", num, risultato);

    return 0;
}