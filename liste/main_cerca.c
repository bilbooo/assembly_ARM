#include <stdio.h>
#include <stdlib.h>
 
typedef struct _elem {
    int x;
    struct _elem *next;
} ELEM;
 
extern int cerca(ELEM*, int);
 
int main(int argc, char **argv) {
 
	int x = (argc != 1 ? atoi(argv[1]) : 1); 
	int trovato = 0;
 
	ELEM *p; 
	ELEM *p1 = (ELEM *)calloc(1, sizeof(ELEM));
	ELEM *p2 = (ELEM *)calloc(1, sizeof(ELEM));
	ELEM *p3 = (ELEM *)calloc(1, sizeof(ELEM));
	p1->x = 1; 
	p2->x = 2; 
	p3->x = 3; 
	p1->next = p2; 
	p2->next = p3; 
	p3->next = NULL; 
	p = p1;
 
  	trovato = cerca(p, x); 	
	printf("%d %s trovato\n", x, (trovato ? " " : " NON "));
	return(0); 
}