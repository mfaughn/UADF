# Changelog

All notable changes to the Universal Agentic Development Framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2026-02-17

### Added
- **Team Mode**: Optional multi-agent workflow with Dev and QA agents
  - `/uadf-team-on` to enable specialized agents
  - `/uadf-team-off` to return to single agent mode
  - Verbose logging shows agent coordination
- **Help Command**: `/uadf-help` for quick reference
- **Pre-flight Checks**: `/uadf-init` now checks for conflicts before proceeding
  - Detects existing UADF files
  - Warns about uncommitted git changes
  - Checks for CLAUDE.md conflicts
- **Install Script**: `install.sh` for easy setup on macOS/Linux

### Changed
- `/uadf-task` now checks for team mode and spawns agents accordingly
- Updated all documentation with team mode instructions
- Improved README with clearer installation instructions

## [2.0.0] - 2026-02-17

### Added
- Architecture Decision Records (ADRs) in `docs/adr/`
- `/uadf-adr` command to create ADRs
- Session handoff protocol with explicit template
- Definition of Done by task type
- Explicit rollback procedures (branch isolation + checkpoints)
- Git stash as secondary rollback method
- "Methods NOT to use" documentation

### Changed
- Clarified file purposes: spec.md (WHAT), blueprint.md (HOW), TASKS.md (WORK), JOURNAL.md (LOG)
- TDD is now embedded in task lifecycle, not a verification step
- Task states expanded: added CANCELLED, DEFERRED
- Version control protocol formalized

### Removed
- Vague "rollback" instruction replaced with explicit procedures

## [1.0.0] - 2026-02-17

### Added
- Initial framework based on Dylan Davis "Boring Rules"
- Core principles: Memory First, Fresh Starts, Hard Gates, TDD Enforcement
- Project file structure: CLAUDE.md, JOURNAL.md, ARCHITECTURE.md, spec.md, blueprint.md, TASKS.md
- Master Orchestration Prompt
- Integration of Claude Conductor document templates
- Integration of Superpowers agentic patterns

---

## Roadmap

### Planned for Future Releases
- [ ] Windows installation script (PowerShell)
- [ ] Project templates for common stacks (Next.js, FastAPI, etc.)
- [ ] Integration with GitHub Issues for task management
- [ ] Metrics/analytics for session productivity
- [ ] Custom agent definitions for team mode
