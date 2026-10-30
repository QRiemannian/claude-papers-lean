# BUILD-LOG — unit U13 (`G5/CensusCap`), seat L-ADD2, PHASE statements

*Seat L-ADD2 opened 2026-10-30T18:41:43Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD2.md` (BRIEF READY 2026-10-30T18:41:16Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD.md` and `SEAT-P3-LEAN-L-statements-U8.md`. One seat, two units (U12, U13), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD2/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T18:42:08Z: `shasum -a 256` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `wc -c` = 25981 — the edition the brief and the specs name; `head -c 21568` of it = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen units' edition; the extension holds).
- **dependencies** at 2026-10-30T18:42:08Z, `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- **specs/probe** 2026-10-30T18:42:35Z — `<scratchpad>/L-ADD2/sec5.py`: every §5 Lean block of this unit's specs is a byte substring of M's probe (sha as the unit file names it, re-read 18:42Z), and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T18:42:55Z — `<scratchpad>/L-ADD2/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition pair 1fb5b03e… · 25981 B with the extension clause and a84cecdd… · 21568 B, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block is a substring of the output; every line ≤ 100 code points; none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; the definition count as the unit's.
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T18:44:10Z (after U12's B1 had exited at 18:43:56Z) — clear at the first poll (`pgrep -x` lean / lake / lean4export / comparator all empty), no wait.
- **B1** 2026-10-30T18:44:10Z — `lake build G5.CensusCap.Challenge`: exit **0**, wall 29 s (the module 25 s), `Build completed successfully (8709 jobs)`. First error: none. Warnings in this module: 3 × `declaration uses 'sorry'` (l. 30 `g5_u13_cap_a`, l. 41 `g5_u13_cap_b`, l. 51 `g5_u13_cap_b_conv`) and nothing else; no linter line appeared. The 19 upstream `sorry` warnings of U1 (5), U5 (11), U11 (3) were replayed. Log: `<scratchpad>/L-ADD2/B1-U13.log`.
- `Challenge.lean` sha256 `d10844cbc16f2b02706d4f35d5d9d232d4809812e9ecbdb6265f1339387b067e`, 55 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 18:44:49Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U5 `ea6b4aed…d11a` · U11 `ee958447…c76c`. STATEMENTS.md still `1fb5b03e…5c47` · 25981 B at 18:44:49Z.

## Rows
| row | theorems | status |
|---|---|---|
| G5-CAPa | `G5.g5_u13_cap_a` | STATED |
| G5-CAPb | `G5.g5_u13_cap_b`, `G5.g5_u13_cap_b_conv` (the converse, KEPT at V₁) | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block's docstring already carries the row id, the record's sentence, the locus and the prefix `1fb5b03e`; the blocks are carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD2/` (sec5.py, assemble.py, B1-U13.log; no waits log created — no wait).

Closed: 2026-10-30T18:45Z.
