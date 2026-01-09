---
description: Create and manage documentation following antigravity-docs standards
---

# Documentation Standards Workflow

This workflow helps you create, manage, and validate documentation following the
antigravity-docs standards - a context-based organization with numbered priority folders.

## Quick Commands

### Create New Documentation Structure

To initialize a new docs structure in any project:

1. Create the base docs folder structure:

```text
docs/
├── README.md
├── 01-getting-started/
│   └── README.md
├── 02-architecture/
│   └── README.md
├── 03-development/
│   └── README.md
├── 04-deployment/
│   └── README.md
└── 05-user-guide/
    └── README.md
```

1. Each folder README.md should contain a Table of Contents for that section.

2. Use numbered prefixes for files within each folder (01-, 02-, 03-).

---

## Documentation Principles

### 1. Context-Based Organization

Group documentation by major aspects:

- **getting-started**: Installation, quick start, configuration
- **architecture**: System design, patterns, database, API
- **development**: Coding standards, workflows, testing
- **deployment**: CI/CD, production, monitoring
- **user-guide**: Role-specific guides, tutorials

### 2. Numbered Priority

- Folders: `01-`, `02-`, `03-` (by importance/reading order)
- Files: `01-overview.md`, `02-details.md`, `03-advanced.md`

### 3. Progressive Detail

- Start with overview (README.md)
- Drill into specifics (numbered files)
- Link between related documents

### 4. Single Source of Truth

- All documentation lives in `/docs`
- No scattered markdown files in root
- Consistent cross-referencing

### 5. Self-Documenting

- Every folder has a README.md
- README contains TOC and brief descriptions
- Clear navigation between sections

---

## Linting Documentation

// turbo

1. Run markdown linter to check for issues:

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

// turbo
2. Auto-fix linting issues:

```bash
npx markdownlint-cli2 --fix "docs/**/*.md"
```

---

## Creating New Documentation

### Add a New Context (Folder)

1. Create folder with numbered prefix: `06-new-context/`
2. Create README.md with section overview
3. Update main docs/README.md with link to new section

### Add a New Document

1. Create file with numbered prefix: `01-document-name.md`
2. Start with H1 header matching the topic
3. Add "Last Updated" date at bottom
4. Update section README.md with link

---

## File Naming Convention

- Use kebab-case: `01-quick-start.md`
- Always include numbered prefix
- Keep names descriptive but concise
- Maximum 3-4 words after prefix

---

## Template: Section README.md

```markdown
# [Section Name]

## Overview

Brief description of what this section covers.

## Contents

- [Document 1](01-document-name.md) - Brief description
- [Document 2](02-another-doc.md) - Brief description

## Quick Links

Link to related sections or external resources.

---

**Last Updated**: YYYY-MM-DD
```

---

## Template: Document Structure

```markdown
# Document Title

> Brief one-line summary of this document

## Overview

Introduction and context.

## Main Content

### Subsection 1

Content...

### Subsection 2

Content...

## Related Documents

- [Related Doc 1](../section/doc.md)
- [Related Doc 2](../section/doc.md)

---

**Last Updated**: YYYY-MM-DD
```
