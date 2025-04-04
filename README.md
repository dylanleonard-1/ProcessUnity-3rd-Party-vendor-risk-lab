# 🛡️ ProcessUnity 3rd Party Vendor Risk Simulation Lab

<p align="center">
  <img src="https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/Screenshots/ChatGPT%20Image%20Apr%203%2C%202025%2C%2007_14_47%20PM.png?raw=true" alt="Vendor Risk Simulation Lab Banner" width="800">
</p>

<p align="center"><em>Built for ProcessUnity-style workflows, Excel + DAX training, and full-spectrum third-party risk simulations.</em></p>

> ⚙️ A full-scale training and simulation system for third-party risk & vulnerability management  
> Built by **Dylan Leonard** – automating hours of analyst work in seconds.

---

<p align="center">
  <img src="https://img.shields.io/github/last-commit/dylanleonard-1/vendor-risk-lab" alt="Last Commit" />
  &nbsp;•&nbsp;
  <img src="https://img.shields.io/github/languages/top/dylanleonard-1/vendor-risk-lab" alt="Top Language" />
  &nbsp;•&nbsp;
  <a href="https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT" />
  </a>
  &nbsp;•&nbsp;
  <a href="https://github.com/dylanleonard-1/vendor-risk-lab/stargazers">
    <img src="https://img.shields.io/github/stars/dylanleonard-1/vendor-risk-lab?style=social" alt="GitHub Stars" />
  </a>
  <br/>
  <img src="https://img.shields.io/badge/status-Stable-success" alt="Project Status: Stable" />
  &nbsp;•&nbsp;
  <img src="https://img.shields.io/badge/Built%20for-ProcessUnity-blue" alt="Built For: ProcessUnity" />
</p>


## 🧭 Table of Contents

