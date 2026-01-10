---
description: Initialize the docs/06-plan folder structure for project planning
---

# /plan-init Workflow

Initialize the `docs/06-plan/` folder structure to enable daily tracking, sprint planning, and checkpoints.

## Steps

1. Check if `docs/` folder exists. If not, suggest running `/docs-init` first.

2. Create the `docs/06-plan/` folder structure:

```text
docs/
└── 06-plan/
    ├── README.md
    ├── 01-daily/
    │   ├── README.md
    │   └── TEMPLATE.md
    ├── 02-sprints/
    │   ├── README.md
    │   └── TEMPLATE.md
    ├── 03-checkpoints/
    │   ├── README.md
    │   └── TEMPLATE.md
    └── 04-antigravity/
        ├── README.md
        ├── implementation-plans/
        ├── walkthroughs/
        └── todo/
```

3. Create `docs/06-plan/README.md` with the following content:

```markdown
# Project Planning

This folder contains project planning documents managed by Antigravity.

## Structure

- **[01-daily/](01-daily/)** - Daily achievement logs
- **[02-sprints/](02-sprints/)** - Sprint planning documents
- **[03-checkpoints/](03-checkpoints/)** - Work resumption checkpoints
- **[04-antigravity/](04-antigravity/)** - AI-generated artifacts

## Quick Commands

| Command | Description |
|---------|-------------|
| `/plan-daily` | Create or update daily log |
| `/plan-sprint` | Manage sprint planning |
| `/plan-checkpoint` | Save/load work checkpoint |

## Getting Started

1. Run `/plan-daily` to create today's entry
2. Use `/plan-checkpoint` to save your work state
3. Create sprints with `/plan-sprint`
```

4. Create template files for each subfolder following the examples in `examples/docs/06-plan/`.

5. Update `docs/README.md` to include a link to the new planning section.

6. Report completion to the user.

