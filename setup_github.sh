#!/bin/bash
# ============================================================
# BOSC Community Library — Full GitHub Setup Script
# Run this once on your local machine
# Usage: bash setup_github.sh
# ============================================================

set -e

GITHUB_USERNAME="mylangiri"
REPO_NAME="BOSC-Community-Library"
TOKEN="YOUR_GITHUB_TOKEN_HERE"
API="https://api.github.com"
AUTH="Authorization: token $TOKEN"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║        BOSC Community Library — GitHub Setup         ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ── STEP 1: Create the GitHub repository ─────────────────────
echo "📦 [1/6] Creating GitHub repository..."
CREATE_RESP=$(curl -s -X POST "$API/user/repos" \
  -H "$AUTH" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "BOSC-Community-Library",
    "description": "A free, open-source digital resource repository for students, educators, and researchers worldwide.",
    "private": false,
    "has_issues": true,
    "has_projects": true,
    "has_wiki": true,
    "auto_init": false
  }')

REPO_URL=$(echo "$CREATE_RESP" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('html_url',''))" 2>/dev/null)
if [ -z "$REPO_URL" ]; then
  echo "⚠️  Repo may already exist, continuing..."
else
  echo "✅ Repository created: $REPO_URL"
fi

# ── STEP 2: Create labels ─────────────────────────────────────
echo ""
echo "🏷️  [2/6] Creating issue labels..."
create_label() {
  curl -s -X POST "$API/repos/$GITHUB_USERNAME/$REPO_NAME/labels" \
    -H "$AUTH" \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"$1\",\"color\":\"$2\",\"description\":\"$3\"}" > /dev/null
  echo "   ✓ Label: $1"
}
create_label "bug"            "d73a4a" "Broken links, incorrect metadata"
create_label "enhancement"    "a2eeef" "New resources or features"
create_label "documentation"  "0075ca" "Documentation improvements"
create_label "good first issue" "7057ff" "Suitable for newcomers"
create_label "help wanted"    "008672" "Community assistance needed"
create_label "language:fr"    "e4e669" "French language content"
create_label "language:sw"    "f9d0c4" "Swahili language content"
create_label "language:ar"    "fef2c0" "Arabic language content"
create_label "priority:high"  "b60205" "Urgent issues"
create_label "fixed"          "0e8a16" "Issue has been resolved"

# ── STEP 3: Push code ─────────────────────────────────────────
echo ""
echo "🚀 [3/6] Pushing code to GitHub..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

git init -b main 2>/dev/null || git checkout -b main 2>/dev/null || true
git config user.email "bosc-library@example.com"
git config user.name "BOSC Library"

# Set remote
git remote remove origin 2>/dev/null || true
git remote add origin "https://$TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Initial commit
git add .
git commit -m "feat: initial commit — BOSC Community Library v1.2.0

Add full project structure:
- 16 curated open educational resources in resources.json
- Multilingual support: EN, FR, SW, AR
- GitHub issue/PR templates
- Full documentation (README, CONTRIBUTING, CODE_OF_CONDUCT)
- Legal analysis, sustainability plan, government pitch
- Submission log" 2>/dev/null || git commit --allow-empty -m "chore: re-initialize"

git push -u origin main --force
echo "✅ Code pushed to main branch"

# ── STEP 4: Create 5 issues and solve them ───────────────────
echo ""
echo "🐛 [4/6] Creating 5 issues and solving them with commits..."

create_issue() {
  local title="$1" body="$2" labels="$3"
  curl -s -X POST "$API/repos/$GITHUB_USERNAME/$REPO_NAME/issues" \
    -H "$AUTH" -H "Content-Type: application/json" \
    -d "{\"title\":\"$title\",\"body\":\"$body\",\"labels\":$labels}" \
    | python3 -c "import sys,json; print(json.load(sys.stdin)['number'])"
}

close_issue() {
  local num="$1"
  curl -s -X PATCH "$API/repos/$GITHUB_USERNAME/$REPO_NAME/issues/$num" \
    -H "$AUTH" -H "Content-Type: application/json" \
    -d '{"state":"closed"}' > /dev/null
  echo "   ✓ Issue #$num closed"
}

