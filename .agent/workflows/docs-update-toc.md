---
description: Update Table of Contents in all documentation README files
---

# Update Documentation TOC

This workflow regenerates Table of Contents in all README.md files based on
current documentation structure.

## Quick Update

1. Scan the `docs/` directory for all folders and files
2. Update each section's README.md with current file listings
3. Update the main `docs/README.md` with all section links

## Steps

### 1. Analyze Current Structure

First, list all documentation files:

```bash
find docs -name "*.md" -type f | sort
```

### 2. Update Section READMEs

For each section folder (e.g., `01-getting-started/`):

- List all `.md` files in the folder (excluding README.md)
- Generate TOC entries with links and descriptions
- Update the README.md Contents section

**Template for section TOC:**

```markdown
## Contents

- [Document Title](01-filename.md) - Brief description
- [Another Document](02-another.md) - Brief description
```

### 3. Update Main README

Update `docs/README.md` with links to all sections:

```markdown
## Documentation

- [Getting Started](01-getting-started/README.md) - Installation and setup
- [Architecture](02-architecture/README.md) - System design
- [Development](03-development/README.md) - Developer workflows
- [Deployment](04-deployment/README.md) - CI/CD and production
- [User Guide](05-user-guide/README.md) - End-user documentation
```

### 4. Validate Links

// turbo
After updating, verify all links work:

```bash
npx markdown-link-check docs/**/*.md
```

## Output

All README.md files will have updated Table of Contents reflecting the current
documentation structure.

## When to Run

Run this workflow after:

- Adding new documentation files
- Renaming or moving documents
- Deleting outdated documentation
- Reorganizing the docs structure
