# Search Guide — BOSC Community Library

This guide explains how to search and navigate resources in this library.

## Searching the JSON Database

The resource database is located at `resources/databases/resources.json`.

### Fields You Can Search By

| Field | Description | Example |
|-------|-------------|---------|
| `category` | Subject area | `"Mathematics"` |
| `language` | Resource language | `"Swahili"` |
| `difficulty` | Level | `"Beginner"` |
| `format` | Type of resource | `"Video"` |
| `license` | License type | `"CC-BY"` |
| `tags` | Keywords | `["algebra", "open"]` |

## How to Search Manually

1. Open `resources/databases/resources.json`
2. Use `Ctrl+F` to search by keyword
3. Filter by `category`, `language`, or `difficulty`

## Programmatic Search

Run the validation script to check all entries:

```bash
python scripts/validate_resources.py
```

## Adding New Resources

Follow the schema defined in `CONTRIBUTING.md` before submitting a PR.