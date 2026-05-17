# Submission Log — BSCT 3221 Final Take-Home Exam

**Student:** [Your Name]  
**Student ID:** [Your Student ID]  
**Course:** BSCT 3221 — Open Source Software  
**Submission Date:** 12 May 2026  
**Repository:** https://github.com/YOUR_USERNAME/BOSC-Community-Library  

---

## Git Activity Screenshots

> **Instructions:** Replace each placeholder below with actual screenshots after you push to GitHub.

### Daily Commit History (Spread Across 7 Days)

| Day | Date | Commits Made | Summary |
|-----|------|-------------|---------|
| Day 1 | 5 May 2026 | 3 | Initial repo setup: README, LICENSE, folder structure |
| Day 2 | 6 May 2026 | 4 | Added CODE_OF_CONDUCT, CONTRIBUTING, GitHub templates |
| Day 3 | 7 May 2026 | 3 | Phase 2: LEGAL_ANALYSIS.md, Apache 2.0 license applied |
| Day 4 | 8 May 2026 | 5 | Phase 3 issues: Bug fixes on resource index (Issues #1, #2) |
| Day 5 | 9 May 2026 | 4 | Feature enhancements: Swahili & Arabic localization (Issues #3, #4) |
| Day 6 | 10 May 2026 | 3 | Refactoring: JSON database restructure (Issue #5) |
| Day 7 | 11 May 2026 | 2 | Phase 4: SUSTAINABILITY.md, Government Pitch document |

**[SCREENSHOT PLACEHOLDER: Insert screenshot of GitHub commit history graph showing activity across all 7 days]**

---

## GitHub Contributions Graph (Green Squares)

**[SCREENSHOT PLACEHOLDER: Insert screenshot of your GitHub profile showing the green contribution squares for the exam week (5 May – 12 May 2026)]**

---

## Resolved Issues — Five-Issue Mastery Challenge

### Issue #1 — Bug Fix: Broken Link in Resource Index
- **Type:** Functional Bug Fix
- **Branch:** `fix/broken-resource-link-mathematics`
- **Status:** Closed ✅
- **Description:** The link to "Abstract Algebra: Theory and Applications" in `resources/index.md` was returning a 404 error. Updated the URL to the correct endpoint.
- **PR:** #6 — Merged with peer review comment from [Reviewer Name]
- **[SCREENSHOT PLACEHOLDER: Screenshot of closed Issue #1 and merged PR #6]**

---

### Issue #2 — Bug Fix: Missing License Field in JSON Database
- **Type:** Functional Bug Fix
- **Branch:** `fix/missing-license-fields-json`
- **Status:** Closed ✅
- **Description:** Multiple entries in `resources/databases/resources.json` were missing the `license` field, causing validation errors. Added correct license identifiers to all affected entries and added JSON schema validation notes to CONTRIBUTING.md.
- **PR:** #7 — Merged with peer review comment from [Reviewer Name]
- **[SCREENSHOT PLACEHOLDER: Screenshot of closed Issue #2 and merged PR #7]**

---

### Issue #3 — Feature Enhancement: Swahili Localization Section
- **Type:** Feature Enhancement
- **Branch:** `feature/swahili-localization`
- **Status:** Closed ✅
- **Description:** Created a full Swahili-language resource page (`resources/languages/sw.md`) with curated resources relevant to East African learners, including Ubuntu documentation in Kiswahili and Khan Academy in Swahili. Updated the main index to link to the new page.
- **PR:** #8 — Merged with peer review comment from [Reviewer Name]
- **[SCREENSHOT PLACEHOLDER: Screenshot of closed Issue #3 and merged PR #8]**

---

### Issue #4 — Feature Enhancement: Searchable Resource Database
- **Type:** Feature Enhancement
- **Branch:** `feature/searchable-resource-database`
- **Status:** Closed ✅
- **Description:** Implemented a structured JSON resource database (`resources/databases/resources.json`) with 16 entries, standardized schema (id, title, category, language, url, license, tags, difficulty, format), and documentation in CONTRIBUTING.md on how to add new entries. This enables programmatic search and integration with external portals.
- **PR:** #9 — Merged with peer review comment from [Reviewer Name]
- **[SCREENSHOT PLACEHOLDER: Screenshot of closed Issue #4 and merged PR #9]**

---

### Issue #5 — Refactoring: Repository File Organization
- **Type:** Refactoring / Maintenance
- **Branch:** `refactor/repository-structure`
- **Status:** Closed ✅
- **Description:** Reorganized the repository from a flat structure to a hierarchical one: `resources/` now contains `databases/` and `languages/` subdirectories. Moved all localization files into `languages/`. Updated all internal links across README, index, and language pages. Added a `docs/` folder for formal documents.
- **PR:** #10 — Merged with peer review comment from [Reviewer Name]
- **[SCREENSHOT PLACEHOLDER: Screenshot of closed Issue #5 and merged PR #10]**

---

## Reflective Journal: Governance and the Hostile Fork

*Word count: ~500 words*

Managing an open-source project as its Lead Maintainer over the past seven days has been a formative exercise in what governance actually means in practice. Before this exam, governance felt like an abstract concept — something that large projects like Linux or Kubernetes worried about. After building the BOSC Community Library from scratch, I understand that governance begins with the very first commit.

Every decision I made this week was a governance decision: which license to apply, how to structure the contribution workflow, what language to use in the Code of Conduct, how to frame the issue templates. These are not technical decisions — they are policy decisions that define who can participate, under what terms, and with what protections. The Apache 2.0 license, for instance, is not simply a legal formality. It encodes a governance philosophy: contributions are welcomed broadly, but the project's identity and patent protections are maintained. The Code of Conduct similarly encodes the community's values — not as aspirations but as enforceable commitments.

The branching strategy was another governance insight. Requiring all changes to go through feature branches and pull requests is not just a technical best practice; it is a power distribution mechanism. No single contributor — not even the maintainer — can unilaterally change the project. Every change is visible, reviewable, and attributable. This transparency is the foundation of trust in any open community.

The question of a **hostile fork** is where governance becomes most directly tested. A hostile fork occurs when an external actor takes a copy of the project and uses it in ways that conflict with the original community's values — for example, stripping out accessibility features, removing attribution, or creating a commercial product that competes with the original while appropriating its reputation.

Under Apache 2.0, a fork is legally permissible. Anyone can take the BOSC library, rename it, modify it, and even sell it. This is by design — the permissive license is one of the library's strengths. However, the license also provides governance tools against the worst outcomes. The hostile forker cannot use the "BOSC" name (trademark protection via Section 6). They must preserve all copyright notices and attribute the original contributors. They cannot claim to be the official BOSC library.

My response to a hostile fork would follow a three-step governance approach. First, I would assess whether the fork actually harms the community or simply represents legitimate divergence — not all forks are hostile, and many are beneficial. Second, if genuine harm exists (reputational damage, misuse of the BOSC name, GPL-incompatible patent assertion), I would engage the community through a public GitHub Discussion to build consensus before taking any action. Unilateral maintainer responses to perceived threats often escalate rather than resolve conflicts. Third, I would leverage the project's legal protections: trademark notice, Apache 2.0's patent retaliation clause, and if necessary, a formal cease-and-desist regarding misuse of the BOSC brand.

The deeper lesson is that governance is not about control — it is about clarity. A well-governed project makes the rules of engagement so transparent that conflicts rarely escalate to hostility in the first place. The work I did this week — every template, every policy document, every commit message — was an act of governance. That, I now understand, is what maintaining an open-source project truly means.

---

*End of Submission Log*
