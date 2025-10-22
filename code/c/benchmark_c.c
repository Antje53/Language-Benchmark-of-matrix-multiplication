#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>

void initialize_matrix(double** matrix, int n);
void multiply_matrices(double** a, double** b, double** c, int n);

void benchmark() {
    int sizes[] = {128, 256, 512};
    int runs = 5;

    for (int i = 0; i <  3; ++i) {
        int n = sizes[i];
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


            clock_t start_cpu = clock();
            time_t start_wall = time(NULL);

            multiply_matrices(a, b, c, n);

            time_t end_wall = time(NULL);
            clock_t end_cpu = clock();
            
            double wall_time = difftime(end_wall, start_wall);
            double seconds = (double)(end_cpu - start_cpu) / CLOCKS_PER_SEC;
            double est_mem = (3.0 * n * n * 8.0) / (1024.0 * 1024.0);
            
            printf("Run %d: Wall %.4fs | CPU %.4fs | Mem %.2f MB\n", run + 1, wall_time, seconds, est_mem);
            total_time += seconds;

        

            for (int i = 0; i < n; ++i) {
                free(a[i]);
                free(b[i]);
                free(c[i]);
            } 
            free(a);
            free(b);
            free(c);
        }
        double avg_time = total_time / runs;
        printf("Average time for %dx%d matrix multiplication over %d runs: %.6f seconds\n", 
               n, n, runs, avg_time);
    }
}

int main() {
    benchmark();
    return 0;
}