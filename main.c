
#include <stdio.h>
#include <stdlib.h>

char dot_prod(void *A, void *B, int n, int i, int j);


char dot_prod_(char *A, char *B, int n, int i, int j)
{
  int c = 0;
  for (int k = 0; k < n; k++)
    {
      c += A[k+i*4] * B[j];
      j+=4;
    }
  return c;
}



#define N 4

char A[N][N] = { 3,  0,  1,  4,
                -5,  1, -1,  0,
                 0,  0,  1,  2,
                -2,  0,  7,  3};

// char B[N][N] = { 2, -1,  2, -2,
//                  2, -5, -4,  2,
//                 -1, -1,  5,  0,
//                 -1,  2, -2, -1};



char C[N][N];
char res[N][N];
char rand1[N][N];
void print_matrix(void *A, int n);



// char* randmatrix(char *A[], int n)
// {
// for(int i = 0; i<n; i++)
//         for(int j = 0; j<n; j++)
//             A[i][j] = rand() % 256 - 128;
// return A;
// }

void main () {
    int i, j;
    

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            C[i][j] = dot_prod(A, B, N, i, j);
            res[i][j] =dot_prod_(A, B, N, i, j);
            if(C[i][j] != res[i][j])
            {
                printf("Not equal at i=%d, j=%d",i,j);
            }
        }
    }



    print_matrix(A, N);
    print_matrix(B, N);
    print_matrix(C, N);
    print_matrix(res, N);


    return;
}


void print_matrix(void *A, int n) {
    int i, j;
    char val;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            val = *((char*)(A + i*n + j));
            printf("%4d", val);
        }
        putchar('\n');
    }
    putchar('\n');
}

