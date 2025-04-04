---

## ⚙️ CVEGenX Breakdown: How the Simulation Engine Works

<p align="center">
  <img src="https://github.com/dylanleonard-1/ProcessUnity-3rd-Party-vendor-risk-lab/blob/main/generator/ChatGPT%20Image%20Apr%203%2C%202025%2C%2008_50_50%20PM.png" alt="Engine Breakdown - How It Works" width="800"/>
</p>

> 🔧 This custom Python engine replicates a full analyst workflow — generating 50–100+ vendor injects in under **2 seconds**.  
> Inspired by how ProcessUnity tracks vendor risk from CVE to escalation.

---

### 🧬 Step 1: Pull From Scenario Templates

Every run starts by reading `scenario_templates.csv` which includes over 100 real-world risk patterns:

- CVEs with outdated or missing patches  
- Vendors with no response metadata  
- Known exploit + criticality combos  
- SLA breach examples and remediation timing

Each scenario defines a **logic template** — for example:

```csv
scenario_name,inject_rules
missing_patch,"Patch=No, Exploit=Yes, Risk=High"
escalation_required,"Exposure=Yes, Contact=Missing, Region=EMEA"
```

---

### 🧩 Step 2: Randomized Vendor + CVE Selection

The engine randomly selects:

- Vendors from `vendors.csv` (name, email, region, priority)
- Vulnerabilities from `vuln_pool_100.csv` (custom CVEs + descriptions)

Then merges both into a raw inject format, like:

```python
{
  "vendor": "Globex Solutions",
  "cve": "CVE-2025-3121",
  "region": "EMEA",
  "patch": "No",
  "exploit": "Yes",
  "exposure": "Pending",
}
```

---

### 🧪 Step 3: Inject Issues + Data Corruption

Using scenario rules, the engine **injects realistic problems** into each row:

- ❌ Missing fields (e.g., blank contact email)
- 🔁 Duplicates (same CVE repeated across vendors)
- ⏳ Patch delays (patch = No, exploit = Yes)
- 🌍 Region-specific spikes (e.g., SEA/APAC priority targets)
- ⚠️ SLA-based escalation logic

This makes each row **unique** and **chaotically realistic**, mirroring live vendor intake in ProcessUnity.

---

### 🧠 Step 4: Enrichment

A second enrichment pass pulls from the internal `data/patch_map.csv` and adds:

- `exploit_available` from custom mappings
- `date_published` from mock CVE timelines
- `patch_url` (if available)
- Auto-tagging for:
  - `Inject_Complexity` (Low/Medium/High)
  - `Risk_Level` (via logic tree based on exploit, patch, exposure)

---

### 🧾 Step 5: Output Clean CSVs

The final step creates structured files in:

- `/injects/` → Raw simulation (pre-enrichment)
- `/output/` → Enriched injects, ready for dashboards

Each run includes a timestamped filename like:

```
enriched_2025-04-03_1734_mixed_training.csv
```

---

### 🚀 Example Output (After Enrichment)

```csv
Vendor,CVE,Exposure,Patch,Region,Risk_Level,Inject_Complexity,Exploit_Available,Contact_Email
Initech Services,CVE-2025-3171,No,No,SA,Medium,High,Yes,contact@initech.fake
Globex Solutions,CVE-2025-30113,Yes,Yes,Asia,High,Medium,Yes,
Pied Piper Group,CVE-2025-3121,Pending,Yes,ME,High,Low,No,escalation@pied.fake
```

---

### 🧠 Why This Matters

This engine:

- Saves hours of manual CVE tracking  
- Builds **Excel- and ProcessUnity-compatible** structured injects  
- Prepares analysts for **real-world triage** and **remediation logic**  
- Enables dashboard creation in Power BI, Splunk, and GRC tools

---

> 🧠 Introducing **DAXForge** — the automation engine that turns raw injects into Excel + dashboard-ready data in **seconds**.  
> Perfectly tagged. Pre-formatted. Cleaned, sorted, and ready for risk analysts or GRC dashboards.

<p align="center">
  <a href="#the-excel-simulation-engine--what-youd-do-in-excel--done-in-seconds">
    <img src="https://img.shields.io/badge/Explore%20DAXForge%20Now-%F0%9F%9A%80-blue?style=for-the-badge" alt="Explore DAXForge">
  </a>
</p>


---

👉 [View the actual engine code →](https://github.com/dylanleonard-1/ProcessUnity-3rd-Party-vendor-risk-lab/blob/main/generator/inject_generator.py)  
👉 [Go deeper with the Automation Logic →](https://github.com/dylanleonard-1/ProcessUnity-3rd-Party-vendor-risk-lab/blob/main/docs/engine_breakdown.md)

---
