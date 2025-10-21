package code.java;

import java.util.Random;

public class matrix {
    public static void main(String[] args) {
        int n = 1024;
        double[][] A = new double[n][n];
        double[][] B = new double[n][n];
        double[][] C = new double[n][n];

        Random rand = new Random();

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                A[i][j] = rand.nextDouble();
                B[i][j] = rand.nextDouble();
                C[i][j] = 0;
            }
        }

        long start = System.currentTimeMillis();

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        long end = System.currentTimeMillis();

        System.out.printf("%.6f%n", (end - start) / 1000.0);
    }
}
