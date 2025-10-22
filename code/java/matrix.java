package code.java;

import java.util.Random;

public class matrix {
    
    public static double[][] generateMatrix(int n) {
        double[][] matrix = new double[n][n];
        Random rand = new Random();
        for (int i = 0; i < n; i++) 
            for (int j = 0; j < n; j++) 
                matrix[i][j] = rand.nextDouble();
        return matrix;
    }

    public static double[][] multiplyMatrices(double[][] A, double[][] B, int n) {
        double[][] C = new double[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        return C;
    }
}

