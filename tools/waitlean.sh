#!/usr/bin/env bash
# tools/waitlean.sh — wait until no Lean-class process runs on this machine, then return 0 (UPGRADE-696, governor sitting 77).
# Matches the process NAME (pgrep -x), never the command line: a sibling seat's waiting shell names the pattern in its
# own script text and is not a Lean process. A poll is not a lock — two seats can clear in the same second.
# Usage: bash tools/waitlean.sh [<waits.log>]   appends one line per 15 s wait, with the clock and the pids seen.
LOG="${1:-/dev/null}"
NAMES="${WAITLEAN_NAMES:-lean lake lean4export comparator}"
waited=0
while :; do
  hits=""
  for n in $NAMES; do p="$(pgrep -x "$n" | tr '\n' ' ')"; [ -n "$p" ] && hits="$hits$n:$p"; done
  [ -z "$hits" ] && break
  printf '%s waiting on %s\n' "$(date -u +%FT%TZ)" "$hits" >> "$LOG"; waited=1; sleep 15
done
[ $waited -eq 1 ] && printf '%s clear\n' "$(date -u +%FT%TZ)" >> "$LOG"
exit 0
