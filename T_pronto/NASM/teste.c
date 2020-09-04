#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

int L = 100;



int main()
{
    clock_t begin  = clock();
    int i,j;
    int a[L][L];
    int b[L][L];
    int c[L][L];
    int R[L][L];
    int R2[L][L];
    srand(time(0));
    int *resultado;
    int resultado2;
    double tempo_gasto = 0.0;

    for(i=0;i<L;i++)                                        // Preencher as matrizes A,B e C com valores aleatórios de 0 a 10
    {
        for(j=0;j<L;j++)
        {
            a[i][j] = (rand()%5);                      
            b[i][j] = (rand()%5);
            c[i][j] = (rand()%5);
        }
    }

    for(i=0;i<L;i++) 
    {                                       
        for(j=0;j<L;j++)
        {
            R[i][j] = 0;
            R2[i][j] = 0;
        }
    }

     printf("\n-------- Matriz A --------\n");

    for(i=0;i<L;i++) 
    {                                       
        for(j=0;j<L;j++)
        {
            printf("%d ",a[i][j]);
        }
        printf("\n");
    }

    printf("\n-------- Matriz B --------\n");

    for(i=0;i<L;i++) 
    {                                       
        for(j=0;j<L;j++)
        {
            printf("%d ",b[i][j]);
        }
        printf("\n");
    }

    printf("\n-------- Matriz C --------\n");

    for(i=0;i<L;i++) 
    {                                       
        for(j=0;j<L;j++)
        {
            printf("%d ",c[i][j]);
        }
        printf("\n");
    }



    extern int* mul_matriz (int*,int*,int*,int);
    extern int mul_matriz2 (int*,int*,int*,int);


    resultado = mul_matriz(*a,*b,*R,L);
    
    printf("\n-------- Matriz R --------\n");
    

    for (i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            R2[i][j] = resultado[i+j];
            printf("%.2d ",resultado[i+j]);
        }
        printf("\n");
    }
    
    resultado2 = mul_matriz2(*c,*R2,*R,L);

    printf("\n-------- Matriz R2 --------\n");
  

    for (i=0;i<L;i++)
    {
        for(j=0;j<L;j++)
        {
            printf("%.2d ",R[i][j]);
        }
        printf("\n");
    }

    printf("\n\n");
    printf("Menor elemento da diagonal: %d", resultado2);
      
    clock_t end  = clock();
    tempo_gasto += (double)(end-begin)/CLOCKS_PER_SEC;

    printf("\nTempo gasto: %lf segundos" ,tempo_gasto);
   
}