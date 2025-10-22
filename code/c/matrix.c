#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

void initialize_matrix(double** matrix, int n) {
    for (int i = 0; i < n; ++i) 
        for (int j = 0; j < n; ++j) 
            matrix[i][j] = (double)rand() / RAND_MAX;
}

void multiply_matrices(double** a, double** b, double** c, int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            c[i][j] = 0.0;
            for (int k = 0; k < n; ++k) 
                c[i][j] += a[i][k] * b[k][j]; 
            
        }
    }
}
