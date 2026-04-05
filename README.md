# write-well

`write-well` is an editor-first AI skill for rewriting prose with judgment.

It rewrites writing for clarity, force, flow, and voice, then briefly explains the key editorial moves behind the rewrite.

## What it does

- rewrites prose instead of just critiquing it
- cuts clutter and AI-sounding filler
- makes language more concrete
- improves flow and sentence emphasis
- preserves voice rather than sanding everything flat
- explains the main edits in a short, editorial rationale

## Included artifacts

- `skills/write-well/` — canonical Codex/OpenAI skill package
- `.claude/commands/write-well.md` — Claude Code project-local command wrapper

## Modes

- `rewrite`
- `light`
- `standard`
- `aggressive`
- `flow`
- `polish`
- `cut`

Default behavior: rewrite the text and explain the key edits briefly.

## Install in Codex / OpenAI

Copy or symlink `skills/write-well/` into:

```bash
${CODEX_HOME:-$HOME/.codex}/skills/write-well
```

Then invoke:

```text
$write-well
```

## Install in Claude Code

Copy `.claude/commands/write-well.md` into either:

- `~/.claude/commands/write-well.md`
- or your project's `.claude/commands/write-well.md`

Then invoke:

```text
/write-well
/write-well flow
/write-well aggressive
```

## Example invocation

```text
Use $write-well to rewrite this paragraph so it sounds sharper and less generic.
```

## Notes

The local source books used to design the skill are not included in this repo.
