#include <stdio.h>


int main(){

    int m[2][2];

    int resultado = 0;

    m[0][0] = 1;
    m[0][1] = 2;
    m[1][0] = 3;
    m[1][1] = 4;

    


    extern int soma_asm (int*);

    resultado = soma_asm(*m);

    printf("%d",resultado);
    

}