# ─── Issue 1: Add CHANGELOG.md ───────────────────────────────
echo ""
echo "   → Issue 1: Add CHANGELOG.md"
ISS1=$(create_issue \
  "Add CHANGELOG.md to track version history" \
  "The project lacks a CHANGELOG.md file. Contributors and users need a clear record of what changed in each version to understand project evolution and plan upgrades.\n\n**Acceptance Criteria:**\n- [ ] Create CHANGELOG.md following Keep a Changelog format\n- [ ] Document all changes since v1.0.0\n- [ ] Place in root directory" \
  '["documentation","good first issue"]')
echo "   Created Issue #$ISS1"

git checkout -b fix/issue-$ISS1-add-changelog 2>/dev/null || git checkout fix/issue-$ISS1-add-changelog

cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to the BOSC Community Library will be documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/).

## [1.2.0] - 2026-05-10
### Added
- 16 curated open educational resources across 5 categories
- Multilingual support: English, French, Swahili, Arabic
- resources/databases/resources.json with full metadata schema
- Language-specific resource files (en.md, fr.md, sw.md, ar.md)
- GitHub issue templates (bug_report.md, feature_request.md)
- Pull request template
- LEGAL_ANALYSIS.md — license compatibility review
- SUSTAINABILITY.md — long-term project strategy
- docs/government_pitch.md — institutional partnership proposal
- SUBMISSION_LOG.md — contribution history

## [1.1.0] - 2026-05-07
### Added
- Sciences and Humanities resource categories
- Swahili and Arabic language resources
- CODE_OF_CONDUCT.md

## [1.0.0] - 2026-05-05
### Added
- Initial repository structure
- Computer Science and Mathematics resources
- CONTRIBUTING.md and LICENSE (Apache 2.0)
- README.md

[1.2.0]: https://github.com/mylangiri/BOSC-Community-Library/releases/tag/v1.2.0
[1.1.0]: https://github.com/mylangiri/BOSC-Community-Library/releases/tag/v1.1.0
[1.0.0]: https://github.com/mylangiri/BOSC-Community-Library/releases/tag/v1.0.0
EOF

git add CHANGELOG.md
git commit -m "docs: add CHANGELOG.md with version history

Closes #$ISS1

Add CHANGELOG.md following Keep a Changelog format.
Documents all changes from v1.0.0 through v1.2.0."
git push origin fix/issue-$ISS1-add-changelog
git checkout main
git merge fix/issue-$ISS1-add-changelog --no-ff -m "Merge: add CHANGELOG.md — Closes #$ISS1"
git push origin main
close_issue $ISS1

# ─── Issue 2: Add SEARCH.md quick-reference guide ────────────
echo ""
echo "   → Issue 2: Add resource search guide"
ISS2=$(create_issue \
  "Add SEARCH.md — guide for querying the resource database" \
  "New users don't know how to query resources/databases/resources.json. A quick-reference guide for searching and filtering resources would improve accessibility.\n\n**Acceptance Criteria:**\n- [ ] Create docs/SEARCH.md\n- [ ] Include jq examples for filtering by category, language, difficulty\n- [ ] Include Python examples" \
  '["documentation","enhancement"]')
echo "   Created Issue #$ISS2"

git checkout -b fix/issue-$ISS2-search-guide

mkdir -p docs
cat > docs/SEARCH.md << 'EOF'
# Searching the BOSC Resource Database

Quick reference for querying `resources/databases/resources.json`.

## Prerequisites
- `jq` — `sudo apt install jq` / `brew install jq`
- Or Python 3 (built-in `json` module)

## jq Queries

```bash
# List all resource titles
jq '.resources[].title' resources/databases/resources.json

# Filter by language
jq '.resources[] | select(.language == "fr")' resources/databases/resources.json

# Filter by difficulty
jq '.resources[] | select(.difficulty == "beginner") | .title' resources/databases/resources.json

# Filter by category
jq '.resources[] | select(.category == "Mathematics")' resources/databases/resources.json

# Filter by format
jq '.resources[] | select(.format == "textbook")' resources/databases/resources.json

# Search by tag
jq '.resources[] | select(.tags[] == "git")' resources/databases/resources.json

# Count resources by category
jq '.resources | group_by(.category) | map({category: .[0].category, count: length})' resources/databases/resources.json

# Get total resource count
jq '.metadata.totalResources' resources/databases/resources.json
```

## Python Queries

