---
description: Audit documentation for completeness, accuracy, and synchronization with codebase
---

# Documentation Audit

This workflow audits your documentation for completeness and accuracy.

## Full Audit Checklist

### 1. Structure Check

Verify the docs structure follows the standard:

- [ ] `docs/README.md` exists with navigation
- [ ] All context folders have numbered prefixes (01-, 02-)
- [ ] Every folder has a README.md
- [ ] All files have numbered prefixes
- [ ] File names use kebab-case

### 2. Content Check

For each document verify:

- [ ] Starts with H1 header
- [ ] Has "Last Updated" date
- [ ] No broken internal links
- [ ] Code examples are current
- [ ] Screenshots are up-to-date (if any)

### 3. Code Synchronization

Compare documentation with codebase:

- [ ] API endpoints match routes
- [ ] Database schema matches migrations
- [ ] Configuration options are documented
- [ ] All user roles are documented
- [ ] Feature descriptions are accurate

### 4. Quality Check

// turbo

1. Run markdown linting:

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

// turbo
2. Check for broken links:

```bash
npx markdown-link-check docs/**/*.md
```

### 5. Completeness Matrix

Create a coverage report:

| Section | Status | Last Updated | Notes |
| ------- | ------ | ------------ | ----- |
| Getting Started | ✅ | YYYY-MM-DD | Complete |
| Architecture | 🔄 | YYYY-MM-DD | Needs ERD update |
| Development | ⚠️ | YYYY-MM-DD | Missing testing guide |
| Deployment | ✅ | YYYY-MM-DD | Complete |
| User Guide | 🔄 | YYYY-MM-DD | Role guides incomplete |

**Legend**: ✅ Complete | 🔄 In Progress | ⚠️ Needs Attention | ❌ Missing

## Output

After audit, create/update `docs/AUDIT_LOG.md` with findings and action items.
