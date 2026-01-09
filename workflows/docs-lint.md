---
description: Lint and fix markdown documentation files
---

# Lint Documentation

This workflow validates and auto-fixes markdown documentation.

## Quick Lint

// turbo

1. Check all documentation for issues:

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

## Auto-Fix Issues

// turbo
2. Automatically fix common issues:

```bash
npx markdownlint-cli2 --fix "docs/**/*.md"
```

## Lint Specific Section

// turbo
3. Lint only a specific section (replace section name):

```bash
npx markdownlint-cli2 "docs/01-getting-started/**/*.md"
```

## Common Issues and Fixes

| Issue | Rule | Fix |
| ----- | ---- | --- |
| Trailing spaces | MD009 | Auto-fixable |
| Multiple blank lines | MD012 | Auto-fixable |
| Long lines (>120 chars) | MD013 | Wrap text manually |
| Missing language in code block | MD040 | Add language after ``` |
| Multiple H1 headers | MD025 | Use only one # per file |
| First line not H1 | MD041 | Start file with # Header |

## Configuration

The `.markdownlint.json` file controls linting rules. Key settings:

```json
{
  "MD013": { "line_length": 120 },
  "MD033": { "allowed_elements": ["br", "details", "summary"] }
}
```
