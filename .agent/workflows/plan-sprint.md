---
description: Create or manage sprint planning documents
---

# /plan-sprint Workflow

Manage sprint planning, goals, and retrospectives.

## Steps

1. Check if `docs/06-plan/02-sprints/` folder exists. If not, suggest running `/plan-init` first.

2. List existing sprints and ask what to do:
   - Create new sprint
   - View current sprint
   - Update sprint tasks
   - Close sprint (retrospective)

### Creating a New Sprint

3. Determine the next sprint number.

4. Create sprint file from template:

**File:** `docs/06-plan/02-sprints/sprint-XX.md`

```markdown
# Sprint XX

**Duration:** YYYY-MM-DD to YYYY-MM-DD
**Status:** Active | Completed

## Sprint Goals

1. Primary goal
2. Secondary goal

## User Stories / Tasks

### Must Have

- [ ] Critical feature
- [ ] Bug fix

### Should Have

- [ ] Important feature

### Nice to Have

- [ ] Enhancement

## Completion Criteria

- [ ] All must-have items completed
- [ ] Tests passing
- [ ] Documentation updated

## Daily Progress

### Day 1 (YYYY-MM-DD)
- Completed: X
- Blocked: Y

## Sprint Retrospective

### What Went Well
-

### What Could Improve
-

### Action Items for Next Sprint
-
```

### Updating Sprint

5. Show current tasks and their status.
6. Allow marking tasks as complete, adding new tasks, or updating blockers.

### Closing Sprint

7. Prompt for retrospective notes.
8. Calculate completion percentage.
9. Archive sprint and carry forward unfinished items to next sprint.
