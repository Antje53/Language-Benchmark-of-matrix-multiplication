package code.java;

public class benchmark_java {
    public static void main(String[] args) {
        int[] sizes = {128, 256, 512};
        int runs = 5;

        for (int n : sizes) {
            double total = 0.0;

            for (int r = 0; r < runs; r++) {
                double[][] A = matrix.generateMatrix(n);
                double[][] B = matrix.generateMatrix(n);
                long start = System.nanoTime();
                matrix.multiplyMatrices(A, B, n);
                long end = System.nanoTime();
                total += (end - start) / 1e9; 
            }

            double average = total / runs;
            System.out.printf("Average time for %dx%d matrix multiplication over %d runs: %.6f seconds%n", n, n, runs, average);
        }
    }
}
