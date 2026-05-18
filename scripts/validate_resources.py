#!/usr/bin/env python3
"""
BOSC Community Library - Resource Database Validator
Usage: python3 scripts/validate_resources.py
"""

import json
import sys

VALID_LANGUAGES = {"en", "fr", "sw", "ar", "multiple"}
VALID_DIFFICULTIES = {"beginner", "intermediate", "advanced", "varies"}
VALID_FORMATS = {"website", "course", "textbook", "book", "documentation", "interactive", "ebook", "archive"}
REQUIRED_FIELDS = {"id", "title", "category", "subcategory", "language", "url", "license", "addedDate", "addedBy", "tags", "difficulty", "format"}

def validate(db_path="resources/databases/resources.json"):
    errors = []
    try:
        with open(db_path) as f:
            db = json.load(f)
    except json.JSONDecodeError as e:
        print(f"FATAL: Invalid JSON — {e}")
        sys.exit(1)

    resources = db.get("resources", [])
    metadata = db.get("metadata", {})
    actual = len(resources)
    declared = metadata.get("totalResources", -1)

    if actual != declared:
        errors.append(f"totalResources is {declared} but actual count is {actual}")

    seen_ids = set()
    for i, r in enumerate(resources, 1):
        prefix = f"[res {i} - {r.get('id','?')}]"
        for field in REQUIRED_FIELDS:
            if field not in r:
                errors.append(f"{prefix} Missing field: '{field}'")
        rid = r.get("id")
        if rid in seen_ids:
            errors.append(f"{prefix} Duplicate ID: {rid}")
        seen_ids.add(rid)
        if r.get("language") not in VALID_LANGUAGES:
            errors.append(f"{prefix} Invalid language: '{r.get('language')}'")
        if r.get("difficulty") not in VALID_DIFFICULTIES:
            errors.append(f"{prefix} Invalid difficulty: '{r.get('difficulty')}'")

    print(f"\nBOSC Validator - {actual} resources checked\n")
    if errors:
        for e in errors:
            print(f"ERROR: {e}")
        print("\nValidation FAILED\n")
        sys.exit(1)
    else:
        print("All validations PASSED!")

if __name__ == "__main__":
    validate()
