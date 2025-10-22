#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

void initialize_matrix(double** matrix, int n);
void multiply_matrices(double** a, double** b, double** c, int n);

double benchmark(int n, int runs) {
    struct timeval start, stop;
    double total_time = 0.0;
    
    for (int run = 0; run < runs; ++run) {
        double** a = malloc(n * sizeof(double*));
        double** b = malloc(n * sizeof(double*));
        double** c = malloc(n * sizeof(double*));
        for (int i = 0; i < n; ++i) {
            a[i] = malloc(n * sizeof(double));
            b[i] = malloc(n * sizeof(double));
            c[i] = malloc(n * sizeof(double));
        }
        
        initialize_matrix(a, n);
        initialize_matrix(b, n);

        gettimeofday(&start, NULL);
        multiply_matrices(a, b, c, n);
        gettimeofday(&stop, NULL);

        double diff = (stop.tv_sec - start.tv_sec)
                      + 1e-6 * (stop.tv_usec - start.tv_usec);
        total_time += diff;

        for (int i = 0; i < n; ++i) {
            free(a[i]);
            free(b[i]);
            free(c[i]);
        } 
        free(a);
        free(b);
        free(c);
    }
    return total_time / runs;
}


int main() {
    int sizes[] = {128, 256, 512};
    int runs = 5;

    for (int i = 0; i <  3; ++i) {
        double avg_time = benchmark(sizes[i], runs);
        printf("Average time for %dx%d matrix multiplication over %d runs: %.6f seconds\n", 
               sizes[i], sizes[i], runs, avg_time);
    }

    return 0;
}