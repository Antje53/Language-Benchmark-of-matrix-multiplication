import time
import matrix
import os
import psutil

def benchmark():
    sizes = [128, 256, 512]
    runs = 5
    process = psutil.Process(os.getpid())

    for n in sizes:
        times = []
        for _ in range(runs):
            A = matrix.generate_matrix(n)
            B = matrix.generate_matrix(n)

            start = time.time()
            start_cpu = time.process_time()

            matrix.multiply_matrices(A, B, n)

            end = time.time()
            end_cpu = time.process_time()

            wall_time = end - start
            cpu_time = end_cpu - start_cpu
            mem = process.memory_info().rss / (1024 * 1024)  
            print(f"Run {_+1}: Wall {wall_time:.4f}s | CPU {cpu_time:.4f}s | Mem {mem:.2f} MB")
            times.append(wall_time)

        avg_time = sum(times) / runs
        print(f"Average time for {n}x{n} matrix multiplication over {runs} runs: {avg_time:.6f} seconds")

if __name__ == "__main__":
    benchmark()
    