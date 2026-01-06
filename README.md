# Antigravity Docs

> Global documentation standards and tooling for Google Antigravity/Gemini Code projects.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

This package provides a standardized structure, linting, and automation for creating consistent, high-quality documentation in projects using **Google Antigravity** (Gemini Code).

## Features

- 📁 **Numbered Folder Structure** - Context-based organization with priority numbering
- ✅ **Automated Linting** - Built-in markdown linting with markdownlint
- ⚡ **Slash Commands** - `/docs`, `/docs-init`, `/docs-lint`, `/docs-audit` for easy management
- 📊 **Progressive Detail** - Information architecture from overview to specifics
- 🔄 **CI/CD Ready** - GitHub Actions integration examples
- 📖 **Self-Documenting** - Each folder has README.md with TOC

## What's Included

```
antigravity-docs/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── install.ps1                  # PowerShell installer (Windows)
├── install.sh                   # Bash installer (macOS/Linux)
├── docs-guidelines.md           # Full documentation standards
├── .markdownlintrc              # Linter configuration
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
irm https://raw.githubusercontent.com/YOUR_USERNAME/antigravity-docs/main/install.ps1 | iex
```

### macOS / Linux (Bash)

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/antigravity-docs/main/install.sh | bash
```

### Manual Install

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/antigravity-docs.git
cd antigravity-docs
```

2. Run the installer:

**Windows:**
```powershell
.\install.ps1
```

**macOS/Linux:**
```bash
chmod +x install.sh
./install.sh
```

3. Verify installation:
```bash
ls -la ~/.gemini/
# Should see: workflows/, docs-guidelines.md, .markdownlintrc
```

## What Gets Installed

The installer copies these files to your Antigravity configuration directory:

| File | Location | Purpose |
|------|----------|---------|
| `docs-guidelines.md` | `~/.gemini/` | Full documentation standards |
| `.markdownlintrc` | `~/.gemini/` | Linter configuration |
| `docs.md` | `~/.gemini/workflows/` | Main `/docs` slash command |
| `docs-init.md` | `~/.gemini/workflows/` | `/docs-init` slash command |
| `docs-lint.md` | `~/.gemini/workflows/` | `/docs-lint` slash command |
| `docs-audit.md` | `~/.gemini/workflows/` | `/docs-audit` slash command |

## Usage

### Available Slash Commands

After installation, use these commands in your Antigravity prompts:

| Command | Description |
|---------|-------------|
| `/docs` | View documentation standards, templates, and best practices |
| `/docs-init` | Initialize a new docs folder structure in your project |
| `/docs-lint` | Run markdown linting on your documentation |
| `/docs-audit` | Audit documentation for completeness and accuracy |

### Creating Documentation

Simply ask Antigravity:

```
/docs-init - Create the docs structure for my project
```

### Linting Documentation

```
/docs-lint - Check my documentation for issues and fix them
```

### Auditing Documentation

```
/docs-audit - Check if my docs are complete and synchronized with the codebase
```

## Documentation Structure

The standard structure follows this pattern:

```
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

## Key Principles

1. **Context-Based Organization** - Group by major aspects (architecture, development, deployment)
2. **Numbered Priority** - Folders and files numbered by importance (01-, 02-, 03-)
3. **Progressive Detail** - Start with overview, drill into specifics
4. **Single Source of Truth** - All docs in `docs/` directory
5. **Self-Documenting** - Each folder has README.md with TOC

## Linting Rules

The `.markdownlintrc` enforces these standards:

| Rule | Setting | Description |
|------|---------|-------------|
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

```
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
