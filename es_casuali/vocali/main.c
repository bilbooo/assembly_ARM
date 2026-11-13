/* Il programma C legge una stringa da riga di comando e la passa all'Assembly. La funzione Assembly deve contare
 * quante vocali minuscole ci sono nella stringa e restituire il conteggio finale al chiamante per la stampa */


#include <stdio.h>

extern int cerca_vocali(char *);

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Devi inserire una sola stringa\n");
        return 1;
    }

    char *str = argv[1];
    int n_vocali = cerca_vocali(str);
    printf("# vocali = %d\n", n_vocali);

    return 0;
}
