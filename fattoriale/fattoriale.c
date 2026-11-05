#include <stdio.h>
#include <stdlib.h>

size_t fattoriale(int n) {
    if (n == 1) return 1;

    return (n * fattoriale(n - 1));
}

int main(void) {
    size_t risultato = 0;
    int num = 5;

    risultato = fattoriale(5);
    printf("%d! = %zu\n", num, risultato);

    return 0;
}