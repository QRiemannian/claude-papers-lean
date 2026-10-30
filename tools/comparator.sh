#!/usr/bin/env bash
# tools/comparator.sh — Comparator on ONE unit, in exactly the environment tools/check.sh gives it.
# (UPGRADE-689 (c); written by the governor-agent at sitting 73, 2026-10-29. The U14 loop measured the recipe spread
# over tools/env.sh, which sets COMPARATOR_LANDRUN only, and tools/check.sh, which carries the binary path and
# COMPARATOR_LEAN4EXPORT as defaults; a prover told to run Comparator by hand had to read check.sh to find the command.)
#
# Usage:  bash tools/comparator.sh <unit-dir>      e.g. RiemannZeta/CorrectedReflections (relative to the repo root)
#         -h | --help                              this text; exit 0
#
# What it does, in check.sh's order and with check.sh's defaults (tools/check.sh :54-58 and arm 4):
#   PATH gains ~/.elan/bin (the K brief's prefix); COMPARATOR_LANDRUN is taken from the caller when set, else from
#   tools/env.sh when no `landrun` is on PATH (the macOS shim, which does NOT sandbox — the first line says which);
#   COMPARATOR_BIN defaults to ~/Claude/projects/comparator/.lake/build/bin/comparator; COMPARATOR_LEAN4EXPORT to
#   ~/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export; then, from the repo root,
#       lake env "$COMPARATOR_BIN" <unit-dir>/comparator.json
# Pass reading (the same as check.sh arm 4): exit 0 AND the line "Your solution is okay!" in the output.
# Exit: Comparator's own exit code, passed through; 2 for a bad argument, a missing comparator.json or binary.
# It runs no git and writes no manifest. Comparator itself brings the two modules up to date through lake (its output
# carries lake's build lines, "Building <module>" and "Build completed"; measured at 69-85 s per drive on U14).
set -uo pipefail
usage() { sed -n '/^# Usage:/,/^#         -h/p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; }
[ $# -eq 1 ] || { usage >&2; exit 2; }
case "$1" in -h|--help) usage; exit 0 ;; esac
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
UNIT="${1#./}"; UNIT="${UNIT%/}"
case "$UNIT" in /*|..|../*|*/..|*/../*|"") echo "comparator.sh: <unit-dir> is a path relative to the repo root: $1" >&2; exit 2 ;; esac
[ -f "$UNIT/comparator.json" ] || { echo "comparator.sh: no $UNIT/comparator.json" >&2; exit 2; }
export PATH="$HOME/.elan/bin:$PATH"
if [ -z "${COMPARATOR_LANDRUN:-}" ] && ! command -v landrun >/dev/null; then
  # shellcheck source=/dev/null
  source tools/env.sh
fi
LAKE="${LAKE:-$HOME/.elan/bin/lake}"
CMP_HOME="$HOME/Claude/projects/comparator"
COMPARATOR_BIN="${COMPARATOR_BIN:-$CMP_HOME/.lake/build/bin/comparator}"
export COMPARATOR_LEAN4EXPORT="${COMPARATOR_LEAN4EXPORT:-$CMP_HOME/.lake/packages/lean4export/.lake/build/bin/lean4export}"
[ -x "$COMPARATOR_BIN" ] || { echo "comparator.sh: Comparator binary not built at $COMPARATOR_BIN" >&2; exit 2; }
LR="${COMPARATOR_LANDRUN:-$(command -v landrun)}"; SANDBOX="sandboxed"
case "$LR" in *fake-landrun.sh) SANDBOX="the macOS shim: NOT sandboxed" ;; esac
echo "comparator.sh @ $(date -u +%FT%TZ) · unit $UNIT · landrun $LR ($SANDBOX)"
"$LAKE" env "$COMPARATOR_BIN" "$UNIT/comparator.json"
