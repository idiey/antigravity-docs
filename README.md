# Antigravity Docs

> Global documentation standards and tooling for Google Antigravity/Gemini Code projects.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

This package provides a standardized structure, linting, and automation for creating
consistent, high-quality documentation in projects using **Google Antigravity** (Gemini Code).

## Features

- 📁 **Numbered Folder Structure** - Context-based organization with priority numbering
- ✅ **Automated Linting** - Built-in markdown linting with markdownlint
- ⚡ **Slash Commands** - `/docs`, `/docs-init`, `/docs-lint`, `/docs-audit` for easy management
- 📊 **Progressive Detail** - Information architecture from overview to specifics
- 🔄 **CI/CD Ready** - GitHub Actions integration examples
- 📖 **Self-Documenting** - Each folder has README.md with TOC

## What's Included

```text
antigravity-docs/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── install.ps1                  # PowerShell installer (Windows)
├── install.sh                   # Bash installer (macOS/Linux)
├── docs-guidelines.md           # Full documentation standards
├── .markdownlint.json           # Linter configuration
├── workflows/                   # Antigravity workflow files
│   ├── docs.md                  # Main /docs command
│   ├── docs-init.md             # /docs-init command
│   ├── docs-lint.md             # /docs-lint command
│   └── docs-audit.md            # /docs-audit command
└── examples/                    # Example documentation structures
    └── docs/                    # Sample docs folder
```

## Quick Install

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.ps1 -OutFile i.ps1; .\i.ps1 -Project; rm i.ps1
```

### macOS / Linux (Bash)

```bash
curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash -s -- --project
```

### Manual Install

1. Clone the repository:

```bash
git clone https://github.com/idiey/antigravity-docs.git
cd antigravity-docs
```

1. Run the installer:

**Windows:**

```powershell
.\install.ps1
```

**macOS/Linux:**

```bash
chmod +x install.sh
./install.sh
```

1. Verify installation:

```bash
ls -la ~/.gemini/
# Should see: workflows/, docs-guidelines.md, .markdownlintrc
```

## What Gets Installed

The installer copies these files to your Antigravity configuration directory:

### Default Installation

| File | Location | Purpose |
| ---- | -------- | ------- |
| `docs-guidelines.md` | `~/.gemini/` | Full documentation standards |
| `.markdownlint.json` | `~/.gemini/` | Linter configuration |
| `docs.md` | `~/.gemini/workflows/` | Main `/docs` slash command |
| `docs-init.md` | `~/.gemini/workflows/` | `/docs-init` slash command |
| `docs-lint.md` | `~/.gemini/workflows/` | `/docs-lint` slash command |
| `docs-audit.md` | `~/.gemini/workflows/` | `/docs-audit` slash command |
| `docs-update-toc.md` | `~/.gemini/workflows/` | `/docs-update-toc` slash command |
| `docs-update.md` | `~/.gemini/workflows/` | `/docs-update` slash command |

### Optional: Planning Workflows (with `-Plan` flag)

| File | Location | Purpose |
| ---- | -------- | ------- |
| `plan-init.md` | `~/.gemini/workflows/` | `/plan-init` slash command |
| `plan-daily.md` | `~/.gemini/workflows/` | `/plan-daily` slash command |
| `plan-sprint.md` | `~/.gemini/workflows/` | `/plan-sprint` slash command |
| `plan-checkpoint.md` | `~/.gemini/workflows/` | `/plan-checkpoint` slash command |


## Usage

### Available Slash Commands

After installation, use these commands in your Antigravity prompts:

#### Documentation Commands (Default)

| Command | Description |
| ------- | ----------- |
| `/docs` | View documentation standards, templates, and best practices |
| `/docs-init` | Initialize a new docs folder structure in your project |
| `/docs-lint` | Run markdown linting on your documentation |
| `/docs-audit` | Audit documentation for completeness and accuracy |
| `/docs-update-toc` | Update Table of Contents in all README files |
| `/docs-update` | Update antigravity-docs to the latest version |

#### Planning Commands (Optional)

> Install with `-Plan` flag or run `/plan-init` to enable these commands.

| Command | Description |
| ------- | ----------- |
| `/plan-init` | Initialize the `.plan` folder structure |
| `/plan-daily` | Create or update daily achievement entry |
| `/plan-sprint` | Create or manage sprint planning documents |
| `/plan-checkpoint` | Create a checkpoint to resume work later |

### Creating Documentation

Simply ask Antigravity:

```text
/docs-init - Create the docs structure for my project
```

### Linting Documentation

```text
/docs-lint - Check my documentation for issues and fix them
```

### Auditing Documentation

```text
/docs-audit - Check if my docs are complete and synchronized with the codebase
```

## Daily Developer Workflow

Here's how to use both `/docs` and `/plan` commands in your daily work:

### Morning: Start of Day

```text
/plan-daily - Show me what I was working on yesterday and what's planned for today
```

Antigravity reads yesterday's entry and creates today's file with:

- Yesterday's unfinished tasks
- Today's goals from sprint
- Context to resume work

### Mid-Morning: Resume Coding

```text
/plan-checkpoint - Load my last checkpoint for the authentication feature
```

Antigravity provides:

- Files you were editing
- Current progress
- Next steps to continue

### Afternoon: Adding Documentation

```text
/docs - I need to document the new OAuth integration
```

Antigravity uses documentation standards to help write proper docs.

### Late Afternoon: Code Review

```text
/docs-audit - Check if my documentation is complete and matches the code
```

Antigravity scans `docs/` folder and validates against codebase.

### End of Day: Wrap Up

```text
/plan-checkpoint - Save my current work state for tomorrow
```

Creates a checkpoint with what's completed, in progress, and context for resumption.

```text
/plan-daily - Update my achievements for today
```

Updates today's daily log with completed tasks and notes for tomorrow.

### Weekly: Sprint Planning

```text
/plan-sprint - Create sprint 2 planning
```

Creates a new sprint document with goals and tasks for next week.


## Documentation Structure

The standard structure follows this pattern:

```text
docs/
├── README.md                    # Main documentation index
├── 01-getting-started/          # Priority 1
│   ├── README.md                # Section TOC
│   ├── 01-quick-start.md
│   ├── 02-installation.md
│   └── 03-configuration.md
├── 02-architecture/             # Priority 2
│   ├── README.md
│   ├── 01-overview.md
│   ├── 02-database.md
│   └── 03-api.md
├── 03-development/              # Priority 3
│   ├── README.md
│   ├── 01-coding-standards.md
│   ├── 02-workflows.md
│   └── 03-testing.md
├── 04-deployment/               # Priority 4
│   ├── README.md
│   └── 01-overview.md
└── 05-user-guide/               # Priority 5
    ├── README.md
    └── 01-introduction.md
