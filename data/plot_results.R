data <- read.csv("summary.csv")

colors <- c("skyblue3", "palegreen3", "lightcoral")
langs <- unique(data$Language)

library(dplyr)
summary_avg <- data %>%
  group_by(Language, Size) %>%
  summarise(AvgTime = mean(Time),
            AvgMem = mean(Memory),
            AvgCPU = mean(CPU),
            .groups = 'drop')

# ============================
# EXECUTION TIME 
# ============================
png("execution_time_log.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(min(summary_avg$AvgTime[summary_avg$AvgTime > 0]), max(summary_avg$AvgTime)),
     log = "y",
     xlab = "Matrix Size (n x n)",
     ylab = "Average Time (seconds, log scale)",
     main = "Execution Time Comparison (Log Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgTime, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()


png("execution_time_linear.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(0, max(summary_avg$AvgTime)),
     xlab = "Matrix Size (n x n)",
     ylab = "Average Time (seconds)",
     main = "Execution Time Comparison (Linear Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgTime, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()

# ============================
# MEMORY USAGE
# ============================
png("memory_usage_log.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(min(summary_avg$AvgMem[summary_avg$AvgMem > 0]), max(summary_avg$AvgMem)),
     log = "y",
     xlab = "Matrix Size (n x n)",
     ylab = "Average Memory Usage (MB, log scale)",
     main = "Memory Usage Comparison (Log Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgMem, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()


png("memory_usage_linear.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(0, max(summary_avg$AvgMem)),
     xlab = "Matrix Size (n x n)",
     ylab = "Average Memory Usage (MB)",
     main = "Memory Usage Comparison (Linear Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgMem, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()

# ============================
# CPU TIME
# ============================
png("cpu_usage_log.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(min(summary_avg$AvgCPU[summary_avg$AvgCPU > 0]), max(summary_avg$AvgCPU)),
     log = "y",
     xlab = "Matrix Size (n x n)",
     ylab = "Average CPU Time (seconds, log scale)",
     main = "CPU Time Comparison (Log Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgCPU, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()


png("cpu_usage_linear.png", width = 900, height = 600)
plot(NULL,
     xlim = range(summary_avg$Size),
     ylim = c(0, max(summary_avg$AvgCPU)),
     xlab = "Matrix Size (n x n)",
     ylab = "Average CPU Time (seconds)",
     main = "CPU Time Comparison (Linear Scale)",
     cex.main = 1.3, cex.lab = 1.1, cex.axis = 0.9)
grid(col = "gray80", lty = "dotted")
for (i in seq_along(langs)) {
  subset <- subset(summary_avg, Language == langs[i])
  lines(subset$Size, subset$AvgCPU, type = "b", col = colors[i], lwd = 3, pch = 19)
}
legend("topleft", legend = langs, col = colors, lwd = 3, pch = 19)
dev.off()

cat("Charts saved: log + linear versions for time, memory, and CPU\n")
