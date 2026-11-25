#!/bin/bash

# Author: Ashi Choudhary
# Roll Number: 2601730018
# Purpose: Generate a system information report

echo "=========================================="
echo "       SYSTEM INFORMATION REPORT"
echo "Name: Ashi Choudhary"
echo "Roll Number: 2601730018"
echo "Date: $(date)"
echo "=========================================="

echo ""
echo "CPU INFORMATION"
echo "CPU Model: $(sysctl -n machdep.cpu.brand_string)"
echo "CPU Cores: $(sysctl -n hw.ncpu)"

echo ""
echo "MEMORY INFORMATION"

TOTAL_BYTES=$(sysctl -n hw.memsize)
TOTAL_GB=$(awk -v b="$TOTAL_BYTES" 'BEGIN {printf "%.2f", b/1073741824}')

FREE_PERCENT=$(memory_pressure -Q | awk -F': ' '/System-wide memory free percentage/ {gsub("%","",$2); print $2}')

USED_GB=$(awk -v t="$TOTAL_GB" -v f="$FREE_PERCENT" 'BEGIN {printf "%.2f", t*(100-f)/100}')

echo "Total Memory: ${TOTAL_GB} GB"
echo "Estimated Used Memory: ${USED_GB} GB"
echo "Free Memory Percentage: ${FREE_PERCENT}%"

echo ""
echo "TOP 3 PROCESSES BY CPU USAGE"
ps -A -o %cpu=,comm= | sort -nr | head -3

echo ""
echo "=========================================="
echo "Report generated successfully."
echo "=========================================="
