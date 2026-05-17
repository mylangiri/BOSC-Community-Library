# 📚 BOSC Community Library

![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)
![Status: Active](https://img.shields.io/badge/status-active-success.svg)
![Resources](https://img.shields.io/badge/resources-16-orange.svg)
![Languages](https://img.shields.io/badge/languages-4-purple.svg)

> *"Knowledge is the one resource that grows when shared."*

The **BOSC Community Library** is a free, open-source digital resource repository designed to serve students, educators, researchers, and public institutions across the globe. Our mission is to democratize access to quality educational materials, software tools, and community-curated knowledge — all under a permissive open license.

---

## 📖 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Resource Categories](#resource-categories)
- [Language Support](#language-support)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Governance](#governance)
- [Sustainability](#sustainability)
- [Legal & Compliance](#legal--compliance)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Contact & Community](#contact--community)

---

## Overview

BOSC Community Library was founded on the principle that access to knowledge should not be gated by geography, income, or language. The library aggregates and indexes high-quality, openly-licensed educational resources spanning computer science, mathematics, sciences, humanities, and more.

**Current Stats:**
| Metric | Value |
|--------|-------|
| Total Resources | 16 |
| Supported Languages | 4 (EN, FR, SW, AR) |
| Resource Categories | 5 |
| License | Apache 2.0 |
| Database Version | 1.2.0 |

---

## ✨ Features

- **Curated Open Educational Resources (OER)** — hand-reviewed resources with verified open licenses
- **Searchable Resource Database** — structured JSON database with rich metadata
- **Multilingual Support** — resources in English, French, Swahili, and Arabic
- **Community-Driven Workflow** — GitHub Issues and Pull Requests for transparent contributions
- **Standardized Metadata Schema** — consistent entries with difficulty, format, and tagging
- **Transparent Governance** — documented legal compliance, sustainability, and code of conduct

---

## 🗂️ Repository Structure

```
BOSC-Community-Library/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE/
│       └── pull_request_template.md
├── resources/
│   ├── index.md
│   ├── databases/
│   │   └── resources.json         # Main resource database (v1.2.0, 16 resources)
│   └── languages/
│       ├── en.md                  # English resources
│       ├── fr.md                  # French resources
│       ├── sw.md                  # Swahili resources
│       └── ar.md                  # Arabic resources
├── docs/
│   └── government_pitch.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LEGAL_ANALYSIS.md
├── LICENSE                        # Apache 2.0
├── README.md
├── SUBMISSION_LOG.md
└── SUSTAINABILITY.md
```

---

## 📚 Resource Categories

### 💻 Computer Science & Software Engineering
The Missing Semester of Your CS Education, Open Source Guide, CS50, Pro Git Book, Python Documentation, Introduction à la Programmation (FR)

### ➗ Mathematics
OpenStax Calculus, Khan Academy Mathematics (EN & AR), Abstract Algebra: Theory and Applications

### 🔬 Sciences
OpenStax Biology 2e, CK-12 STEM Foundation

### 📜 Humanities & Social Sciences
Project Gutenberg, Internet Archive — Historical Documents

### 🛠️ Open Source Tools & Platforms
LibreOffice Documentation, Elimu ya Teknolojia — Ubuntu Kiswahili Guide (SW)

---

## 🌍 Language Support

| Language | Code | Resources |
|----------|------|-----------|
| English | `en` | 12 |
| French | `fr` | 1 |
| Swahili | `sw` | 1 |
| Arabic | `ar` | 1 |
| Multiple | — | 2 |

Language-specific lists are in `resources/languages/`. We actively seek contributors to expand coverage in underrepresented languages.

---

## 🚀 Getting Started

### Clone the Repository

```bash
git clone https://github.com/mylangiri/BOSC-Community-Library.git
cd BOSC-Community-Library
```

### Query the JSON Database

```bash
# List all resources (requires jq)
cat resources/databases/resources.json | jq '.resources[] | {title, category, difficulty}'

# Filter by language
cat resources/databases/resources.json | jq '.resources[] | select(.language == "fr")'

# Filter by difficulty
cat resources/databases/resources.json | jq '.resources[] | select(.difficulty == "beginner")'
```

### Add a New Resource

1. Fork the repository
2. Create a branch: `git checkout -b add/resource-name`
3. Add your entry to `resources/databases/resources.json`
4. Update the relevant language file in `resources/languages/`
5. Update `resources/index.md` and increment `totalResources`
6. Submit a Pull Request

---

## 🤝 Contributing

We welcome contributions from everyone! You can:
- **Add resources** — submit openly licensed educational materials
- **Improve translations** — expand language coverage
- **Fix broken links** — report or repair outdated URLs
- **Improve documentation** — clarify guides and README

Read [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide including branching strategy, commit conventions, and the review process.

**Resource checklist:**
- [ ] Openly licensed (CC, Public Domain, Free, etc.)
- [ ] URL is working and accessible
- [ ] All metadata fields completed
- [ ] `totalResources` count updated

---

## 🏛️ Governance

- **Maintainers** — issue triage, PR reviews, release management
- **Contributors** — submit resources and fixes via PRs
- **Community** — participate via issues and discussions
- All significant changes tracked in `SUBMISSION_LOG.md`

---

## 🌱 Sustainability

Our long-term strategy is in [SUSTAINABILITY.md](SUSTAINABILITY.md), covering community growth, institutional partnerships, funding models, and quality assurance.

---

## ⚖️ Legal & Compliance

All indexed resources carry open licenses compatible with Apache 2.0. Full analysis in [LEGAL_ANALYSIS.md](LEGAL_ANALYSIS.md).

**Accepted licenses:** Creative Commons, Public Domain, MIT, Apache, GPL, MPL, Free educational platforms  
**Not accepted:** Proprietary, paywalled, or unlicensed content

---

## 📄 License

Licensed under the **Apache License 2.0** — see [LICENSE](LICENSE) for full terms.

---

## 🤲 Code of Conduct

All participants must uphold our [Code of Conduct](CODE_OF_CONDUCT.md). We are committed to an inclusive, harassment-free community.

---

## 📬 Contact

- **Issues** — [Open an issue](../../issues) for bugs, suggestions, or questions
- **PRs** — Reviewed within 5–7 business days
- **Maintainer** — `bosc-maintainer`

---

*Built with ❤️ by the global open-source community.*
