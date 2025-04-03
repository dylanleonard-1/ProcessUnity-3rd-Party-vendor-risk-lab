#!/usr/bin/env python3

import sys
import pandas as pd
import os

if len(sys.argv) != 2:
    print("Usage: python3 enrich_injects.py <inject_csv_path>")
    sys.exit(1)

inject_path = sys.argv[1]
vuln_pool_path = "../data/Vuln_pool/vuln_pool_100.csv"
output_dir = "../output"

try:
    inject_df = pd.read_csv(inject_path)
    vuln_df = pd.read_csv(vuln_pool_path)

    enriched_df = inject_df.merge(vuln_df, how="left", on="Vuln_ID")

    filename = os.path.basename(inject_path).replace(".csv", "")
    output_file = f"{output_dir}/enriched_{filename}.csv"
    enriched_df.to_csv(output_file, index=False)

    print(f"✅ Enrichment complete. Output saved to: {output_file}")

except Exception as e:
    print(f"❌ Error: {e}")

