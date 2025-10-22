package code.java;
import java.util.Random;

public class benchmark_java {
    public static void main(String[] args) {
        int[] sizes = {128, 256, 512};
        int runs = 5;
        Random rand = new Random();

        for (int n : sizes) {
            double total = 0.0;

            for (int r = 0; r < runs; r++) {
                double[][] A = new double[n][n];
                double[][] B = new double[n][n];

                long startWall = System.currentTimeMillis();
                long start = System.nanoTime();

                double[][] C = matrix.multiplyMatrices(A, B, n);

                long endWall = System.currentTimeMillis();
                long end = System.nanoTime();

                double wallTime = (endWall - startWall) / 1000.0;
                double cpuTime = (end - start) / 1e9;
                double estimatedMem = 3.0 * n * n * 8 / (1024 * 1024);

                System.out.printf("Run %d: Wall %.4f s | CPU %.4f s | Mem %.2f MB%n", r + 1, wallTime, cpuTime, estimatedMem);
                total += wallTime;
            }

            double average = total / runs;
            System.out.printf("Average time for %dx%d matrix multiplication over %d runs: %.6f seconds%n", n, n, runs, average);
        }
    }
}
