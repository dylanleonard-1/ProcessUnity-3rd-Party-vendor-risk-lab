# 🛡️ Vendor Risk Simulation Lab

<p align="center">
  <img src="https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/Screenshots/ChatGPT%20Image%20Apr%203%2C%202025%2C%2007_14_47%20PM.png?raw=true" alt="Vendor Risk Simulation Lab Banner" width="800">
</p>

<p align="center"><em>Built for ProcessUnity-style workflows, Excel + DAX training, and full-spectrum third-party risk simulations.</em></p>

> ⚙️ A full-scale training and simulation system for third-party risk & vulnerability management  
> Built by **Dylan Leonard** – automating hours of analyst work in seconds.

![Last Commit](https://img.shields.io/github/last-commit/dylanleonard-1/vendor-risk-lab)
![Language](https://img.shields.io/github/languages/top/dylanleonard-1/vendor-risk-lab)
![License](https://img.shields.io/github/license/dylanleonard-1/vendor-risk-lab)
![Repo Stars](https://img.shields.io/github/stars/dylanleonard-1/vendor-risk-lab?style=social)

---

## 🎯 What This Is

This lab replicates **real-world vendor risk operations**. It generates simulated third-party vulnerability injects with randomized vendors, CVEs, exposure statuses, broken formatting, missing fields, duplicate entries, and more.

> ✅ Designed for SOCs, analysts, GRC teams, and red teams  
> ✅ Supports Excel, Power BI, Splunk, SOAR  
> ✅ Built for fast onboarding, dashboards, and training

---

## 🚀 Key Features

- ⚙️ **Custom-built Python engine** to simulate third-party CVE injects
- 🧠 **100+ realistic scenarios** (patch delays, CVSS errors, SLA violations, etc.)
- 📥 Output directly into structured CSVs for Excel / dashboarding
- 🤖 **Fully automated enrichment** using real patch/exploit metadata
- 🧪 Built for practice in:
  - Excel filtering, tagging, VLOOKUP/XLOOKUP
  - Outreach simulation
  - Dashboarding
  - Risk tracking

---

## 📂 Folder Structure

```
vendor-risk-lab/
│
├── generator/
│   ├── inject_generator.py        # CLI-based inject engine
│   ├── scenario_templates.csv     # 100+ unique inject rules
│   ├── vendors.csv                # Simulated third-party vendors
│   └── vuln_pool_100.csv          # CVE-like vulnerability pool
│
├── injects/                       # Injects output here
├── output/                        # Enriched injects after mapping
├── data/                          # Patch mapping data, etc.
├── dashboards/                    # Power BI mockups
├── communications/               # Outreach templates & tools (WIP)
└── README.md
```

---

## 📸 Mock Inject Example

```plaintext
| Vendor            | CVE              | Exposure | Patch | Region | Risk   |
|-------------------|------------------|----------|-------|--------|--------|
| Initech Services  | CVE-2025-3171    | No       | No    | SA     | Medium |
| Globex Solutions  | CVE-2025-30113   | Yes      | Yes   | Asia   | High   |
| Pied Piper Group  | CVE-2025-3121    | Pending  | Yes   | ME     | High   |
```

🔗 **[View Real Inject CSV →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/output/enriched_2025-04-03_1734_mixed_training.csv)**

---

## 📊 Excel + DAX Practice

This lab helps you practice:
- 🔍 Searching & filtering bad or missing data
- 🧮 DAX tags for SLA violation, missing patch, no contact
- ✅ Conditional formatting for critical vendors
- 📧 Outreach tagging ("Escalate", "Remind", "Flag")

🔗 [Excel Deep Dive & Tutorial →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/excel_training)

---

## 🤖 The Engine: Inject + Enrich in 1 Line

```bash
python3 generator/inject_generator.py --scenario mixed --count 50 --training_mode
bash scripts/auto_enrich.sh
```

---

## 💡 Why It Matters

> "Without this tool, analysts spend **2–3 hours per session** collecting CVEs, formatting injects, copying vendor info, checking patch data, and cleaning up outputs for dashboards.  
>  
> With this engine? 1 command. 2 minutes. Same results — **faster**, **cleaner**, **automated**, and **repeatable**."

Teams can cut hours of manual work, reduce errors, and deliver cleaner outputs at scale.

---

## 🔥 Dashboards: Power BI, Splunk & ProcessUnity Alignment

This lab is designed to simulate and **mirror the visibility you'd build inside ProcessUnity dashboards** — but locally, with full control and flexibility.

### 📈 Power BI

- Drag-and-drop CSV outputs into Power BI to visualize:
  - SLA status over time
  - Region-level CVE trends
  - Vendor heatmaps and overdue responses
- Leverage **DAX formulas** to replicate risk scoring, escalation logic, and conditional flags you'd automate in ProcessUnity.

> 🧠 This lets analysts **practice risk modeling and remediation visuals** before touching a live GRC environment.

🔗 [Power BI Dashboard Walkthrough →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/powerbi_dashboards)

---

### 📡 Splunk

Splunk is used to **simulate real-time ingestion and alerting**, like you'd do with a ProcessUnity + SIEM integration:

- Ingest your inject logs into Splunk Enterprise
- Use fields like `Exposure_Confirmed`, `Patch_Available`, `Risk_Level` for live dashboards
- Monitor anomalies, missing contacts, or sudden risk spikes by region

🔗 [Splunk + SOAR Playbooks →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/splunk_soar)

---

### 🧩 ProcessUnity Compatibility

This lab reflects the same lifecycle found in ProcessUnity workflows:

| Simulation Lab Step          | Equivalent in ProcessUnity                          |
|-----------------------------|-----------------------------------------------------|
| Inject Generator             | Vendor scan intake / assessment trigger             |
| CSV Output (Raw & Enriched) | Vendor risk register upload or data connector sync  |
| Excel/DAX Dashboards         | ProcessUnity Risk Summary + SLA widgets             |
| Outreach Simulator (WIP)     | Vendor remediation tracking + communication threads |
| SOAR Integration             | Auto-remediation or ticketing escalation            |

By using this toolset, you can **mimic ProcessUnity operations in a test environment**, sharpen your vendor risk skills, and build dashboards that **translate directly into real GRC platforms**.

---


## 🔧 Setup Tutorial

> Ready to get started?  
📦 Clone this repo and check out the [Setup Guide →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/SETUP.md)

---

## 🛠️ Built For Real Practice

This project was built from scratch as part of my training workflow.  
It combines red team simulation, vendor outreach, GRC workflows, and analyst logic into one fully automated engine.

---

---

## 🤖 The Engine: What You’d Do in Excel — Done in Seconds

Manually cleaning vendor injects in Excel takes time:

- Copying CVE info
- Validating patch availability
- Filling in missing data
- Highlighting SLA violations
- Adding outreach or escalation tags

### ⚙️ Enter the Inject Engine

This lab’s engine replicates all of that, instantly:

- **Randomly selects vendors + CVEs**
- **Injects controlled errors** (missing contacts, duplicate CVEs, format issues)
- **Adds metadata fields** like exploit availability, date published, and patch status
- **Tags risk level + inject complexity**, just like you'd flag in Excel/DAX

> 🧠 In other words: the exact same logic a GRC analyst would apply manually — **now automated and repeatable**.

```bash
# Simulate + Enrich
python3 generator/inject_generator.py --scenario mixed --count 50 --training_mode
bash scripts/auto_enrich.sh
```

---

📎 Want to see **how the logic works behind the scenes**?

🔗 [Engine Breakdown & Automation Logic →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/docs/engine_breakdown.md)

---


## 🧑‍💻 Author

**Dylan Leonard**  
🔗 [GitHub](https://github.com/dylanleonard-1) | [LinkedIn](https://www.linkedin.com/in/dylan-leonard-b0962825b/)  
📧 dmleonard5125@gmail.com

---

## 📜 License

MIT License – For education, training, and red team simulation use.
