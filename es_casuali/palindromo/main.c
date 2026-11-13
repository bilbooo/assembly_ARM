/* Il programma C legge una parola (ad esempio da riga di comando) e la passa all'Assembly insieme alla sua lunghezza.
 * L'Assembly deve scorrere la parola e verificare se è palindroma, restituendo al C 1 (true) o 0 (false). */


#include <stdio.h>
#include <string.h>

extern int palindrome(char *, size_t);

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Errore: devi inserire solo una parola\n");
        return 1;
    }
    char *word = argv[1];
    size_t len = strlen(word);
    int result = palindrome(word, len);
    printf("%d\n", result);

    return 0;
}