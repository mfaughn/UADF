## UADF (Universal Agentic Development Framework)

When I invoke any `/uadf-*` skill or say "use UADF", follow the framework defined in `~/.claude/uadf/framework.md`.

**Core Rules:**
- Memory lives in files, not chat history
- No implementation until `blueprint.md` is approved
- All work on feature branches with checkpoint commits
- TDD lifecycle: RED -> GREEN -> REFACTOR
- Session handoff before ending (20-25 message limit)

**Skills:**
- `/uadf-init` - Initialize new project with UADF
- `/uadf-start` - Begin/resume a session
- `/uadf-task` - Start a task with TDD lifecycle
- `/uadf-handoff` - Write session handoff
- `/uadf-adr` - Create Architecture Decision Record
- `/uadf-team-on` - Enable agent team mode
- `/uadf-team-off` - Disable agent team mode
- `/uadf-help` - Show quick reference
