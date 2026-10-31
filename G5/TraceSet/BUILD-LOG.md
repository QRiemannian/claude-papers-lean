# BUILD-LOG — unit U17 (`G5/TraceSet`), seat L-ADD4, PHASE statements

*Seat L-ADD4 opened 2026-10-31T11:36:46Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD4.md` (BRIEF READY 2026-10-31T11:36:14Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD3.md` and through it `SEAT-P4-LEAN-L-statements-ADD2.md`, `SEAT-P4-LEAN-L-statements-ADD.md`, `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U16, U17, U18), built serially U16 → U17 → U18. No git, no web. Scratch: `<scratchpad>/L-ADD4/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command, then `tools/waitlean.sh` (15 s per wait, logged to `<scratchpad>/L-ADD4/waits.log`); never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-31T11:37:41Z: `shasum -a 256` = `5f2f0ed820a3acf6e2be57f5f11fe12a0c0c3010e74a0ae89ef33eec8783bdf3`, `wc -c` = 36526 — the edition the brief names (the fourth extending edition, §7 appended 11:26:17Z); `head -c 31612` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` (the specs' edition), `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the four extensions hold.
- **dependencies** at 2026-10-31T11:38:29Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-31T11:38:57Z.
- **specs/probe** 2026-10-31T11:38:17Z — `<scratchpad>/L-ADD4/sec5.py`: the §5 Lean block of each of `G5-TSYM.md`, `G5-PHIINV.md` (one block each, both V1-GREEN 11:33:52Z, no split) is a byte substring of M's probe `probe-U17.lean` (sha256 re-read `dc8fd763…`), occurring once, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-31T11:39:26Z — `<scratchpad>/L-ADD4/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 5f2f0ed8… · 36526 B with the four extension clauses 9ebf3004… · 31612, 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block occurs exactly once; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 0 definitions, 2 theorems, 2 `:= by sorry`.
- **wait** before B1 (after U16's B1 had landed): `pgrep -x` lean / lake / lean4export / comparator at 2026-10-31T11:40:23Z — all four empty; `tools/waitlean.sh` — clear at the first poll, no wait.
- **B1** 2026-10-31T11:40:23Z — `lake build G5.TraceSet.Challenge`: exit **0**, wall 29 s (the module 26 s), `Build completed successfully (8711 jobs)`. First error: none. Warnings in this module: 2 × `declaration uses 'sorry'` (l. 37 `g5_u17_tsym`, l. 46 `g5_u17_phiinv`) and nothing else; no linter line. The 30 upstream `sorry` warnings of U1 (5), U7 (6), U2 (9), U6 (6), U8 (4) were replayed (U8's own imports); no non-`sorry` warning anywhere in the log. Log: `<scratchpad>/L-ADD4/B1-U17.log`.
- `Challenge.lean` sha256 `b429cfc86f24801ae7ccc22817a2285b5de4fd004ff8b21e91b694f7defdaeed`, 50 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 11:42:14Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U7 `689c36e6…10ae` · U8 `bf7316f7…8ccd`. STATEMENTS.md still `5f2f0ed8…bdf3` at 11:42:14Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-TSYM | `G5.g5_u17_tsym` | STATED |
| G5-PHIINV | `G5.g5_u17_phiinv` | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `9ebf3004`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD4/` (sec5.py, assemble.py, records.py, run.sh, runs.log, B1-U17.log).

Closed: 2026-10-31T11:43:14Z.

# BUILD-LOG — unit U17 (`G5/TraceSet`), seat L-ADD4-proofs, PHASE proofs

*Seat opened 2026-10-31T11:55:14Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD4.md` (READY 2026-10-31T11:54:12Z), with every rule of `SEAT-P4-LEAN-L-proofs-ADD3.md`, `SEAT-P4-LEAN-L-proofs-ADD2.md`, `SEAT-P4-LEAN-L-proofs-ADD.md`, `SEAT-P3-LEAN-L-proofs-U8.md`. One seat, three units (U16, U17, U18), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD4-proofs/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command; `tools/waitlean.sh`; never `pgrep -f`.*

- **frozen check** 2026-10-31T11:55:14Z: `shasum -a 256 G5/TraceSet/Challenge.lean` = `b429cfc86f24801ae7ccc22817a2285b5de4fd004ff8b21e91b694f7defdaeed` — equals `formalization.yaml` `statement_sha256`. Proceed.
- **PRELUDE-RULE U17: Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.Group.Solution`, `G5.GroupLevel.Solution`** — never its own Challenge, no Challenge prelude; restates nothing (U17 defines nothing). U7's private unit device (`g5_u7_aux_SS`, `_uS`, `_uT`, `_uS_mem`, `_uT_mem`, `_uR_pow_mem`, `_uR_pow`) restated as `g5_u17_aux_*` from U7's Solution text, proofs unchanged up to the prefix.
- **Solution written** 2026-10-31T11:59:40Z — assembled by script (`<scratchpad>/L-ADD4-proofs/assemble.py`, `spec17.py`) from the Challenge's text from `open G5 ZPhi` to `end G5`: helpers inserted after `namespace G5`, each `:= by sorry` replaced by its proof; the two statements otherwise untouched.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-31T11:59:47Z, then `tools/waitlean.sh` — clear, no wait (`<scratchpad>/L-ADD4-proofs/waits.log`).
- **B1** 2026-10-31T11:59:47Z — `lake build G5.TraceSet.Solution`: exit **0**, wall 35 s (the module 31 s), `Build completed successfully (8712 jobs)`. First error: none. Warnings in this module: none; zero `sorry`. Log: `<scratchpad>/L-ADD4-proofs/B1-U17.log`.
- **statement check** 2026-10-31T11:59Z (`check.py`): each of the two theorem blocks (docstring + text up to `:=`) occurs exactly once in `Solution.lean`, in the Challenge's order; no `import` of a Challenge; longest line 92 code points; no `sorry` / `admit` / `native_decide` / `axiom` / `set_option`; none of the lane's barred words.
- **axioms** 2026-10-31T12:00:30Z (poll clear) — `lake env lean <scratchpad>/L-ADD4-proofs/ax-U17.lean` (exit 0, 27 s):
  - `G5.g5_u17_tsym` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u17_phiinv` depends on axioms: [propext, Classical.choice, Quot.sound]
- **comparator** 2026-10-31T12:00:57Z (poll clear) — `bash tools/comparator.sh G5/TraceSet`: exit **0**, wall 72 s; landrun = the macOS shim (NOT sandboxed). Last lines: `Running Lean default kernel on solution.` · `Lean default kernel accepts the solution` · `Your solution is okay!`. Log: `CMP-U17.log`.
- `Solution.lean` sha256 `e333d5d20453e91111c34ad9f742defbc71f5abb7b102915d640123b46055d4c`, 84 lines. `Challenge.lean` re-read 2026-10-31T12:02:09Z: still `b429cfc8…aeed`.

## Rows (proofs)
| row | declaration | status | how |
|---|---|---|---|
| G5-TSYM | `g5_u17_tsym` | PROVED | witness `h := uS · uS · g` (in `⟨S, T⟩` by `mul_mem`); its matrix is `S S g = −g` (`S² = −I` by `decide`), so `tr h = −tr g` by `neg_one_mul` and `Matrix.trace_neg` |
| G5-PHIINV | `g5_u17_phiinv` | PROVED | `rcases ht with rfl \| rfl`; witnesses the units `(T S)²` and `(T S)³` (in `⟨S, T⟩` by `pow_mem`), matrices `R²`, `R³` by `Units.val_pow_eq_pow_val`; traces `⟨−1, 1⟩`, `⟨1, −1⟩` from `g5_u8_ell` (conjuncts 4 and 5) |

No `STATEMENT-CHANGE-NEEDED`. No git run; `G5.lean` untouched. Scratch: `<scratchpad>/L-ADD4-proofs/` (assemble.py, spec17.py, check.py, run.sh, ax-U17.lean, B1-U17.log, AX-U17.log, CMP-U17.log, waits.log, runs.log).

Closed (U17 proofs): 2026-10-31T12:02Z.
