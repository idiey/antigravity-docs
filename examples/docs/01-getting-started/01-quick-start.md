# Quick Start

> Get up and running in 5 minutes or less.

## Overview

This guide will help you quickly set up and run the project for the first time.

## Prerequisites

Before you begin, ensure you have:

- Node.js 18+ installed
- Git installed
- A code editor (VS Code recommended)

## Steps

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/your-project.git
cd your-project
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment

```bash
cp .env.example .env
```

### 4. Run the Application

```bash
npm run dev
```

### 5. Open in Browser

Navigate to [http://localhost:3000](http://localhost:3000)

## What's Next?

- [Installation Guide](02-installation.md) - Detailed setup instructions
- [Configuration](03-configuration.md) - Environment configuration
- [Architecture Overview](../02-architecture/01-overview.md) - Understand the system

## Troubleshooting

### Port already in use

```bash
# Find and kill the process
lsof -i :3000
kill -9 <PID>
```

### Dependencies not installing

```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
```

---

**Last Updated**: 2026-01-06
