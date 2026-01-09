---
description: Initialize a new docs folder structure following antigravity-docs standards
---

# Initialize Documentation Structure

This workflow creates a complete documentation structure for a new or existing project.

## Prerequisites

- Project directory exists
- `.markdownlint.json` configuration (will be created if missing)

## Steps

// turbo

1. Create the docs directory structure:

```bash
mkdir -p docs/01-getting-started docs/02-architecture docs/03-development \
  docs/04-deployment docs/05-user-guide
```

1. Create the main docs/README.md with project overview and navigation links.

2. Create README.md for each section folder with Table of Contents.

3. Create initial documents in each section:
   - `01-getting-started/01-quick-start.md`
   - `02-architecture/01-overview.md`
   - `03-development/01-coding-standards.md`
   - `04-deployment/01-overview.md`
   - `05-user-guide/01-introduction.md`

// turbo
5. Validate the structure with markdownlint:

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

## Output

After running this workflow, you will have:

```text
docs/
├── README.md                      # Main index
├── 01-getting-started/
│   ├── README.md                  # Section TOC
│   └── 01-quick-start.md          # Quick start guide
├── 02-architecture/
│   ├── README.md                  # Section TOC
│   └── 01-overview.md             # Architecture overview
├── 03-development/
│   ├── README.md                  # Section TOC
│   └── 01-coding-standards.md     # Coding standards
├── 04-deployment/
│   ├── README.md                  # Section TOC
│   └── 01-overview.md             # Deployment overview
└── 05-user-guide/
    ├── README.md                  # Section TOC
    └── 01-introduction.md         # User guide intro
```

## Customization

Add more sections as needed:

- `06-api/` - API documentation
- `07-testing/` - Testing guides
- `08-sprints/` - Sprint planning (for agile projects)
