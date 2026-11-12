#include <stdio.h>

extern int my_strncmp(char *, char *, int);

int main(void) {
    char str1[] = "Matthew è un figo";
    char str2[] = "Matthew è uno gay";
    int risultato1 = my_strncmp(str1, str2, 12);
    int risultato2 = my_strncmp(str1, str2, 15);
    printf("Risultato 1 = %d, Risultato 2 = %d\n", risultato1, risultato2);

    return 0;
}