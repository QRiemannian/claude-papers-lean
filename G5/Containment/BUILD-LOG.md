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

---

# PHASE proofs — seat L-ADD (unit U10), opened 2026-10-30T13:27:44Z

*Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD.md` (READY 2026-10-30T13:27:00Z), with the rules of `SEAT-P3-LEAN-L-proofs-U8.md`. No git, no web. Scratch: `<scratchpad>/L-ADD-proofs/`. Lean-process discipline: `tools/waitlean.sh` (pgrep -x on lean / lake / lean4export / comparator).*

- **frozen check** 2026-10-30T13:27:44Z — `shasum -a 256 G5/Containment/Challenge.lean` = `34608245fb7cc62c538d6e5cab0592061649df8857ae133221b289e37e56b288` — equals `statement_sha256` (FROZEN). Proceeding.
- **PRELUDE-RULE U10:** Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.Group.Solution`, `G5.GroupLevel.Solution` and `G5.WordLevel.Solution` (all PROVED) — not `G5.Containment.Challenge`, no Challenge prelude; it restates nothing (U10 defines nothing); the statement is byte for byte the Challenge's, docstring included (checked by `<scratchpad>/L-ADD-proofs/assemble.py`: the docstring-plus-statement block up to `:= by` is a byte substring of both files); helpers private, `g5_u10_aux_*`. Lines ≤ 100 code points (max 96).
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:35:33Z — clear at the first poll.
- **B1** 2026-10-30T13:35:33Z — `lake build G5.Containment.Solution`: exit **0**, wall 44 s (module 39 s), `Build completed successfully (8712 jobs)`. First error: none. Four warnings: unused-tactic linter, `beta_reduce` does nothing (l. 94, 95, 97, 106).
- **wait** before B2: clear at the first poll, 2026-10-30T13:36:26Z.
- **B2** 2026-10-30T13:36:26Z (the four idle `beta_reduce` removed) — `lake build G5.Containment.Solution`: exit **0**, wall 39 s (module 35 s), `Build completed successfully (8712 jobs)`. First error: none. No warning in this module (the replayed U3 unused-variable warning is upstream).
- **axioms** 2026-10-30T13:37:13Z (wait clear at the first poll) — `lake env lean <scratchpad>/L-ADD-proofs/U10/axioms.lean`:
  ```
  'G5.g5_u10_cor' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
  No `sorryAx`.
- **comparator** 2026-10-30T13:37:34Z → 13:39:09Z (wait clear at the first poll) — `bash tools/comparator.sh G5/Containment`: exit **0**, wall 95 s. Last lines:
  ```
  Build completed successfully (8712 jobs).
  Exporting #[G5.g5_u10_cor, propext, Quot.sound, Classical.choice, …] from G5.Containment.Solution
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
  The landrun in use is the macOS shim (NOT sandboxed), as its own warning line says.
- `Solution.lean` sha256 `b7f52f132339421f6c3ab67dbef59c728419a331235e645503a32b63c94f8332`, 111 lines. `Challenge.lean` still `34608245…b288`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-COR | `G5.g5_u10_cor` | PROVED | `g5_u10_aux_main` (U8's pattern, private here) with Q t := the target set: from `g5_u7_nf`, the trace of the conjugate (`Matrix.trace_mul_cycle`, `Units.inv_mul`), the eight forms, the negated ones through `Matrix.trace_neg` and the set's closure under negation (finite part by `decide`, the cone part by `neg_neg`); `I`, `S`, `R^a` by `g5_u8_ell` + `decide`; a word by `tr W = ±t` (`g5_u1_trace`, `neg_one_pow_eq_or`) with `t = ⟨2, 0⟩` on constant words or `x ≥ 0`, `y ≥ 1` otherwise (`g5_u3_a_nonneg`, `g5_u3_a_y_eq_zero`) |

No `STATEMENT-CHANGE-NEEDED`. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched; no git run. Scratch: `<scratchpad>/L-ADD-proofs/` (assemble.py, waits.log, U10/{header,helpers,g5_u10_cor}.lean, U10/B1.log, U10/B2.log, U10/axioms.lean, U10/axioms.txt, U10/cmp.log).
Closed: 2026-10-30T13:39:28Z.
