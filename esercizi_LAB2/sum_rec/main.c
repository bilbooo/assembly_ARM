#include <stdio.h>

extern int somma(int, int);

/*
int somma(int a, int b) {
    if (b == 0) return a;

    return somma(a + 1, b - 1);
}
*/

int main(void) {
    int a = -5, b = 7  ;
    printf("%d + %d = %d\n", a, b, somma(a, b));

    return 0;
}