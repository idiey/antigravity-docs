---
description: Update antigravity-docs to the latest version
---

# /docs-update Workflow

Update the antigravity-docs package to the latest version.

## Steps

1. Detect the current installation:
   - Check `~/.gemini/workflows/` for global installation
   - Check `.agent/workflows/` for project-level installation

2. Check current version by looking for version comment in workflow files or `docs-guidelines.md`.

3. Fetch latest version info from GitHub:

```bash
# Get latest release info
curl -s https://api.github.com/repos/idiey/antigravity-docs/releases/latest
```

4. Compare versions and show what will be updated.

5. If update available, ask for confirmation.

6. Run the appropriate installer:

### Windows (PowerShell)

```powershell
# Global update
irm https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.ps1 -OutFile i.ps1
.\i.ps1 -Force
rm i.ps1

# Project update
irm https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.ps1 -OutFile i.ps1
.\i.ps1 -Project -Force
rm i.ps1
```

### macOS/Linux (Bash)

```bash
# Global update
curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash

# Project update
curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash -s -- --project
```

7. Report what was updated:
   - New workflows added
   - Existing workflows updated
   - Configuration changes

8. Suggest reviewing the changelog for breaking changes.