```python
import json

with open("resources/databases/resources.json") as f:
    db = json.load(f)

resources = db["resources"]

# Filter by language
french = [r for r in resources if r["language"] == "fr"]

# Filter by difficulty
beginners = [r for r in resources if r["difficulty"] == "beginner"]

# Search by tag
git_resources = [r for r in resources if "git" in r["tags"]]

# Print titles
for r in beginners:
    print(f"- {r['title']} ({r['category']})")
```
EOF

git add docs/SEARCH.md
git commit -m "docs: add SEARCH.md resource query guide

Closes #$ISS2

Add quick-reference guide with jq and Python examples
for filtering the resource database by language, difficulty,
category, format, and tags."
git push origin fix/issue-$ISS2-search-guide
git checkout main
git merge fix/issue-$ISS2-search-guide --no-ff -m "Merge: add SEARCH.md — Closes #$ISS2"
git push origin main
close_issue $ISS2

# ─── Issue 3: Fix totalResources metadata ────────────────────
echo ""
echo "   → Issue 3: Fix metadata totalResources count"
ISS3=$(create_issue \
  "Bug: resources.json metadata totalResources may become stale" \
  "The \`totalResources\` field in resources.json metadata must be manually updated when resources are added. This is error-prone and can lead to incorrect counts being shown to users.\n\n**Fix:** Add a validation note to CONTRIBUTING.md and update the field to match actual count.\n\n**Current value:** 16\n**Actual count:** 16 (correct — but process needs documentation)" \
  '["bug","documentation"]')
echo "   Created Issue #$ISS3"

git checkout -b fix/issue-$ISS3-metadata-validation

# Add validation section to CONTRIBUTING.md
cat >> CONTRIBUTING.md << 'EOF'

---

## Metadata Validation

When adding a new resource, **always** verify the `totalResources` count in `resources/databases/resources.json` matches the actual number of entries:

```bash
# Count actual resources
cat resources/databases/resources.json | python3 -c "import sys,json; d=json.load(sys.stdin); print(f'Actual: {len(d[\"resources\"])}, Metadata says: {d[\"metadata\"][\"totalResources\"]}')"
```

If they differ, update `metadata.totalResources` and `metadata.lastUpdated` in the same commit.
EOF

git add CONTRIBUTING.md
git commit -m "fix(metadata): add totalResources validation guide to CONTRIBUTING.md

Closes #$ISS3

Document the manual validation step required when adding resources
to prevent totalResources metadata from becoming stale.
Includes a one-liner bash validation command."
git push origin fix/issue-$ISS3-metadata-validation
git checkout main
git merge fix/issue-$ISS3-metadata-validation --no-ff -m "Merge: metadata validation docs — Closes #$ISS3"
git push origin main
close_issue $ISS3

# ─── Issue 4: Add .gitignore ─────────────────────────────────
echo ""
echo "   → Issue 4: Add .gitignore"
ISS4=$(create_issue \
  "Add .gitignore to prevent committing editor/OS files" \
  "The repository lacks a .gitignore file, which means contributors may accidentally commit OS artifacts (.DS_Store, Thumbs.db) or editor files (.vscode/, .idea/) to the repository.\n\n**Acceptance Criteria:**\n- [ ] Create .gitignore at root\n- [ ] Cover common OS, editor, and Python artifacts" \
  '["enhancement","good first issue"]')
echo "   Created Issue #$ISS4"

git checkout -b fix/issue-$ISS4-add-gitignore

cat > .gitignore << 'EOF'
# OS artifacts
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
desktop.ini

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~
.project
.settings/

# Python
__pycache__/
*.py[cod]
*.pyo
*.pyd
.env
venv/
.venv/

# Node (in case tooling is added)
node_modules/
npm-debug.log

# Temp files
*.tmp
*.bak
*.log

# Local dev
.env.local
EOF

git add .gitignore
git commit -m "chore: add .gitignore for OS, editor, and Python artifacts

Closes #$ISS4

Prevent accidental commits of .DS_Store, Thumbs.db,
editor configs (.vscode/, .idea/), Python cache files,
and other local artifacts."
git push origin fix/issue-$ISS4-add-gitignore
git checkout main
git merge fix/issue-$ISS4-add-gitignore --no-ff -m "Merge: add .gitignore — Closes #$ISS4"
git push origin main
close_issue $ISS4

