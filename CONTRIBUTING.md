# Contributing to Antigravity Docs

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Issues

1. Check existing [issues](https://github.com/YOUR_USERNAME/antigravity-docs/issues) first
2. Create a new issue with a clear title and description
3. Include examples and steps to reproduce (for bugs)

### Suggesting Enhancements

1. Open an issue describing the enhancement
2. Explain the use case and benefits
3. Wait for feedback before starting work

### Submitting Changes

1. **Fork the repository**

   ```bash
   git clone https://github.com/YOUR_USERNAME/antigravity-docs.git
   cd antigravity-docs
   ```

2. **Create a feature branch**

   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**

   - Follow the documentation standards
   - Update relevant documentation
   - Test your changes

4. **Lint your changes**

   ```bash
   npx markdownlint-cli2 "**/*.md"
   ```

5. **Commit your changes**

   ```bash
   git commit -m "feat: description of your changes"
   ```

6. **Push and create Pull Request**

   ```bash
   git push origin feature/your-feature-name
   ```

## Coding Standards

### Markdown

- Follow the `.markdownlintrc` rules
- Use ATX-style headers (`#`)
- Use dash-style lists (`-`)
- Include language identifiers in code blocks
- Keep prose lines under 120 characters

### File Naming

- Use kebab-case: `01-getting-started.md`
- Use numbered prefixes: `01-`, `02-`, `03-`

## Commit Message Format

Use conventional commits:

- **feat:** New feature or file
- **fix:** Bug fix
- **docs:** Documentation changes
- **refactor:** Code restructuring
- **chore:** Maintenance tasks

## Development Setup

1. Clone the repository
2. Install dependencies: `npm install -g markdownlint-cli2`
3. Run installer locally: `.\install.ps1` (Windows) or `./install.sh` (macOS/Linux)

## Review Process

Pull requests will be reviewed for:

- **Quality** - Clear, well-written documentation
- **Standards** - Follows project conventions
- **Testing** - Changes have been tested

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing! 🎉
