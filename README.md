# agycmdr — Antigravity Commander

Unified CLI session manager, full-text transcript search engine, live process inspector, and workspace restorer for **Google Antigravity CLI (`agy`)**.

Works seamlessly across **Hyprland (Omarchy)** and **GNOME / standard Linux desktops (Ubuntu, Arch, Debian, Fedora)**. Zero external Python dependencies (uses only the Python 3 standard library, with automatic `ripgrep` acceleration when `rg` is available).

---

## Features

- **Interactive Session Dashboard (`agycmdr`)**:
  - Inspects `/proc/<pid>/fd` lockfiles (`presence/<uuid>.lock`) in real time to show which `agy` conversations are **currently live**, their PID, working directory (`cwd`), and workspace.
  - Lists your **saved workspace snapshots** (`~/.config/agy/workspaces.json`) and **recent conversations** from `~/.gemini/antigravity-cli/conversation_summaries.db`.
  - Press `1-N` to resume any session inline or `w <num>` to launch it in a new terminal window.
- **Full-Text Search Across Everything (`agycmdr search <query>` / `agy-search <query>`)**:
  - Searches user prompts (`USER_INPUT`), agent replies (`PLANNER_RESPONSE`), internal reasoning (`THINKING`), tool calls (`TOOL_CALL`), and markdown/code artifacts across all `~/.gemini/*/brain/` folders.
  - Highlights matched snippets in context and filters out noisy subagent threads by default (`-a` to include subagents, `-u` for user prompts only).
- **Workspace Snapshot & Restore (`agycmdr save` / `agycmdr restore` / `agy-restore`)**:
  - Snapshots all currently running `agy` sessions, their working directories, conversation titles, and (on Hyprland/Omarchy) their exact window workspaces.
  - Restores all saved sessions after a reboot without spawning duplicates if a session is already running.
  - Auto-detects your terminal emulator (`ghostty`, `gnome-terminal`, `kitty`, `alacritty`, `ptyxis`, `wezterm`, `foot`, or `$TERMINAL`).
- **Automatic Background Snapshots (`agycmdr auto-save --enable`)**:
  - Installs and enables a lightweight `systemd --user` timer (`agy-snapshot.timer`) that snapshots your active `agy` sessions every 2 minutes so your state is always preserved before a reboot or power-off.

---

## Installation

```bash
git clone https://github.com/layolayo/agycmdr.git
cd agycmdr
./install.sh --with-timer
```

Ensure `~/.local/bin` is in your `PATH`. The installer sets up `agycmdr` along with convenience symlinks (`agy-search`, `agy-restore`, `restore-agy-workspaces`, and `agyctl`).

---

## Usage

```bash
# Interactive dashboard (live sessions, saved snapshot, recent conversations)
agycmdr

# Full-text search across all conversations and artifacts
agycmdr search "invoice pdf"
agy-search "invoice pdf"          # Shorthand alias
agy-search -u "keybindings"       # Search only your own user prompts & titles

# Snapshot all currently running agy sessions to ~/.config/agy/workspaces.json
agycmdr save
agy-restore --save                # Shorthand alias

# Restore all saved agy sessions into their workspaces / terminal windows
agycmdr restore
agy-restore                       # Shorthand alias

# Manage automatic background saving (systemd user timer)
agycmdr auto-save --enable
agycmdr auto-save --status
agycmdr auto-save --disable
```

---

## License

MIT