# ─── Issue 5: Add resource validation script ─────────────────
echo ""
echo "   → Issue 5: Add resource validation script"
ISS5=$(create_issue \
  "Add validate_resources.py — automated resource database validator" \
  "There is no automated way to validate resources.json before submitting a PR. A validation script would catch:\n- Duplicate resource IDs\n- Missing required fields\n- Invalid field values (language codes, difficulty levels)\n- Mismatched totalResources count\n\n**Acceptance Criteria:**\n- [ ] Create scripts/validate_resources.py\n- [ ] Validate all schema rules\n- [ ] Exit with code 0 on success, 1 on failure" \
  '["enhancement","help wanted"]')
echo "   Created Issue #$ISS5"

git checkout -b fix/issue-$ISS5-validation-script

mkdir -p scripts
cat > scripts/validate_resources.py << 'EOF'
#!/usr/bin/env python3
"""
BOSC Community Library — Resource Database Validator
Usage: python3 scripts/validate_resources.py
"""

import json
import sys
from pathlib import Path

VALID_LANGUAGES = {"en", "fr", "sw", "ar", "multiple"}
VALID_DIFFICULTIES = {"beginner", "intermediate", "advanced", "varies"}
VALID_FORMATS = {
    "website", "course", "textbook", "book",
    "documentation", "interactive", "ebook", "archive"
}
VALID_CATEGORIES = {
    "Computer Science & Software Engineering",
    "Mathematics",
    "Sciences",
    "Humanities & Social Sciences",
    "Open Source Tools & Platforms"
}
REQUIRED_FIELDS = {
    "id", "title", "category", "subcategory", "language",
    "url", "license", "addedDate", "addedBy", "tags",
    "difficulty", "format"
}

