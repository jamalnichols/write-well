---
description: Rewrite prose with editorial judgment
argument-hint: [light|standard|aggressive|flow|polish|cut]
disable-model-invocation: true
---

Use the canonical `write-well` skill materials in this project to rewrite the user's prose and explain the key edits briefly.

Read these files before responding:

- `/Users/user/Desktop/VSCode/empty/skills/write-well/SKILL.md`
- `/Users/user/Desktop/VSCode/empty/skills/write-well/references/doctrine.md`
- `/Users/user/Desktop/VSCode/empty/skills/write-well/references/anti-slop.md` when the prose feels generic, synthetic, hypey, bureaucratic, or AI-written
- `/Users/user/Desktop/VSCode/empty/skills/write-well/references/flow-and-emphasis.md` when the prose is dense, structurally muddy, or the user invokes `flow`
- `/Users/user/Desktop/VSCode/empty/skills/write-well/examples/rationale-examples.md` if you need to calibrate the explanation style

Interpret `$ARGUMENTS` as the editing mode.

Default to `rewrite standard` when no argument is supplied.

Return output in this format:

## Rewritten version

[full rewritten text]

## Why I rewrote it this way

- [editorial reason]
- [editorial reason]
- [editorial reason]

## Optional note

Only include this when it adds value.
