# Proof Preview Quick Start

Proof Preview is a local, offline LaTeX proof viewer for fast iteration on math notes and arguments. It is useful when you want a simple way to preview proofs without depending on an online service.

## Prerequisites

- Linux-like environment
- `bash`
- `node`
- a browser
- `xdg-open`

The installer links `proof-preview` into `~/.local/bin`, so that directory should be on your `PATH`.

## Install

From this project directory:

```bash
./install.sh
```

## Try it now

Open the current proof viewer:

```bash
proof-preview
```

Save a proof from a file and open it:

```bash
proof-preview proof.md
```

Save proof text from stdin and print the viewer link without opening the browser:

```bash
printf '# Proof\n\nLet \\(X\\) be compact.' | proof-preview --no-open
```

LaTeX commands beginning with backslashes are preserved literally when you pass content by file or stdin, for example:

```bash
cat <<'EOF' | proof-preview --no-open
# Span bound

$$
\rho^\pi \ge \rho^\star - C \sqrt{\frac{1}{n}}
$$
EOF
```

## What to expect

The viewer opens as a local `file://` page. If you keep the tab open, it refreshes when the current proof changes. Proof content stays local to your machine.

Avoid shell ANSI-C quoting such as `$'...'` for LaTeX-heavy text. Shell escape expansion can inject hidden control characters before `proof-preview` receives the text, which will then render incorrectly in the browser.

## Codex Instruction

Give Codex this instruction when you want proofs to show in the viewer:

```text
When you give me a math proof, save the proof with:
proof-preview --no-open
Then give me the printed file:// viewer link.
Overwrite the current proof instead of keeping history.
```

## Full docs

For the full usage reference, see [here](WHY_PROOF_PREVIEW_ZH.md).