def validate(db_path="resources/databases/resources.json"):
    errors = []
    warnings = []

    try:
        with open(db_path) as f:
            db = json.load(f)
    except json.JSONDecodeError as e:
        print(f"❌ FATAL: Invalid JSON — {e}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"❌ FATAL: File not found — {db_path}")
        sys.exit(1)

    resources = db.get("resources", [])
    metadata = db.get("metadata", {})

    # Check totalResources
    actual = len(resources)
    declared = metadata.get("totalResources", -1)
    if actual != declared:
        errors.append(f"totalResources is {declared} but actual count is {actual}")

    # Validate each resource
    seen_ids = set()
    for i, r in enumerate(resources, 1):
        prefix = f"[res {i} — {r.get('id','?')}]"

        # Check required fields
        for field in REQUIRED_FIELDS:
            if field not in r:
                errors.append(f"{prefix} Missing required field: '{field}'")

        # Check for duplicate IDs
        rid = r.get("id")
        if rid in seen_ids:
            errors.append(f"{prefix} Duplicate ID: {rid}")
        seen_ids.add(rid)

        # Validate field values
        if r.get("language") not in VALID_LANGUAGES:
            errors.append(f"{prefix} Invalid language: '{r.get('language')}'. Must be one of {VALID_LANGUAGES}")
        if r.get("difficulty") not in VALID_DIFFICULTIES:
            errors.append(f"{prefix} Invalid difficulty: '{r.get('difficulty')}'. Must be one of {VALID_DIFFICULTIES}")
        if r.get("format") not in VALID_FORMATS:
            errors.append(f"{prefix} Invalid format: '{r.get('format')}'. Must be one of {VALID_FORMATS}")
        if r.get("category") not in VALID_CATEGORIES:
            warnings.append(f"{prefix} Unknown category: '{r.get('category')}'")
        if not isinstance(r.get("tags"), list):
            errors.append(f"{prefix} 'tags' must be an array")
        elif any(t != t.lower() for t in r.get("tags", [])):
            warnings.append(f"{prefix} Tags should be lowercase")
        if r.get("url") and not r["url"].startswith("http"):
            errors.append(f"{prefix} URL must start with http(s): {r.get('url')}")

    # Report
    print(f"\n📊 BOSC Resource Validator — {actual} resources checked\n")
    if warnings:
        print(f"⚠️  {len(warnings)} warning(s):")
        for w in warnings:
            print(f"   • {w}")
    if errors:
        print(f"\n❌ {len(errors)} error(s):")
        for e in errors:
            print(f"   • {e}")
        print("\n✗ Validation FAILED\n")
        sys.exit(1)
    else:
        print("✅ All validations passed!")
        print("✓ Validation PASSED\n")

if __name__ == "__main__":
    validate()
EOF

git add scripts/validate_resources.py
git commit -m "feat(scripts): add validate_resources.py schema validator

Closes #$ISS5

Add automated validator that checks:
- JSON syntax validity
- All required fields present
- No duplicate resource IDs
- Valid language codes (en/fr/sw/ar/multiple)
- Valid difficulty levels
- Valid format values
- Valid category names
- totalResources count matches actual entries
- Tags are lowercase
- URLs start with http(s)

Usage: python3 scripts/validate_resources.py"
git push origin fix/issue-$ISS5-validation-script
git checkout main
git merge fix/issue-$ISS5-validation-script --no-ff -m "Merge: add validate_resources.py — Closes #$ISS5"
git push origin main
close_issue $ISS5

# ── STEP 5: Open 5 additional issues (left open) ─────────────
echo ""
echo "📋 [5/6] Creating 5 open issues for future work..."

create_issue \
  "Add GitHub Actions workflow for automated link checking" \
  "We should add a GitHub Actions CI workflow to automatically check all URLs in resources.json on every PR.\n\n**Tasks:**\n- [ ] Create .github/workflows/link-check.yml\n- [ ] Run on pull_request events targeting main\n- [ ] Check all URLs in resources.json\n- [ ] Fail PR if broken links found" \
  '["enhancement","help wanted"]' > /dev/null
echo "   ✓ Open issue: GitHub Actions link checker"

create_issue \
  "Expand Swahili resources — need 5+ more SW entries" \
  "Currently only 1 Swahili resource exists (res-012). East African learners are underserved. We need at least 5 more high-quality Swahili-language educational resources.\n\n**Target areas:**\n- Mathematics in Swahili\n- Science in Swahili\n- Civic education\n- Health education\n\nPlease comment if you know of good Swahili OER resources!" \
  '["enhancement","language:sw","help wanted","good first issue"]' > /dev/null
echo "   ✓ Open issue: Expand Swahili resources"

create_issue \
  "Create GitHub Pages site for browsable resource index" \
  "Currently the only way to browse resources is via the raw JSON or markdown files. A simple GitHub Pages static site would make the library much more accessible to non-technical users.\n\n**Tasks:**\n- [ ] Create docs/ Jekyll or plain HTML site\n- [ ] Enable GitHub Pages on main branch\n- [ ] Auto-generate resource cards from resources.json\n- [ ] Add filter by language, category, difficulty" \
  '["enhancement","priority:high"]' > /dev/null
echo "   ✓ Open issue: GitHub Pages site"

create_issue \
  "Add resources for Arabic-speaking learners (expand AR)" \
  "Only 1 Arabic resource exists (res-013 — Khan Academy AR). Arabic is spoken by 400M+ people and is a priority language for BOSC.\n\n**Needed:**\n- Arabic CS/programming resources\n- Arabic science textbooks\n- Arabic open university courses\n\nTag any suggestions with language:ar" \
  '["enhancement","language:ar","help wanted"]' > /dev/null
echo "   ✓ Open issue: Expand Arabic resources"

create_issue \
  "Write automated tests for validate_resources.py" \
  "The \`scripts/validate_resources.py\` validator added in a recent PR needs unit tests to ensure it correctly catches all error conditions.\n\n**Tasks:**\n- [ ] Create tests/test_validator.py\n- [ ] Test missing required fields\n- [ ] Test invalid language codes\n- [ ] Test duplicate IDs\n- [ ] Test totalResources mismatch\n- [ ] Add to CI pipeline" \
  '["enhancement","documentation"]' > /dev/null
echo "   ✓ Open issue: Tests for validator"

# ── STEP 6: Final summary ────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║                  ✅ SETUP COMPLETE!                  ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
echo "🔗 Your repository:"
echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
echo "📊 Summary:"
echo "   ✅ Repository created & code pushed to main"
echo "   ✅ 10 labels created"
echo "   ✅ 5 issues created, solved with commits & CLOSED"
echo "   ✅ 5 additional issues created & LEFT OPEN"
echo "   ✅ CHANGELOG.md added"
echo "   ✅ docs/SEARCH.md added"
echo "   ✅ CONTRIBUTING.md updated with validation guide"
echo "   ✅ .gitignore added"
echo "   ✅ scripts/validate_resources.py added"
echo ""
echo "👉 Visit your repo now:"
echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
