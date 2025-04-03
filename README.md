# Vendor Risk Simulation Lab

A full-scale simulation and training environment for third-party risk and vulnerability management, designed to replicate real-world cybersecurity workflows and challenges.

Created by Dylan Leonard  
[GitHub](https://github.com/dylanleonard-1) | [LinkedIn](https://www.linkedin.com/in/dylan-leonard-b0962825b/)  
Email: dmleonard5125@gmail.com

---

## What It Does

This lab simulates realistic vendor vulnerability injects, mimicking third-party continuous monitoring, risk scoring, and outreach workflows. Each inject is uniquely generated to reflect real-world conditions like:

- Confirmed exposures
- Patch availability
- Emerging risks
- Bad data formatting
- SLA breaches
- Duplicate CVEs
- Missing contact details

---

## Folder Structure

```
vendor-risk-sim-lab/
│
├── generator/
│   ├── inject_generator.py            # Main inject generator script
│   ├── scenario_templates.csv         # Scenario logic rules (100+ entries)
│   ├── cve_pool.csv                   # Realistic CVEs + descriptions
│   ├── vendors.csv                    # Vendor names, contact emails, regions
│
├── injects/                           # Output folder for generated injects
│   ├── 2024-04-03_1230_mixed.csv
│   └── ...
│
├── communications/
│   ├── email_templates/               # Coming soon: outreach simulation
│   └── outreach_simulator.py          # Placeholder for future expansion
│
├── dashboards/                        # Power BI / Splunk mockups
│
├── logs/                              # (Optional) Inject history or metadata
│
└── README.md                          # You're reading it
```

---

## How To Use

### Step 1: Install Python requirements (optional)
```bash
pip install pandas
```

### Step 2: Run the Generator
```bash
python generator/inject_generator.py --scenario mixed --count 50
```

#### Available Options:
- `--scenario` — Choose from: `clean`, `mixed`, `missing field`, `escalation required`, etc.
- `--count` — How many rows to generate (default: 50)
- `--training_mode` — Adds `_training` suffix for training use

---

## What Makes This Powerful

- **100+ unique inject types** from real-world risk scenarios
- Real CVE-style descriptions with CVSS scores
- Fully randomized vendor data and contact info
- Simulates broken formatting, SLA violations, patch logic, and more
- Use in Excel, Power BI, or ingest into Splunk

---

## Future Plans

- Outreach message generation based on CVE & vendor
- Web-based front end for uploading raw files + generating clean outputs
- Simulated ticketing + remediation timeline tracking
- Auto-ingest into a GRC tool or dashboard

---

## License

MIT License. Built for educational and training use.