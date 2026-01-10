---
description: Create or update daily achievement entry
---

# /plan-daily Workflow

Manage daily achievement tracking and work logs.

## Steps

1. Check if `docs/06-plan/01-daily/` folder exists. If not, suggest running `/plan-init` first.

2. Determine today's date in `YYYY-MM-DD` format.

3. Check for yesterday's daily log file to carry forward unfinished tasks.

4. If today's file doesn't exist, create it from the template:

**File:** `docs/06-plan/01-daily/YYYY-MM-DD.md`

```markdown
# Daily Log - YYYY-MM-DD

## Goals for Today

- [ ] Task from sprint/yesterday
- [ ] New task

## Achievements

- [x] Completed item (add as you work)

## In Progress

- Current work item
- Files being edited

## Blockers

- Any issues encountered

## Notes for Tomorrow

- Context for next session
- Things to remember

## Time Spent

- Feature X: 2h
- Meetings: 1h
```

5. If the file already exists:
   - Show current progress
   - Ask what to update (achievements, blockers, notes)
   - Update the file accordingly

6. At end of day, prompt to:
   - Mark completed tasks
   - Add notes for tomorrow
   - Create checkpoint if needed
