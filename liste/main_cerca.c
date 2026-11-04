#include <stdio.h>
#include <stdlib.h>
 
struct ELEM {
    int x;
    struct _elem *next;
};
 
extern int cerca(struct ELEM*, int);
 
int main(int argc, char **argv) {
 
	int x = (argc != 1 ? atoi(argv[1]) : 1); 
	int trovato = 0;
 
	struct ELEM *p; 
	struct ELEM *p1 = (struct ELEM *)calloc(1, sizeof(struct ELEM));
	struct ELEM *p2 = (struct ELEM *)calloc(1, sizeof(struct ELEM));
	struct ELEM *p3 = (struct ELEM *)calloc(1, sizeof(struct ELEM));
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