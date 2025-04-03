#!/bin/bash

# ============================================
# Vendor Risk Lab: Inject Generator Script
# ============================================

# Paths
BASE_DIR="/opt/vendor_risk_lab"
GEN_SCRIPT="$BASE_DIR/generator/inject_generator.py"
INJECT_DIR="$BASE_DIR/injects"
LOG_DIR="$BASE_DIR/logs"

# Timestamp
TS=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/generate_injects_log_$TS.txt"
OUTPUT_FILE="$INJECT_DIR/generated_inject_$TS.csv"

# Header
echo "------------------------------------------" | tee "$LOG_FILE"
echo "🚀 Inject Generation Started: $TS" | tee -a "$LOG_FILE"
echo "Using generator: $GEN_SCRIPT" | tee -a "$LOG_FILE"

# Validate Python script
if [ ! -f "$GEN_SCRIPT" ]; then
    echo "❌ Generator script not found: $GEN_SCRIPT" | tee -a "$LOG_FILE"
    exit 1
fi

# Run Python generator
python3 "$GEN_SCRIPT" --output "$OUTPUT_FILE" 2>>"$LOG_FILE"

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Inject generated successfully: $OUTPUT_FILE" | tee -a "$LOG_FILE"
else
    echo "❌ Inject generation failed. See log for details." | tee -a "$LOG_FILE"
    exit 1
fi

echo "Log saved to: $LOG_FILE" | tee -a "$LOG_FILE"
echo "------------------------------------------" | tee -a "$LOG_FILE"


