# Contributing to BOSC Community Library

Thank you for your interest in contributing! This document provides detailed technical instructions for external contributors. Please read it carefully before making your first contribution.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Development Workflow](#development-workflow)
3. [Branching Strategy](#branching-strategy)
4. [Commit Message Guidelines](#commit-message-guidelines)
5. [Pull Request Process](#pull-request-process)
6. [Issue Reporting](#issue-reporting)
7. [Code and Content Standards](#code-and-content-standards)
8. [Review Process](#review-process)
9. [Community Standards](#community-standards)

---

## Getting Started

### 1. Fork the Repository

Click the **Fork** button at the top-right of the repository page to create your own copy.

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_USERNAME/BOSC-Community-Library.git
cd BOSC-Community-Library
```

### 3. Add Upstream Remote

```bash
git remote add upstream https://github.com/ORIGINAL_OWNER/BOSC-Community-Library.git
git remote -v  # Verify remotes
```

### 4. Sync With Upstream Before Starting Work

```bash
git fetch upstream
git checkout main
git merge upstream/main
```

---

## Development Workflow

We follow a **feature branch workflow**. All changes must be made on a dedicated branch — **never commit directly to `main`**.

```
main  ←  feature/your-feature-name
      ←  fix/your-bug-description
      ←  refactor/your-refactor-name
      ←  docs/your-docs-update
```

---

## Branching Strategy

| Branch Prefix | Purpose | Example |
|---|---|---|
| `feature/` | New features or enhancements | `feature/swahili-localization` |
| `fix/` | Bug fixes | `fix/broken-resource-link` |
| `refactor/` | Code/content restructuring | `refactor/reorganize-index` |
| `docs/` | Documentation updates only | `docs/update-readme` |
| `hotfix/` | Critical emergency fixes on main | `hotfix/missing-license-header` |

### Creating a Branch

```bash
git checkout -b feature/your-feature-name
```

---

## Commit Message Guidelines

We follow the **Conventional Commits** specification. Every commit message must follow this format:

```
<type>(<scope>): <short description>

[optional body]

[optional footer]
```

### Types

| Type | When to Use |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation changes only |
| `refactor` | Code restructuring (no new feature or bug fix) |
| `style` | Formatting, missing semicolons, etc. (no logic change) |
| `test` | Adding or updating tests |
| `chore` | Maintenance tasks (updating dependencies, etc.) |

### Examples

```
feat(resources): add Swahili localization index page
fix(index): correct broken hyperlink to mathematics resources
docs(contributing): add branching strategy section
refactor(database): restructure JSON schema for better query performance
```

### Rules

- Use the **imperative mood** ("add" not "added", "fix" not "fixed")
- Keep the subject line under **72 characters**
- Reference issue numbers in the footer: `Closes #12`
- Do not end the subject line with a period

---

## Pull Request Process

### Before Submitting

- [ ] Sync your branch with upstream/main
- [ ] Test your changes locally
- [ ] Ensure your commit messages follow our guidelines
- [ ] Self-review your own diff

### Submitting

1. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
2. Open a Pull Request against the `main` branch of this repository.
3. Fill in the **Pull Request Template** completely.
4. Link the relevant issue(s) using GitHub keywords (e.g., `Closes #5`).

### After Submitting

- Respond to reviewer comments promptly (within 48 hours if possible).
- Make requested changes on the same branch — this updates the PR automatically.
- Do **not** force-push after a review has started, as it erases review context.
- Once approved, a maintainer will **squash and merge** your PR.

---

## Issue Reporting

### Before Opening an Issue

- Search existing issues to avoid duplicates.
- Check if the problem exists on the latest version of `main`.

### Bug Reports

Use the **Bug Report** issue template. Include:
- A clear, descriptive title
- Steps to reproduce
- Expected vs. actual behavior
- Screenshots if applicable

### Feature Requests

Use the **Feature Request** issue template. Include:
- The problem you are trying to solve
- Your proposed solution
- Any alternatives you considered

---

## Code and Content Standards

### Markdown Files

- Use ATX-style headings (`#`, `##`, `###`)
- Use fenced code blocks with language identifiers (` ```bash `, ` ```json `)
- Keep line length under 120 characters where possible
- Add a blank line before and after headings, lists, and code blocks

### JSON Files (Resource Database)

- Format with 2-space indentation
- All keys must be in `camelCase`
- Required fields per resource entry: `id`, `title`, `category`, `language`, `url`, `license`, `addedDate`

Example:
```json
{
  "id": "res-001",
  "title": "Introduction to Open Source",
  "category": "Software Engineering",
  "language": "en",
  "url": "https://opensource.guide",
  "license": "CC-BY-4.0",
  "addedDate": "2026-05-05"
}
```

### Resource Index (`resources/index.md`)

- New resources must be added in alphabetical order within their category.
- Every link must be verified as active before submitting.
- Specify the license for each resource.

---

## Review Process

All contributions are reviewed by at least **one maintainer** before merging. Reviews focus on:

- Technical correctness
- Adherence to content standards
- Alignment with project goals
- Quality of documentation

We aim to review PRs within **5 business days**. If you haven't heard back in 7 days, please comment on the PR as a friendly ping.

---

## Community Standards

All contributors are expected to follow our [Code of Conduct](CODE_OF_CONDUCT.md). By contributing, you agree that your contributions will be licensed under the project's **Apache License 2.0**.

---

Thank you for helping make the BOSC Community Library better for everyone!
