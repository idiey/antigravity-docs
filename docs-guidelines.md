# Antigravity Docs - Documentation Guidelines

> Complete documentation standards for Google Antigravity/Gemini Code projects.

## Overview

This guide establishes documentation standards that ensure consistency, accessibility,
and maintainability across all projects using Antigravity.

## Core Principles

### 1. Context-Based Organization

Group documentation by major aspects of the project:

| Context | Purpose | Examples |
| ------- | ------- | -------- |
| `getting-started` | First-time setup | Installation, quick start, configuration |
| `architecture` | System design | Database, API, patterns, security |
| `development` | Developer workflow | Coding standards, testing, workflows |
| `deployment` | Operations | CI/CD, production, monitoring |
| `user-guide` | End-user docs | Role guides, tutorials, FAQs |
| `api` | API reference | Endpoints, schemas, examples |
| `testing` | Test documentation | Test plans, coverage, fixtures |
| `sprints` | Project management | Sprint plans, user stories |

### 2. Numbered Priority

Use numbered prefixes to indicate reading order and importance:

```text
docs/
├── 01-getting-started/    # Read first
├── 02-architecture/       # Read second
├── 03-development/        # Read third
└── 04-deployment/         # Read fourth
```

Within folders:

```text
01-getting-started/
├── 01-quick-start.md      # Read first
├── 02-installation.md     # Read second
└── 03-configuration.md    # Read third
```

### 3. Progressive Detail

Structure information from general to specific:

1. **README.md** - Overview and navigation
2. **01-overview.md** - Concepts and high-level design
3. **02-details.md** - Implementation specifics
4. **03-advanced.md** - Edge cases, optimization

### 4. Single Source of Truth

- All documentation lives in `/docs`
- No scattered markdown in project root (except README.md)
- Cross-reference rather than duplicate

### 5. Self-Documenting

- Every folder has a README.md
- README contains Table of Contents
- Clear navigation between sections

## File Naming Convention

### Folders

- Use numbered prefix: `01-`, `02-`, `03-`
- Use kebab-case: `getting-started`, not `gettingStarted`
- Keep names short but descriptive

### Files

- Use numbered prefix: `01-`, `02-`, `03-`
- Use kebab-case: `quick-start.md`, not `quickStart.md`
- Maximum 3-4 words after prefix
- Always use `.md` extension

### Examples

✅ **Good**:

- `01-getting-started/`
- `02-installation.md`
- `03-configuration.md`

❌ **Bad**:

- `GettingStarted/`
- `installation_guide.md`
- `howToConfigureTheSystem.md`

## Document Structure

### Standard Template

```markdown
# Document Title

> Brief one-line summary of this document.

## Overview

Introduction and context for this document.

## Prerequisites

What the reader needs to know or have before proceeding.

## Main Content

### Section 1

Content...

### Section 2

Content...

## Examples

Practical examples demonstrating concepts.

## Related Documents

- [Related Doc 1](../folder/doc.md)
- [Related Doc 2](../folder/doc.md)

## Troubleshooting

Common issues and solutions.

---

**Last Updated**: YYYY-MM-DD
```

### Section README Template

```markdown
# Section Name

## Overview

Brief description of what this section covers.

## Contents

- [Document 1](01-document.md) - Brief description
- [Document 2](02-document.md) - Brief description
- [Document 3](03-document.md) - Brief description

## Quick Links

- [Most Important Topic](01-document.md#section)
- [Common Task](02-document.md#section)

---

**Last Updated**: YYYY-MM-DD
```

## Markdown Standards

### Headers

- Use ATX-style headers (`#`, `##`, `###`)
- Only one H1 per document (the title)
- Don't skip levels (H1 → H3)
- Add blank line before and after headers

### Lists

- Use dashes (`-`) for unordered lists
- Use numbers (`1.`) for ordered lists
- Indent with 2 spaces
- Add blank line before lists

### Code Blocks

- Use fenced code blocks with language identifier
- Specify language for syntax highlighting

```javascript
// Good - has language identifier
const example = "code";
```

### Links

- Use relative paths for internal links
- Use descriptive link text
- Verify all links work

```markdown
<!-- Good -->
See the [installation guide](01-getting-started/02-installation.md)

<!-- Bad -->
Click [here](01-getting-started/02-installation.md)
```

### Tables

- Use markdown tables for structured data
- Align columns for readability
- Keep tables simple

```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Value 1  | Value 2  | Value 3  |
```

### Line Length

- Maximum 120 characters per line
- Exceptions: URLs, code blocks, tables

## Metadata

### Last Updated Date

Every document should have a footer:

```markdown
---

**Last Updated**: 2026-01-06
```

### Version Information

For versioned docs, include:

```markdown
---

**Last Updated**: 2026-01-06
**Version**: 1.0.0
```

## Quality Checklist

Before committing documentation:

- [ ] File follows naming convention
- [ ] Document has H1 title
- [ ] Includes "Last Updated" date
- [ ] All links are valid
- [ ] Code blocks have language identifiers
- [ ] Passes markdownlint
- [ ] Section README updated

## Linting

### Run Linter

```bash
# Check all docs
npx markdownlint-cli2 "docs/**/*.md"

# Auto-fix issues
npx markdownlint-cli2 --fix "docs/**/*.md"
```

### Common Linting Issues

| Issue | Rule | Fix |
| ----- | ---- | --- |
| Trailing spaces | MD009 | Remove trailing whitespace |
| Multiple blank lines | MD012 | Use single blank lines |
| Long lines | MD013 | Wrap at 120 characters |
| Missing language | MD040 | Add language to code blocks |
| Multiple H1 | MD025 | Use only one # per file |
| First line not H1 | MD041 | Start with # Title |

## Tools

### Required

- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2)

### Recommended

- [Markdown All in One][md-allinone] (VS Code)
- [markdownlint][md-lint-ext] (VS Code)

[md-allinone]: https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
[md-lint-ext]: https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint

## IDE Integration

### VS Code

Install the [markdownlint extension][md-lint-ext] for real-time linting.

Add to `.vscode/settings.json`:

```json
{
  "markdownlint.config": {
    "extends": ".markdownlint.json"
  },
  "editor.formatOnSave": true
}
```

### JetBrains IDEs

Install the **Markdown Navigator** plugin for IntelliJ, WebStorm, or PHPStorm.

### Vim/Neovim

Use ALE or similar linter plugin with markdownlint integration.

## Pre-commit Hooks

Auto-lint markdown files before commits to catch issues early.

### Bash (macOS/Linux)

Copy to `.git/hooks/pre-commit`:

```bash
#!/bin/bash
STAGED_MD=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$')

if [ -n "$STAGED_MD" ]; then
    echo "Linting markdown..."
    echo "$STAGED_MD" | xargs npx markdownlint-cli2
    if [ $? -ne 0 ]; then
        echo "❌ Fix issues or use: git commit --no-verify"
        exit 1
    fi
    echo "✅ Linting passed!"
fi
```

Make executable: `chmod +x .git/hooks/pre-commit`

### PowerShell (Windows)

See `examples/hooks/pre-commit.ps1` for Windows version.

## CI/CD Integration

Add to `.github/workflows/docs.yml`:

```yaml
name: Lint Documentation
on:
  push:
    paths: ['docs/**', '*.md']
  pull_request:
    paths: ['docs/**', '*.md']

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm install -g markdownlint-cli2
      - run: npx markdownlint-cli2 "docs/**/*.md"
```

---

**Last Updated**: 2026-01-09
**Version**: 1.1.0
