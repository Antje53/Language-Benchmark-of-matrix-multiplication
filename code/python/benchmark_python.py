import time
import matrix
import random

def benchmark():
    sizes = [128, 256, 512]
    runs = 5

    for n in sizes:
        times = []
        for _ in range(runs):
            A = matrix.generate_matrix(n)
            B = matrix.generate_matrix(n)

            start = time.time()
            matrix.multiply_matrices(A, B, n)
            end = time.time()

            times.append(end - start)
        avg_time = sum(times) / runs
        print(f"Average time for {n}x{n} matrix multiplication over {runs} runs: {avg_time:.6f} seconds")

if __name__ == "__main__":
    benchmark()