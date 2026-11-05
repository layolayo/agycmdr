---
name: agycmdr
description: >-
  Search past Antigravity (agy) conversations, inspect live running agy sessions,
  and snapshot or restore workspace sessions using agycmdr (Antigravity Commander).
  Trigger whenever the user asks to search past conversations/transcripts, find a
  previous session or artifact, list currently running agy instances, or save/restore
  their agy workspace sessions.
---

# agycmdr — Antigravity Commander Skill

`agycmdr` is a zero-dependency CLI tool and Antigravity plugin for searching across all `~/.gemini/*/brain/` conversation transcripts and artifacts, inspecting live running `agy` processes via `/proc/<pid>/fd` lockfiles, and snapshotting/restoring workspace sessions across reboots.

## Available Commands

When executing commands from the agent (non-interactive shell), always pass `-n` (`--no-prompt`) to `list` or `search` so the command returns output immediately without waiting for interactive stdin.

### 1. List Active, Saved, and Recent Sessions
```bash
agycmdr list -n
```
*(If `agycmdr` is not yet in `~/.local/bin`, run `./install.sh --with-timer` from the plugin directory or invoke `bin/agycmdr` directly).*

### 2. Full-Text Search Across Past Conversations & Artifacts
```bash
# Search all user prompts, agent responses, thinking blocks, tool calls, and artifacts
agycmdr search -n "<query>"

# Search only user prompts and conversation titles
agycmdr search -n -u "<query>"

# Include subagent transcripts in search results
agycmdr search -n -a "<query>"
```

### 3. Snapshot Active Running Sessions
```bash
agycmdr save
```
Saves all currently running `agy` conversations, their `cwd`, titles, and (on Hyprland/Omarchy) their window workspaces to `~/.config/agy/workspaces.json`.

### 4. Restore Saved Sessions
```bash
agycmdr restore
```
Reopens all saved sessions in `~/.config/agy/workspaces.json` in their original working directories and workspaces, automatically skipping any sessions that are already running.

### 5. Manage Automatic Background Snapshots (`systemd --user` timer)
```bash
agycmdr auto-save --enable
agycmdr auto-save --status
agycmdr auto-save --disable
```
