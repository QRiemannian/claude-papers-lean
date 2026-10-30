# BUILD-LOG — unit U14 (`G5/EvenKRemark`), seat L-ADD3, PHASE statements

*Seat L-ADD3 opened 2026-10-30T21:54:24Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD3.md` (BRIEF DRAFTED 2026-10-30T21:44:48Z; READY 21:53:55Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD2.md` and `SEAT-P3-LEAN-L-statements-U8.md`. One seat, two units (U14, U15), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD3/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T21:55:17Z: `shasum -a 256` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3`, `wc -c` = 31612 — the edition the brief names (the third extending edition); `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (the specs' edition), `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the three extensions hold.
- **dependencies** at 2026-10-30T21:55:17Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-30T21:55:49Z.
- **specs/probe** 2026-10-30T21:55:58Z — `<scratchpad>/L-ADD3/sec5.py`: the §5 Lean block of each of `G5-EVKRa.md`, `G5-EVKRb.md`, `G5-EVKRc.md` (one block each, every one V1-GREEN 21:50:38Z, all five theorems kept) is a byte substring of M's probe `probe-U14.lean` (sha256 re-read `aa833b71…`), occurring once, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T21:56:19Z — `<scratchpad>/L-ADD3/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 9ebf3004… · 31612 B with the three extension clauses 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block occurs exactly once in the output; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 0 definitions, 5 theorems, 5 `:= by sorry`.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-30T21:56:35Z, then `tools/waitlean.sh` at 21:56:35Z and again inside the build's own command at 21:56:43Z — clear at the first poll each time, no wait (no waits log created).
- **B1** 2026-10-30T21:56:43Z — `lake build G5.EvenKRemark.Challenge`: exit **0**, wall 32 s (the module 26 s), `Build completed successfully (8709 jobs)`. First error: none. Warnings in this module: 5 × `declaration uses 'sorry'` (l. 35 `g5_u14_evkr_mech`, l. 43 `g5_u14_evkr_one`, l. 51 `g5_u14_evkr_ord`, l. 59 `g5_u14_evkr_b`, l. 67 `g5_u14_evkr_rot`) and nothing else; no linter line (the bodies are `sorry`). The 16 upstream `sorry` warnings of U1 (5), U2 (9), U12 (2) were replayed. Log: `<scratchpad>/L-ADD3/B1-U14.log`.
- `Challenge.lean` sha256 `398c41e2254cecad8a0291cbd766b202219ffc56f6ced92822a859007c1c13cd`, 70 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 21:58:10Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U2 `c342ab92…c78c` · U12 `321dfbf5…7565`. STATEMENTS.md still `9ebf3004…79b3` at 21:58:10Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-EVKRa | `G5.g5_u14_evkr_mech` | STATED |
| G5-EVKRb | `G5.g5_u14_evkr_one`, `G5.g5_u14_evkr_ord`, `G5.g5_u14_evkr_b` (kept, V₁-signed) | STATED |
| G5-EVKRc | `G5.g5_u14_evkr_rot` (no `IsWord`, the widening V₁-accepted) | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `4a53d9ba`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD3/` (sec5.py, assemble.py, B1-U14.log).

Closed: 2026-10-30T21:59Z.
