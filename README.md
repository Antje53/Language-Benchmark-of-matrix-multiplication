# Language-Benchmark-of-matrix-multiplication

## Comparative Performance Analysis of Matrix Multiplication in Python, Java, and C

### Overview
This project benchmarks the performance of a basic matrix multiplication algorithm implemented in Python, Java, and C. It evaluates how language design, memory management, and compilation or interpretation affect execution time, CPU usage, and memory consumption.


## Structure
```
Language-Benchmark-of-matrix-multiplication/
├── code/
│   ├── python/
│   │   ├── matrix.py
│   │   └── benchmark_python.py
│   ├── java/
│   │   ├── matrix.java
│   │   └── benchmark_java.java
│   └── c/
│       ├── matrix.c
│       └── benchmark_c.c
├── data/
│   ├── summary.csv
│   ├── execution_time_linear.png
│   ├── execution_time_log.png
│   ├── memory_usage_linear.png
│   ├── memory_usage_log.png
│   ├── cpu_usage_linear.png
│   ├── cpu_usage_log.png
│   ├── c_results.txt
│   ├── java_results.txt
│   └── python_results.txt
├── paper/
│   ├── Comparative_Performance_Analysis.pdf
│   └── .gitkeep
└── README.md
```
## Running Benchmarks

### Python
cd code/python
pip install psutil
python benchmark_python.py --sizes 128 256 512 --runs 5 --warmup 1

### Java
cd code/java
javac *.java
java benchmark_java.java

### C
cd code/c
gcc -O3 -march=native matrix.c benchmark_c.c -o benchmark_c.exe
./bench


## Results Summary
- C is the fastest due to compiled execution and direct memory access.  
- Java performs well because of JIT optimization.  
- Python is slower because of interpreted execution and dynamic typing.  
- All implementations show O(n³) scaling as matrix size increases.

