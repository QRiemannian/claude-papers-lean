# BUILD-LOG — unit U12 (`G5/EvenK`), seat L-ADD2, PHASE statements

*Seat L-ADD2 opened 2026-10-30T18:41:43Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD2.md` (BRIEF READY 2026-10-30T18:41:16Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD.md` and `SEAT-P3-LEAN-L-statements-U8.md`. One seat, two units (U12, U13), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD2/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T18:42:08Z: `shasum -a 256` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `wc -c` = 25981 — the edition the brief and the specs name; `head -c 21568` of it = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen units' edition; the extension holds).
- **dependencies** at 2026-10-30T18:42:08Z, `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- **specs/probe** 2026-10-30T18:42:35Z — `<scratchpad>/L-ADD2/sec5.py`: every §5 Lean block of this unit's specs is a byte substring of M's probe (sha as the unit file names it, re-read 18:42Z), and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T18:42:55Z — `<scratchpad>/L-ADD2/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition pair 1fb5b03e… · 25981 B with the extension clause and a84cecdd… · 21568 B, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block is a substring of the output; every line ≤ 100 code points; none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; the definition count as the unit's.
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T18:43:13Z, and again in the build's own command at 18:43:20Z — clear at the first poll each time (`pgrep -x` lean / lake / lean4export / comparator all empty), no wait.
- **B1** 2026-10-30T18:43:20Z — `lake build G5.EvenK.Challenge`: exit **0**, wall 36 s (the module 30 s), `Build completed successfully (8708 jobs)`. First error: none. Warnings in this module: 2 × `declaration uses 'sorry'` (l. 38 `g5_u12_evk_a`, l. 46 `g5_u12_evk_b`) and nothing else; no unused-hypothesis linter line appeared for `hk` (the bodies are `sorry`). The 14 upstream `sorry` warnings of U1 (5) and U2 (9) were replayed. Log: `<scratchpad>/L-ADD2/B1-U12.log`.
- `Challenge.lean` sha256 `321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565`, 49 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 18:44:49Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U2 `c342ab92…c78c`. STATEMENTS.md still `1fb5b03e…5c47` · 25981 B at 18:44:49Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-EVKa | `G5.A` (the one definition), `G5.g5_u12_evk_a` | STATED |
| G5-EVKb | `G5.g5_u12_evk_b` (`hk` kept, V₁-signed) | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (the definition `A` with its docstring, and each theorem with its docstring carrying the row id, the locus and the prefix `1fb5b03e`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD2/` (sec5.py, assemble.py, B1-U12.log; no waits log created — no wait).

Closed: 2026-10-30T18:45Z.

## PHASE PROOFS (step 6) — L-proofs-ADD2 seat
- 2026-10-30T18:55:05Z FROZEN-CHECK U12: `shasum -a 256 G5/EvenK/Challenge.lean` = 321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565 — matches statement_sha256. Proceeding.
- 2026-10-30T18:57Z PRELUDE-RULE U12: Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.ModTwo.Solution` (PROVED preludes; no Challenge); restates the ONE definition `A` byte for byte; statements byte for byte with docstrings, in order (script `<scratchpad>/L-ADD2-proofs/check_blocks.py`: 3/3 blocks found in order; no line > 100 code points; no barred word).
- wait before P1: `tools/waitlean.sh` 2026-10-30T18:57:31Z — clear at the first poll (lean/lake/lean4export/comparator all empty), no wait.
- P1 2026-10-30T18:57:31Z — `lake build G5.EvenK.Solution`: exit **1**, wall 32 s. First error: l. 37 `unsolved goals` (the `red2M` = `f.mapMatrix` helper: `ext` descended into `F4.ext`, the `.y` goal left). Also: `Finset.Icc 1 4` elaborated over `ZMod 5` (the cast in the body fixed the binder's type) → no `LocallyFiniteOrder (ZMod 5)`; the pair step then unknown. Fix: the helper by `congr 1; funext`; the binders typed `(1 : ℕ)`. Log `<scratchpad>/L-ADD2-proofs/B-U12-1.log`.
- wait before P2: `tools/waitlean.sh` 2026-10-30T18:58:27Z — clear at the first poll, no wait.
- P2 2026-10-30T18:58:27Z — `lake build G5.EvenK.Solution`: exit **0**, wall 35 s, `Build completed successfully (8708 jobs)`. First error: none. One warning, the expected linter line: l. 114 `Variable name `hk` is not explicitly referenced` (EVKb's `hk`, kept by V₁; not an error). Log `<scratchpad>/L-ADD2-proofs/B-U12-2.log`.
- wait before the axioms print: 2026-10-30T18:59:07Z — clear, no wait. `lake env lean <scratchpad>/L-ADD2-proofs/axU12.lean` (exit 0, 18:59:26Z):
  ```
  'G5.g5_u12_evk_a' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u12_evk_b' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
- wait before the comparator: 2026-10-30T18:59:31Z — clear, no wait. `bash tools/comparator.sh G5/EvenK` 2026-10-30T18:59:31Z: exit **0**, wall 72 s; landrun = the macOS shim (NOT sandboxed, as the script's first line says); last lines:
  ```
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
- `Solution.lean` sha256 `3ecd546a79d9b43545914ec0e15fb9e13a52dc823d5fe0c779c8247351211691`, 120 lines, every line ≤ 100 code points; no `sorry` / `admit` / `native_decide` / `axiom`. `Challenge.lean` re-hashed 19:01Z: `321dfbf5…7565`, unchanged.

## Rows — proofs phase
| row | theorem | status |
|---|---|---|
| G5-EVKa | `G5.g5_u12_evk_a` | PROVED |
| G5-EVKb | `G5.g5_u12_evk_b` | PROVED |

How: EVKa — from `g5_u2_red_hom` a ring map `f` agreeing with `red2`; `red2M` = `f.mapMatrix`, so `red2M (W w)` is the product of the reduced syllables `R̄^a S̄` and `red2` of the trace is the trace of `red2M`; the pairing `R̄^a S̄ R̄^b S̄ R̄^j = R̄^(a − b + j)` (exponents in `ZMod 5`) is a kernel `decide` over 4 × 4 × 5 cases, and a recursion two syllables at a time gives `R̄^(A w mod 5)` at even length; the φ̄-coefficient of `tr R̄^j` is 0 exactly at `j = 0` (kernel `decide`); `ZMod.intCast_zmod_eq_zero_iff_dvd` at 5 and at 2 closes it. EVKb — (d) ⟹ (c) the right conjunct; (c) ⟹ (d) by U2's `g5_u2_l2` with `Int.not_even_iff_odd`; `hk` unused. Closed: 2026-10-30T19:01Z.
