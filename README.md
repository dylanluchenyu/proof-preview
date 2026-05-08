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

## What to expect

The viewer opens as a local `file://` page. If you keep the tab open, it refreshes when the current proof changes. Proof content stays local to your machine.

## Full docs

For the full usage reference, see [here](WHY_PROOF_PREVIEW_ZH.md).
