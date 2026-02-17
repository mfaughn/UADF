# UADF - Universal Agentic Development Framework

A structured workflow for AI-assisted development that enforces documentation-first planning, TDD, and explicit version control.

**Version:** 2.1.0

## What is UADF?

UADF is a set of Claude Code skills and templates that turn AI coding assistants into a disciplined engineering process. It prevents common pitfalls like:

- Starting to code before understanding requirements
- Losing context between sessions
- Forgetting what you were working on
- Skipping tests
- Making changes directly on main branch

## Key Features

- **Documentation-first**: Interview process creates `spec.md` before any code is written
- **Hard gates**: No implementation until `blueprint.md` is approved
- **TDD-embedded workflow**: RED → GREEN → REFACTOR with checkpoint commits
- **Session handoffs**: Never lose context between sessions with `JOURNAL.md`
- **Architecture Decision Records**: Document the "why" behind technical choices
- **Optional Team Mode**: Specialized Dev and QA agents for built-in code review

## Quick Start

### Installation

**Option 1: Install Script (macOS/Linux)**

```bash
git clone https://github.com/mfaughn/UADF.git
cd UADF
./install.sh
```

**Option 2: Manual Installation**

See [Manual Installation](#manual-installation) below.

### Usage

Start a new project:
```
/uadf-init my-project-name
```

Resume work on an existing project:
```
/uadf-start
```

Get help:
```
/uadf-help
```

## Commands

| Command | Description |
|---------|-------------|
| `/uadf-init [name]` | Initialize a new UADF project |
| `/uadf-start` | Start or resume a session |
| `/uadf-task [desc]` | Start a task with TDD lifecycle |
| `/uadf-handoff` | Write session handoff to JOURNAL.md |
| `/uadf-adr [title]` | Create an Architecture Decision Record |
| `/uadf-team-on` | Enable agent team mode |
| `/uadf-team-off` | Disable agent team mode |
| `/uadf-help` | Show quick reference help |

## Project Files Created

When you run `/uadf-init`, these files are created:

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Project instructions (build commands, conventions) |
| `spec.md` | **WHAT** we're building (requirements, acceptance criteria) |
| `blueprint.md` | **HOW** we'll build it (implementation plan, must be approved) |
| `TASKS.md` | Current work items with statuses |
| `JOURNAL.md` | Session handoffs, decisions, blockers |
| `ARCHITECTURE.md` | System design, component structure |
| `docs/adr/` | Architecture Decision Records |

## Workflow

```
┌─────────────────────────────────────────────────────────────┐
│                    NEW PROJECT                               │
│  /uadf-init → Interview → spec.md → blueprint.md → APPROVE  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    EACH SESSION                              │
│  /uadf-start → Status Report → Work → /uadf-handoff         │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    EACH TASK                                 │
│  /uadf-task → Branch → RED → GREEN → REFACTOR → Merge       │
└─────────────────────────────────────────────────────────────┘
```

## Team Mode

By default, UADF uses a single Claude agent. Enable **team mode** for specialized agents:

| Agent | Role |
|-------|------|
| **You** | Team Lead — approve/reject, make decisions |
| **Dev** | Implements tasks following TDD |
| **QA** | Reviews implementations, suggests improvements |

```
/uadf-team-on   # Enable
/uadf-team-off  # Disable
```

Team mode uses ~2-3x more tokens but provides built-in code review and educational value.

## Manual Installation

If the install script doesn't work for your system:

### 1. Create directories

```bash
mkdir -p ~/.claude/uadf/templates
mkdir -p ~/.claude/commands
```

### 2. Copy files

```bash
# From the cloned repo directory:
cp commands/*.md ~/.claude/commands/
cp templates/*.md ~/.claude/uadf/templates/
cp docs/framework.md ~/.claude/uadf/
cp docs/usage.md ~/.claude/uadf/README.md
```

### 3. Update global CLAUDE.md

Add the contents of `claude-md-snippet.md` to your `~/.claude/CLAUDE.md` file:

```bash
cat claude-md-snippet.md >> ~/.claude/CLAUDE.md
```

Or manually add it if you want to place it in a specific location within the file.

## Requirements

- [Claude Code](https://docs.anthropic.com/claude-code) CLI tool
- Git (for version control features)
- A project using npm/node (for default test commands, but can be customized)

## Documentation

- [Usage Guide](docs/usage.md) - Detailed usage instructions
- [Framework Reference](docs/framework.md) - Core principles and protocols

## Core Principles

1. **Memory Lives in Files** — Chat is ephemeral; files are permanent
2. **Hard Gates** — No code until blueprint is approved
3. **TDD is the Path** — Every feature starts with a failing test
4. **Branch Isolation** — All work on feature branches
5. **Fresh Starts** — New session every 20-25 messages, handoff before ending

## Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Follow the UADF workflow (of course!)
4. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE)

## Acknowledgments

UADF integrates ideas from:

- [Dylan Davis](https://www.youtube.com/@dylanjdavis) - "Boring Rules" methodology
- [Claude Conductor](https://github.com/superbasicstudio/claude-conductor) - Document templates
- [Superpowers](https://github.com/obra/superpowers) - Agentic skills patterns

## Version History

See [CHANGELOG.md](CHANGELOG.md)
