#!/bin/bash

# =============================
# Auto Enrichment Script v1.1
# For Vendor Risk Lab
# =============================

# Define paths
BASE_DIR="/opt/vendor_risk_lab"
INJECTS_DIR="$BASE_DIR/injects"
PATCH_DATA="$BASE_DIR/data/patch_enrichment/patch_exploit_status.csv"
LOGS_DIR="$BASE_DIR/logs"
OUTPUT_DIR="$BASE_DIR/output"

# Create timestamp
TS=$(date +"%Y-%m-%d_%H-%M-%S")

# Log and Output file paths
LOG_FILE="$LOGS_DIR/auto_enrich_log_$TS.txt"
OUTPUT_FILE="$OUTPUT_DIR/enriched_inject_$TS.csv"

# Header
echo "-------------------------------------" | tee -a "$LOG_FILE"
echo "🔍 Auto Enrichment Script Started at $TS" | tee -a "$LOG_FILE"
echo "📂 Input Directory: $INJECTS_DIR" | tee -a "$LOG_FILE"
echo "📄 Patch Data File: $PATCH_DATA" | tee -a "$LOG_FILE"
echo "-------------------------------------" | tee -a "$LOG_FILE"

# Check for patch enrichment file
if [ ! -f "$PATCH_DATA" ]; then
    echo "❌ Error: Patch enrichment data not found at $PATCH_DATA" | tee -a "$LOG_FILE"
    exit 1
fi

# Find the most recent inject CSV
LATEST_INJECT=$(ls -t "$INJECTS_DIR"/*.csv 2>/dev/null | head -n 1)

if [ -z "$LATEST_INJECT" ]; then
    echo "❌ Error: No inject files found in $INJECTS_DIR" | tee -a "$LOG_FILE"
    exit 1
fi

echo "📄 Enriching latest inject file: $LATEST_INJECT" | tee -a "$LOG_FILE"

# Perform enrichment using CSV merge logic via awk
awk -F, '
    NR==FNR {
        patch[$1]=$2 "," $3 "," $4;
        next
    }
    FNR==1 {
        print $0 ",Patch_Available,Exploit_Known,Exploit_Link";
        next
    }
    {
        enriched = (patch[$3] != "") ? patch[$3] : "N/A,N/A,N/A";
        print $0 "," enriched;
    }
' "$PATCH_DATA" "$LATEST_INJECT" > "$OUTPUT_FILE"

# Finish
echo "✅ Enrichment complete!" | tee -a "$LOG_FILE"
echo "📦 Enriched file saved to: $OUTPUT_FILE" | tee -a "$LOG_FILE"
echo "📑 Log saved to: $LOG_FILE" | tee -a "$LOG_FILE"
echo "-------------------------------------" | tee -a "$LOG_FILE"

