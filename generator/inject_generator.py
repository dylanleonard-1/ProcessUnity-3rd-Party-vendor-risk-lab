
import pandas as pd
import random
import argparse
from datetime import datetime, timedelta
import os

# Load source data (relative paths)
SCENARIO_PATH = "scenario_templates.csv"
CVE_PATH = "../data/Vuln_pool/vuln_pool_100.csv"
VENDOR_PATH = "vendors.csv"
OUTPUT_DIR = "../injects/"

def load_sources():
    scenarios = pd.read_csv(SCENARIO_PATH)
    cves = pd.read_csv(CVE_PATH)
    vendors = pd.read_csv(VENDOR_PATH)
    return scenarios, cves, vendors

def generate_inject(scenario_type='mixed', count=50, training_mode=False):
    scenarios, cves, vendors = load_sources()

    if scenario_type != 'mixed':
        scenarios = scenarios[scenarios['Inject_Type'].str.lower() == scenario_type.lower()]
    if scenarios.empty:
        print("No matching scenarios found.")
        return

    records = []
    selected_scenarios = scenarios.sample(n=count, replace=True)

    for _, scenario in selected_scenarios.iterrows():
        vendor = vendors.sample().iloc[0]
        vuln = cves.sample().iloc[0]
        days_ago = random.randint(1, 45)
        last_contact = datetime.now() - timedelta(days=days_ago)

        row = {
            "Vendor_Name": vendor['Vendor_Name'],
            "Region": vendor['Region'],
            "LOB_Assigned": vendor['LOB_Assigned'],
            "Contact_Name": vendor['Contact_Name'],
            "Contact_Email": vendor['Contact_Email'],
            "Vuln_ID": vuln['Vuln_ID'],
            "CVSS_Score": vuln['CVSS_Score'],
            "CVE_Description": vuln['Description'],
            "Exposure_Confirmed": scenario['Exposure_Confirmed'] if pd.notna(scenario['Exposure_Confirmed']) else random.choice(["Yes", "No", "Pending"]),
            "Patch_Available": scenario['Patch_Available'] if pd.notna(scenario['Patch_Available']) else random.choice(["Yes", "No", "Unknown"]),
            "MTTR_Estimate": random.choice(scenario['MTTR_Range'].split('-')),
            "Last_Contact_Date": last_contact.strftime("%Y-%m-%d"),
            "Days_Since_Last_Contact": days_ago,
            "Scenario_Type": scenario['Scenario_Type'],
            "Inject_Type": scenario['Inject_Type'],
            "Risk_Level": scenario['Risk_Level'],
            "Inject_Complexity": scenario['Inject_Complexity']
        }

        # Simulate missing field
        if scenario['Inject_Type'].lower() == "missing field":
            field_to_blank = random.choice(["Exposure_Confirmed", "Patch_Available", "Contact_Email"])
            row[field_to_blank] = ""

        # Simulate bad date format
        if scenario['Inject_Type'].lower() == "format error":
            row["Last_Contact_Date"] = last_contact.strftime("%d/%m/%Y")

        records.append(row)

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    timestamp = datetime.now().strftime("%Y-%m-%d_%H%M")
    suffix = "_training" if training_mode else ""
    output_file = f"{OUTPUT_DIR}{timestamp}_{scenario_type}{suffix}.csv"

    pd.DataFrame(records).to_csv(output_file, index=False)
    print(f"✅ Inject generated and saved to: {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate simulated vendor risk injects")
    parser.add_argument("--scenario", default="mixed", help="Scenario type (clean, mixed, etc.)")
    parser.add_argument("--count", type=int, default=50, help="Number of rows to generate")
    parser.add_argument("--training_mode", action="store_true", help="Label file as training")
    args = parser.parse_args()

    generate_inject(scenario_type=args.scenario, count=args.count, training_mode=args.training_mode)