```

## Planning Structure (Optional)

When using the `/plan-init` command, this structure is added to your `docs/` folder:

```text
docs/
├── ...existing folders...
└── 06-plan/                       # Project planning (optional)
    ├── README.md                  # Index and quick reference
    ├── 01-daily/                  # Daily achievement logs
    │   ├── README.md              # Folder overview
    │   ├── TEMPLATE.md            # Template for daily entries
    │   └── 2026-01-10.md          # Example: today's entry
    ├── 02-sprints/                # Sprint planning
    │   ├── README.md              # Sprint overview
    │   ├── TEMPLATE.md            # Sprint template
    │   └── sprint-01.md           # Example sprint
    ├── 03-checkpoints/            # Work resumption points
    │   ├── README.md              # Checkpoint overview
    │   ├── TEMPLATE.md            # Checkpoint template
    │   └── checkpoint-01.md       # Example checkpoint
    └── 04-antigravity/            # Antigravity-generated artifacts
        ├── README.md              # Overview
        ├── implementation-plans/  # Implementation plans
        ├── walkthroughs/          # Completed work walkthroughs
        └── todo/                  # Suggested todo items
```


## Key Principles

1. **Context-Based Organization** - Group by major aspects (architecture, development, deployment)
2. **Numbered Priority** - Folders and files numbered by importance (01-, 02-, 03-)
3. **Progressive Detail** - Start with overview, drill into specifics
4. **Single Source of Truth** - All docs in `docs/` directory
5. **Self-Documenting** - Each folder has README.md with TOC

## Linting Rules

The `.markdownlint.json` enforces these standards:

| Rule | Setting | Description |
| ---- | ------- | ----------- |
| MD003 | ATX style | Headers use `#` syntax |
| MD004 | Dash style | Use `-` for unordered lists |
| MD007 | 2-space indent | Consistent indentation |
| MD013 | 120 char limit | Line length (excludes code/tables) |
| MD025 | Enabled | Single H1 per document |
| MD040 | Enabled | Fenced code blocks need language |
| MD041 | Enabled | First line should be H1 |

### Manual Linting

```bash
# Install markdownlint
npm install -g markdownlint-cli2

# Lint all markdown
npx markdownlint-cli2 "docs/**/*.md"

# Auto-fix issues
npx markdownlint-cli2 --fix "docs/**/*.md"
```

## Requirements

- [Node.js](https://nodejs.org/) 16+ (for markdownlint)
- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) (`npm install -g markdownlint-cli2`)
- Google Antigravity / Gemini Code IDE

## CI/CD Integration

### GitHub Actions

Add to `.github/workflows/docs.yml`:

```yaml
name: Lint Documentation

on:
  push:
    paths:
      - 'docs/**'
  pull_request:
    paths:
      - 'docs/**'

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

## Project-Level Installation

To install workflows directly into a project (instead of globally):

```bash
# Copy workflows to project
mkdir -p .agent/workflows
cp -r workflows/* .agent/workflows/

# Copy linter config to project root
cp .markdownlintrc .markdownlintrc
```

This allows per-project customization and version control of documentation standards.

## Customization

### Custom Linting Rules

Edit `.markdownlintrc` to customize rules:

```json
{
  "MD013": {
    "line_length": 100,
    "code_blocks": false
  }
}
```

### Custom Documentation Contexts

Add more numbered folders as needed:

```text
docs/
├── ...
├── 06-api/
├── 07-testing/
├── 08-sprints/
└── 09-maintenance/
```

## Troubleshooting

### Workflows not recognized

Ensure files are in the correct location:

- Global: `~/.gemini/workflows/`
- Project: `.agent/workflows/`

### Linter not found

Install markdownlint:

```bash
npm install -g markdownlint-cli2
```

### Permission issues (macOS/Linux)

```bash
chmod +x install.sh
./install.sh
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'feat: add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Support

- 📖 Check [Documentation](docs-guidelines.md)
- 🐛 Report issues on [GitHub Issues](https://github.com/YOUR_USERNAME/antigravity-docs/issues)
- 💬 Discussions on [GitHub Discussions](https://github.com/YOUR_USERNAME/antigravity-docs/discussions)

## Changelog

### v1.0.0 (2026-01-06)

- Initial release
- Four slash commands: `/docs`, `/docs-init`, `/docs-lint`, `/docs-audit`
- Windows PowerShell and Bash installers
- markdownlint configuration
- GitHub Actions example
- Documentation structure templates

---

**Inspired by**: [claude-docs](https://github.com/nasrulhazim/claude-docs) by @nasrulhazim

**Created for**: Google Antigravity / Gemini Code IDE
