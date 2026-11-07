#include <stdio.h>

int fibonacci(int n) {
    if (n == 0 || n == 1) return 1;

    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(void) {
    int num = 4;
    int risultato = fibonacci(num);
    printf("Fibonacci(%d) = %d\n", num, risultato);

    return 0;
}
