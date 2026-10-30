# BUILD-LOG — unit U10 (`G5/Containment`), seat L-ADD, PHASE statements

*Seat L-ADD opened 2026-10-30T13:14:40Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD.md` (BRIEF READY 2026-10-30T13:14:19Z), with the rules of `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U9, U10, U11), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T13:15:02Z: `shasum -a 256` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`, `wc -c` = 21568 — the edition the brief and the specs name.
- **dependencies** at 2026-10-30T13:15:13Z, `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- **specs/probe** 2026-10-30T13:15:3xZ — `<scratchpad>/L-ADD/sec5.py`: every §5 Lean block of this unit's specs is a byte substring of M's probe, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T13:15:50Z — `<scratchpad>/L-ADD/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition sha256 · 21568 B, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block is a substring of the output; every line ≤ 100 code points; no forbidden word; no `axiom` / `native_decide` / `set_option`; no definition.
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:17:00Z — clear at the first poll, no wait.
- **B1** 2026-10-30T13:17:00Z — `lake build G5.Containment.Challenge`: exit **0**, wall 33 s (the module 29 s), `Build completed successfully (8712 jobs)`. First error: none. Warnings in this module: 1 × `declaration uses 'sorry'` (l. 29 `g5_u10_cor`) and nothing else; no unused-hypothesis linter warning on `hg` appeared. The 34 upstream `sorry` warnings of U1, U7, U8's imports, U3 were replayed.
- `Challenge.lean` sha256 `34608245fb7cc62c538d6e5cab0592061649df8857ae133221b289e37e56b288`, 37 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 13:18:23Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U7 `689c36e6…10ae` · U8 `bf7316f7…8ccd` · U3 `69533d2d…3735`. STATEMENTS.md still `a84cecdd…0731` · 21568 B at 13:18:23Z.

## Rows
| row | theorem | status |
|---|---|---|
| G5-COR | `G5.g5_u10_cor` | STATED |

## Departures from the specs' text (none in a signature)
1. The §5 block's docstring already carries the row id, the locus and the prefix `a84cecdd`; carried whole. The probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD/` (sec5.py, assemble.py, records.py, waits-U10.log not created (no wait), B1-U10.log).

Closed: 2026-10-30T13:19Z.
