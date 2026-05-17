# BOSC Community Library — Full Technical Documentation

## Table of Contents
1. [Project Overview](#1-project-overview)
2. [Architecture & Data Model](#2-architecture--data-model)
3. [Resource Database Schema](#3-resource-database-schema)
4. [Contribution Workflow](#4-contribution-workflow)
5. [Branching Strategy](#5-branching-strategy)
6. [Commit Message Conventions](#6-commit-message-conventions)
7. [Issue & PR Management](#7-issue--pr-management)
8. [Language & Localization Guide](#8-language--localization-guide)
9. [Quality Assurance](#9-quality-assurance)
10. [Roadmap](#10-roadmap)

---

## 1. Project Overview

### Mission
The BOSC Community Library democratizes access to educational resources by aggregating openly-licensed content in a structured, searchable, multilingual repository.

### Stakeholders
| Role | Responsibilities |
|------|-----------------|
| Maintainers | Code/content review, release management, governance |
| Contributors | Resource submissions, bug fixes, documentation |
| End Users | Students, educators, researchers, institutions |
| Institutional Partners | Governments, NGOs, universities |

### Technology Stack
| Component | Technology |
|-----------|-----------|
| Version Control | Git / GitHub |
| Resource Database | JSON (schema v1.2.0) |
| Documentation | Markdown |
| CI/CD | GitHub Actions (planned) |
| Licensing | Apache 2.0 |

---

## 2. Architecture & Data Model

The library uses a flat-file architecture optimized for:
- Zero infrastructure cost (runs entirely on GitHub)
- Human-readable and machine-parseable formats
- Easy contribution via standard Git workflows

```
┌─────────────────────────────────────┐
│         BOSC Community Library       │
│                                     │
│  ┌─────────────┐  ┌──────────────┐  │
│  │ resources/  │  │   .github/   │  │
│  │  database   │  │  templates   │  │
│  │  (JSON)     │  │              │  │
│  └──────┬──────┘  └──────────────┘  │
│         │                           │
│  ┌──────▼──────────────────────┐    │
│  │   Language-specific Views   │    │
│  │  en.md / fr.md / sw.md / ar │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

---

## 3. Resource Database Schema

Location: `resources/databases/resources.json`

### Top-Level Structure
```json
{
  "metadata": { ... },
  "resources": [ ... ]
}
```

### Metadata Object
```json
{
  "name": "BOSC Community Library Resource Database",
  "version": "1.2.0",
  "lastUpdated": "YYYY-MM-DD",
  "totalResources": 16,
  "maintainer": "BOSC Community Library"
}
```

### Resource Object Schema
```json
{
  "id": "res-NNN",
  "title": "Human-readable resource title",
  "category": "One of the 5 main categories",
  "subcategory": "Specific subject area",
  "language": "en | fr | sw | ar | multiple",
  "url": "https://verified-working-url.com",
  "license": "License identifier (e.g. CC-BY 4.0)",
  "addedDate": "YYYY-MM-DD",
  "addedBy": "GitHub username of contributor",
  "tags": ["array", "of", "lowercase", "tags"],
  "difficulty": "beginner | intermediate | advanced | varies",
  "format": "website | course | textbook | book | documentation | interactive | ebook | archive"
}
```

### Field Validation Rules

| Field | Required | Allowed Values |
|-------|----------|----------------|
| `id` | Yes | `res-NNN` (auto-increment) |
| `title` | Yes | Any string |
| `category` | Yes | See categories list |
| `subcategory` | Yes | Any string |
| `language` | Yes | `en`, `fr`, `sw`, `ar`, `multiple` |
| `url` | Yes | Valid HTTPS URL |
| `license` | Yes | Open license identifier |
| `addedDate` | Yes | `YYYY-MM-DD` |
| `addedBy` | Yes | GitHub username |
| `tags` | Yes | Array of lowercase strings |
| `difficulty` | Yes | `beginner`, `intermediate`, `advanced`, `varies` |
| `format` | Yes | See format list above |

### Valid Categories
1. `Computer Science & Software Engineering`
2. `Mathematics`
3. `Sciences`
4. `Humanities & Social Sciences`
5. `Open Source Tools & Platforms`

---

## 4. Contribution Workflow

### Step-by-Step Process

```
Fork → Clone → Branch → Edit → Commit → Push → Pull Request → Review → Merge
```

**1. Fork the Repository**
```bash
# On GitHub: click "Fork" button
# Then clone your fork:
git clone https://github.com/YOUR_USERNAME/BOSC-Community-Library.git
cd BOSC-Community-Library
```

**2. Add Upstream Remote**
```bash
git remote add upstream https://github.com/mylangiri/BOSC-Community-Library.git
git remote -v
```

**3. Sync Before Starting**
```bash
git fetch upstream
git checkout main
git merge upstream/main
```

**4. Create a Feature Branch**
```bash
git checkout -b add/resource-name
# or
git checkout -b fix/broken-link-res-003
# or
git checkout -b docs/improve-contributing
```

**5. Make Changes & Commit**
```bash
git add .
git commit -m "feat(resources): add Khan Academy Physics (res-017)"
```

**6. Push & Open PR**
```bash
git push origin your-branch-name
# Then open a Pull Request on GitHub
```

---

## 5. Branching Strategy

| Branch | Purpose | Protected |
|--------|---------|-----------|
| `main` | Production-ready content | Yes |
| `add/resource-name` | Adding a new resource | No |
| `fix/description` | Bug or broken link fix | No |
| `docs/description` | Documentation updates | No |
| `feat/description` | New features or structure | No |
| `chore/description` | Maintenance tasks | No |

---

## 6. Commit Message Conventions

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description>

[optional body]

[optional footer: Closes #issue-number]
```

**Types:**
| Type | Use Case |
|------|---------|
| `feat` | New resource or feature |
| `fix` | Bug fix or broken link |
| `docs` | Documentation changes |
| `chore` | Maintenance (metadata updates) |
| `refactor` | Structural changes without new content |
| `style` | Formatting, whitespace |

**Examples:**
```
feat(resources): add OpenStax Physics (res-017)
fix(resources): update broken URL for res-003
docs(readme): add jq query examples to getting started
chore(metadata): bump totalResources to 17
```

---

## 7. Issue & PR Management

### Issue Labels
| Label | Description |
|-------|-------------|
| `bug` | Broken links, incorrect metadata |
| `enhancement` | New resources or features |
| `documentation` | Docs improvements |
| `good first issue` | Suitable for newcomers |
| `help wanted` | Community assistance needed |
| `language:fr` | French content |
| `language:sw` | Swahili content |
| `language:ar` | Arabic content |
| `priority:high` | Urgent issues |

### PR Review Checklist (Maintainers)
- [ ] Resource URL is accessible
- [ ] License is open and compatible
- [ ] JSON is valid (no syntax errors)
- [ ] Metadata fields are complete
- [ ] `totalResources` count updated
- [ ] Language file updated
- [ ] `index.md` updated
- [ ] `addedDate` is correct
- [ ] Tags are lowercase and relevant

---

## 8. Language & Localization Guide

### Adding Resources in a New Language

1. Check if a language file exists in `resources/languages/`
2. If not, create `resources/languages/XX.md` (using ISO 639-1 code)
3. Add the resource to `resources.json` with the correct language code
4. Open an issue to discuss expanding language support

### Supported Language Codes
| Code | Language | Script |
|------|----------|--------|
| `en` | English | Latin |
| `fr` | French | Latin |
| `sw` | Swahili | Latin |
| `ar` | Arabic | Arabic (RTL) |

### Planned Language Expansions
- Portuguese (`pt`) — covers Brazil and Lusophone Africa
- Amharic (`am`) — Ethiopia
- Hausa (`ha`) — West Africa
- Yoruba (`yo`) — Nigeria

---

## 9. Quality Assurance

### Link Validation
Contributors should verify URLs before submission:
```bash
curl -I https://your-resource-url.com
# Should return HTTP 200
```

### JSON Validation
Before submitting, validate the JSON:
```bash
cat resources/databases/resources.json | python3 -m json.tool
# Should print formatted JSON without errors
```

### Resource Acceptance Criteria
1. ✅ Freely accessible (no paywall)
2. ✅ Open license explicitly stated
3. ✅ Educationally valuable
4. ✅ URL currently functional
5. ✅ Not a duplicate of existing resource
6. ✅ Appropriate for a general audience

---

## 10. Roadmap

### v1.3.0 (Next Release)
- [ ] Add search/filter functionality via GitHub Pages
- [ ] Automated link-checking via GitHub Actions
- [ ] Resource rating system
- [ ] Expand to 25+ resources

### v2.0.0 (Future)
- [ ] Full web interface with search
- [ ] API endpoint for resource database
- [ ] User submission portal
- [ ] Integration with institutional LMS platforms
- [ ] Offline download packages

### Long-term Vision
- 500+ curated resources across 10+ languages
- Partnerships with 20+ educational institutions
- Self-sustaining community with distributed maintainers
- Recognized as a reference resource for open education in Africa and beyond

---

*Documentation version: 1.0.0 | Last updated: 2026-05-17*
