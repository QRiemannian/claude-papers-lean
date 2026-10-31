# BUILD-LOG — unit U16 (`G5/ClassSep`), seat L-ADD4, PHASE statements

*Seat L-ADD4 opened 2026-10-31T11:36:46Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD4.md` (BRIEF READY 2026-10-31T11:36:14Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD3.md` and through it `SEAT-P4-LEAN-L-statements-ADD2.md`, `SEAT-P4-LEAN-L-statements-ADD.md`, `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U16, U17, U18), built serially U16 → U17 → U18. No git, no web. Scratch: `<scratchpad>/L-ADD4/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command, then `tools/waitlean.sh` (15 s per wait, logged to `<scratchpad>/L-ADD4/waits.log`); never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-31T11:37:41Z: `shasum -a 256` = `5f2f0ed820a3acf6e2be57f5f11fe12a0c0c3010e74a0ae89ef33eec8783bdf3`, `wc -c` = 36526 — the edition the brief names (the fourth extending edition, §7 appended 11:26:17Z); `head -c 31612` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` (the specs' edition), `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the four extensions hold.
- **dependencies** at 2026-10-31T11:38:29Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-31T11:38:57Z.
- **specs/probe** 2026-10-31T11:38:17Z — `<scratchpad>/L-ADD4/sec5.py`: the §5 Lean block of each of `G5-CSEPa.md`, `G5-CSEPb.md` (one block each, both V1-GREEN 11:33:30Z, SPLIT-OK) is a byte substring of M's probe `probe-U16.lean` (sha256 re-read `367c1902…`), occurring once, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-31T11:39:26Z — `<scratchpad>/L-ADD4/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 5f2f0ed8… · 36526 B with the four extension clauses 9ebf3004… · 31612, 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block occurs exactly once; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 0 definitions, 2 theorems, 2 `:= by sorry`.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-31T11:39:43Z — all four empty; `tools/waitlean.sh` inside the build's own command — clear at the first poll, no wait (`waits.log` not created).
- **B1** 2026-10-31T11:39:43Z — `lake build G5.ClassSep.Challenge`: exit **0**, wall 31 s (the module 26 s), `Build completed successfully (8711 jobs)`. First error: none. Warnings in this module: 2 × `declaration uses 'sorry'` (l. 40 `g5_u16_csep_lin`, l. 52 `g5_u16_csep_sq`) and nothing else; no linter line. The 26 upstream `sorry` warnings of U1 (5), U7 (6), U4 (9), U3 (4), U9 (2) were replayed; no non-`sorry` warning anywhere in the log. Log: `<scratchpad>/L-ADD4/B1-U16.log`.
- `Challenge.lean` sha256 `2021ed569a939caef12eb04b02ffc6d885da5671716989cc3358f726df22c63e`, 57 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 11:42:14Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U7 `689c36e6…10ae` · U4 `df5fdf79…996f` · U3 `69533d2d…3735` · U9 `c6a43405…d6a8`. STATEMENTS.md still `5f2f0ed8…bdf3` at 11:42:14Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-CSEPa | `G5.g5_u16_csep_lin` | STATED |
| G5-CSEPb | `G5.g5_u16_csep_sq` | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `9ebf3004`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD4/` (sec5.py, assemble.py, records.py, run.sh, runs.log, B1-U16.log).

Closed: 2026-10-31T11:43:14Z.
