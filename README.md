# Proof Preview

Offline LaTeX proof preview for studying math with Codex.

The app is a local HTML viewer with bundled KaTeX. Codex writes the latest proof into `current-proof.js`, and the terminal command opens or prints the viewer link.

## Install

From this project directory:

```bash
./install.sh
```

This installs:

- `proof-preview` command at `~/.local/bin/proof-preview`
- a project-local `current-proof.js` proof slot if it does not already exist

The commands open:

```text
file:///path/to/proof-preview/index.html
```

The bare `index.html` page opens the current proof in full view. An open viewer tab watches `current-proof.js` and refreshes itself when the command writes a new proof.
The viewer does not store proofs or layout state in browser local storage.

## Usage

Open the current proof:

```bash
proof-preview
```

Save a proof from a file and open it:

```bash
proof-preview proof.md
```

Save proof text from stdin without opening the browser:

```bash
printf '# Proof\n\nLet \\(X\\) be compact.' | proof-preview --no-open
```

Use the compact narrow view instead of full-screen:

```bash
proof-preview --small proof.md
```

Clear the current proof:

```bash
proof-preview --cleanup
```

Any open viewer tab clears itself automatically after the proof slot is cleared.

## Codex Instruction

Give Codex this instruction when you want proofs to show in the viewer:

```text
When you give me a math proof, save the proof with:
proof-preview --no-open
Then give me the printed file:// viewer link.
Overwrite the current proof instead of keeping history.
```

Codex can write directly to this viewer as long as `proof-preview` is on `PATH`. The installer creates that command through `~/.local/bin`, which is on the default PATH for this machine.

## Files

- `index.html`: editor and proof viewer
- `bin/proof-preview`: command-line helper
- `current-proof.js`: generated latest proof slot
- `vendor/katex/`: bundled offline math renderer
- `install.sh`: per-user installer for the command links

`current-proof.js` is ignored by Git because it is personal generated state.
