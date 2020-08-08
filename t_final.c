#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>


int L = 5;                                                  // Tamanho das matrizes


int main(void){

    srand(time(NULL));
    int i,j;
    int matriz_A[L][L],
        matriz_B[L][L],
        matriz_C[L][L],
        matriz_R[L][L];
    
    
    for(i=0;i<L;i++)                                        // Preencher as matrizes A,B e C com valores aleatórios de 0 a 100
    {
        for(j=0;j<L;j++)
        {
            matriz_A[i][j] = (rand()%100);                      
            matriz_B[i][j] = (rand()%100);
            matriz_C[i][j] = (rand()%100);
        }
    }

    printf("----------- Matriz A ---------------\n\n");

    for(i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            printf("%.2d ",matriz_A[i][j]);
        }
        printf("\n");
    }

    printf("\n");
    printf("----------- Matriz B ---------------\n\n");

    for(i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            printf("%.2d ",matriz_B[i][j]);
        }
        printf("\n");
    }


    for(i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            matriz_R[i][j]= matriz_A[i][j] * matriz_B[j][i];
        }
    }

     printf("\n");
    printf("----------- Matriz R ---------------\n\n");

    for(i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            printf("%.2d ",matriz_R[i][j]);
        }
        printf("\n");
    }



    
}