---
description: Create a checkpoint to resume work later
---

# /plan-checkpoint Workflow

Save or load work checkpoints for seamless work resumption.

## Steps

1. Check if `docs/06-plan/03-checkpoints/` folder exists. If not, suggest running `/plan-init` first.

2. Ask what to do:
   - **Save checkpoint** - Save current work state
   - **Load checkpoint** - Resume from saved state
   - **List checkpoints** - View all saved checkpoints

### Saving a Checkpoint

3. Ask for checkpoint name (e.g., "auth-feature", "bug-fix-123").

4. Gather context:
   - Currently open files
   - Recent changes made
   - Current task/goal
   - Next steps planned

5. Create checkpoint file:

**File:** `docs/06-plan/03-checkpoints/[name].md`

```markdown
# Checkpoint: [Name]

**Created:** YYYY-MM-DD HH:MM
**Status:** Active | Resumed | Completed

## Current State Summary

Brief description of where you are in the task.

## Files Modified

- `path/to/file1.ext` - Description of changes
- `path/to/file2.ext` - Description of changes

## Current Task

What you were working on when you stopped.

## Progress Made

- [x] Completed step 1
- [x] Completed step 2
- [ ] In progress step 3
- [ ] Not started step 4

## Next Steps

1. Immediate next action
2. Following action
3. Final steps

## Context for Resumption

Important things to remember:
- Design decisions made
- Gotchas discovered
- Dependencies or blockers

## Related Resources

- [PR/Issue link if applicable]
- [Documentation reference]
```

### Loading a Checkpoint

6. List available checkpoints with dates.
7. Load selected checkpoint and display:
   - Summary of where you left off
   - Files to open
   - Next steps to take
8. Mark checkpoint as "Resumed".

### Completing a Checkpoint

9. When work is done, mark checkpoint as "Completed".
10. Optionally update daily log with achievements.
