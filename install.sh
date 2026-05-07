#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
bin_dir="${HOME}/.local/bin"
command_path="${bin_dir}/proof-preview"
current_file="${project_dir}/current-proof.js"
viewer_url="file://${project_dir}/index.html?proof=current&view=full"
dry_run=0

if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=1
fi

run() {
  if ((dry_run)); then
    printf '+ %s\n' "$*"
  else
    "$@"
  fi
}

run mkdir -p "${bin_dir}"
run chmod +x "${project_dir}/bin/proof-preview"
run ln -sfn "${project_dir}/bin/proof-preview" "${command_path}"

if [[ ! -f "${current_file}" ]]; then
  if ((dry_run)); then
    printf '+ create %s\n' "${current_file}"
  else
    printf 'window.__proofPreviewCurrentProof = "";\n' > "${current_file}"
  fi
fi

printf 'Installed proof-preview command: %s\n' "${command_path}"
printf 'Viewer link: %s\n' "${viewer_url}"
