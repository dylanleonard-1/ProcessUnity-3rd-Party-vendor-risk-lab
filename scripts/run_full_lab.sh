#!/bin/bash

# Set working directory
cd /opt/vendor_risk_lab/generator

# Activate virtual environment
source ~/vendorlab_venv/bin/activate

# Generate injects
echo "⚙️ Generating injects..."
python3 inject_generator.py --scenario mixed --count 25 --training_mode

# Capture latest generated file path
latest_file=$(ls -t ../injects/*_mixed_training.csv | head -1)
echo "✅ Latest inject: $latest_file"

# Run enrichment
echo "⚙️ Running enrichment..."
cd ../scripts
python3 enrich_injects.py "$latest_file"

echo "✅ All done. Enriched file saved in /opt/vendor_risk_lab/output/"