- [🎯 What This Is](#-what-this-is)
- [🚀 Key Features](#-key-features)
- [📂 Folder Structure](#-folder-structure)
- [⚙️ How CVEGenX Works: The Flow of Data](#-how-cvegenx-works-the-flow-of-data)
- [📸 Mock Inject Sample](#-mock-inject-sample)
- [📊 Excel + DAX Practice](#-excel--dax-practice)
- [🚨DaxForge: What You’d Do in Excel — Done in Seconds](#daxforge-what-youd-do-in-excel--done-in-seconds)
- [💡 Why It Matters](#-why-it-matters)
- [🔥 Dashboards: Power BI, Splunk & ProcessUnity Alignment](#-dashboards-power-bi-splunk--processunity-alignment)
- [📊 Why Dashboards Matter](#-why-dashboards-matter)
- [🧩 ProcessUnity Compatibility](#-processunity-compatibility)
- [🔧 Setup Tutorial](#-setup-tutorial)
- [🛠️ Built For Real Practice](#-built-for-real-practice)
- [👨‍💻 Author](#-author)
- [📜 License](#-license)




---

## 🎯 What This Is

This lab replicates the **entire lifecycle of real-world vendor risk management**, inspired by how tools like **ProcessUnity** handle intake, analysis, triage, and escalation.

It generates simulated third-party vulnerability injects with:

- Randomized vendors and contact metadata  
- Realistic CVEs and exploit metadata  
- Exposure flags and patch statuses  
- Broken formatting, missing fields, duplicate entries  
- Region-based risk scoring and escalation tags

These injects mimic the exact logic you'd see in a GRC platform, preparing analysts to work with systems like **ProcessUnity**, **Splunk**, and **Power BI**.

> ✅ Ideal for SOC analysts, GRC teams, vendor risk engineers, and red teamers  
> ✅ Teaches vendor triage, patch validation, and SLA tagging  
> ✅ Supports realistic practice in Excel, Splunk, SOAR, and Power BI  
> ✅ Built for rapid training, portfolio simulation, and dashboard generation

---

## 🚀 Key Features

- ⚙️ **Python-based simulation engine**  
  Auto-generates realistic CVE injects with randomized fields and scenarios.

- 🧠 **100+ risk inject scenarios**  
  Includes data anomalies like missing contact info, invalid formats, outdated CVEs, SLA violations, duplicate findings, and region spikes.

- 📥 **Clean CSV output for Excel or dashboard use**  
  Seamlessly imports into Excel, Power BI, or even simulated ProcessUnity workflows.

- 🤖 **1-line enrichment engine**  
  Adds exploit data, patch availability, publish date, and auto-tags each inject by risk and complexity.

- 🧪 **Training-focused** — Built for hands-on analyst simulation:
  - Excel filtering, tagging, VLOOKUP/XLOOKUP  
  - Conditional formatting, escalation tracking  
  - Power BI dashboard building  
  - Simulated outreach based on vendor/contact fields  
  - Risk tracking + SOAR response testing


---

## 📂 Folder Structure

```
vendor-risk-lab/
├── generator/               # CLI-based inject engine
│   ├── inject_generator.py
│   ├── scenario_templates.csv
│   ├── vendors.csv
│   └── vuln_pool_100.csv
├── injects/                 # Raw injects
├── output/                  # Enriched output
├── data/                    # Patch enrichment references
├── dashboards/              # Power BI mockups
├── communications/          # WIP outreach tools
├── splunk_soar/             # Splunk & SOAR integration
├── excel_training/          # Excel filtering & tagging logic
└── README.md
```

---

## 🎯 How CVEGenX Works: The Flow of Data

Everything in this lab begins with **CVEGenX** — a custom Python system that automates how vendor risk data is created, enriched, and formatted for analysis.

> 🔧 It mimics what an analyst would manually do in Excel or inside ProcessUnity dashboards — but in seconds.

### 🧬 The CVEGenX Performs:
- Randomized selection of vendors + fake CVEs
- Controlled data mutations: missing contact info, duplicate CVEs, patch delay flags
- Auto-tagging for fields like `Risk_Level`, `Exposure_Confirmed`, `Inject_Complexity`
- Enrichment with **exploit data**, **patch metadata**, and **SLA tags**
- Output into structured CSVs for:
  - Excel + DAX analysis
  - Power BI dashboards
  - Splunk / SOAR ingestion
  - GRC simulation like ProcessUnity
https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/LICENSE
Run it all with just **one command**:

```bash
python3 generator/inject_generator.py --scenario mixed --count 50 --training_mode
bash scripts/auto_enrich.sh
```

🧠 See behind-the-scenes logic here:  
🔗 [CVEGenX Breakdown →](https://github.com/dylanleonard-1/ProcessUnity-3rd-Party-vendor-risk-lab/blob/main/generator/README.md)

---

## 📸 Mock Inject Sample

```plaintext
| Vendor            | CVE              | Exposure | Patch | Region | Risk   |
|-------------------|------------------|----------|-------|--------|--------|
| Initech Services  | CVE-2025-3171    | No       | No    | SA     | Medium |
| Globex Solutions  | CVE-2025-30113   | Yes      | Yes   | Asia   | High   |
| Pied Piper Group  | CVE-2025-3121    | Pending  | Yes   | ME     | High   |
```

🔗 **[View Real Inject CSV →](https://1drv.ms/x/c/5ffba468ae197aa5/Ef4JTcHCCq5BgWC27z6VpfgB4J0PQyUT2bEZwhnBaMRGoA?e=9R7jZQ)**

---

## 📊 Excel + DAX Practice

This lab helps you practice:

- 🔍 Filtering bad or missing data in Excel
- 🧮 Creating DAX tags for SLA violations and patch status
- ✅ Conditional formatting based on risk or region
- 📧 Simulating outreach using escalation tags

🔗 [Excel Deep Dive →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/excel_training)

---

## DaxForge: What You’d Do in Excel — Done in Seconds

Manually cleaning vendor injects in Excel takes time:

- Copying CVE info
- Validating patch availability
- Filling in missing data
- Highlighting SLA violations
- Adding outreach or escalation tags

### ⚙️ Enter the DaxForge

This lab’s engine replicates all of that, instantly:

- Randomly selects vendors + CVEs
- Injects controlled errors (missing contacts, duplicate CVEs, format issues)
- Adds metadata fields like exploit availability and patch status
- Tags `Risk_Level`, `Inject_Complexity`, and other fields just like in ProcessUnity dashboards

> 🧠 The same GRC logic — made fast, repeatable, and scalable.

```bash
python3 generator/inject_generator.py --scenario mixed --count 50 --training_mode
bash scripts/auto_enrich.sh
```
## 🤖 DaxForge Mock Inject Sample

```plaintext
| Vendor            | CVE              | Exposure | Patch | Region | Risk   | Inject Complexity | Risk Level  | Tag SLA |
|-------------------|------------------|----------|-------|--------|--------|-------------------|-------------|---------|
| Initech Services  | CVE-2025-3171    | No       | No    | SA     | Medium | High              | Critical    | Flagged |
| Globex Solutions  | CVE-2025-30113   | Yes      | Yes   | Asia   | High   | Low               | High        | Cleared |
| Pied Piper Group  | CVE-2025-3121    | Pending  | Yes   | ME     | High   | Medium            | Critical    | Flagged |
```

🔗 **[View Real Inject CSV →](https://1drv.ms/x/c/5ffba468ae197aa5/EaHtOdCYZq5CggDNubs_nM4BMjdO1-DuPhemMe-DXqLjRA?e=DuedTN)**

📎 Want to understand how it works?

🔗 [DaxForge Breakdown & Automation Logic →](https://github.com/dylanleonard-1/ProcessUnity-3rd-Party-vendor-risk-lab/blob/main/scripts/README.md)

---

## 💡 Why It Matters

> “Without this engine, analysts spend 2–3 hours building injects, cleaning data, checking patch info, and preparing dashboards.  
> With this engine? 1 line. 2 minutes. 100 injects — cleaned, enriched, and tagged.”

---

## 🔥 Dashboards: Power BI, Splunk & ProcessUnity Alignment

This lab is built to mirror dashboard logic in ProcessUnity:

### 📈 Power BI

- Visualize SLA breaches, patch status, risk by region
- Create vendor heatmaps and overdue timelines
- Use DAX to build scoring models and filters

🔗 [Power BI Dashboard Walkthrough →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/powerbi_dashboards)

---

### 📡 Splunk

Simulate live ingestion for SIEM + GRC fusion:

- Ingest CSVs into Splunk Enterprise
- Search fields like `Patch_Available`, `Risk_Level`, `Days_Since_Last_Contact`
- Create alerts or trend dashboards on vendor risk spikes

🔗 [Splunk + SOAR Playbooks →](https://github.com/dylanleonard-1/vendor-risk-lab/tree/main/splunk_soar)

---

## 📊 Why Dashboards Matter

Dashboards = your GRC command center.

In ProcessUnity or Power BI, they let you:

- 🔎 Pinpoint at-risk vendors instantly
- 🚩 Detect SLA gaps, late responses, or missing contacts
- 📧 Prioritize outreach by severity and region
- ⏳ Monitor timelines for closure or escalation

> Use this lab to rehearse real GRC responses in a simulated workspace.

🔗 [See Dashboard Strategy & Examples →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/docs/dashboard_guide.md)

---

## 🧩 ProcessUnity Compatibility

| Simulation Lab Step          | Equivalent in ProcessUnity                          |
|-----------------------------|-----------------------------------------------------|
| Inject Generator             | Vendor scan intake / assessment trigger             |
| CSV Output (Raw & Enriched) | Vendor risk register upload or data sync            |
| Excel/DAX Dashboards         | Risk summary + SLA widgets                          |
| Outreach Simulator (WIP)     | Remediation tracking + comms thread                 |
| SOAR Integration             | Auto-remediation or alert routing                   |

By mimicking ProcessUnity lifecycle steps, this lab builds transferable skills for live GRC platforms.

🔗 [Learn more about how this lab aligns with ProcessUnity workflows →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/docs/processunity_alignment.md)


---

## 🔧 Setup Tutorial

> Ready to get started?

📦 Clone this repo and follow the [Setup Guide →](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/SETUP.md)

---

## 🛠️ Built For Real Practice

Designed from scratch to simulate full vendor risk workflows — from CVE discovery to SOAR escalation — using local files and open tools.

Use it for:

- 🧪 Red team emulation
- 📊 GRC dashboard practice
- 📧 Outreach simulation
- 🔐 Interview prep
- 📡 Live tool integration

---

## 👨‍💻 Author

**Dylan Leonard**  
🔗 [GitHub](https://github.com/dylanleonard-1) | [LinkedIn](https://www.linkedin.com/in/dylan-leonard-b0962825b/)  
📧 dmleonard5125@gmail.com

---

## 📜 License

This project is licensed under the [MIT License](https://github.com/dylanleonard-1/vendor-risk-lab/blob/main/LICENSE).

> A short, permissive license for educational, research, and simulation use.  
> No warranties or guarantees are provided — use at your own risk.

