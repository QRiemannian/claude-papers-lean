# BUILD-LOG — unit U9 (`G5/SectorGroup`), seat L-ADD, PHASE statements

*Seat L-ADD opened 2026-10-30T13:14:40Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD.md` (BRIEF READY 2026-10-30T13:14:19Z), with the rules of `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U9, U10, U11), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T13:15:02Z: `shasum -a 256` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`, `wc -c` = 21568 — the edition the brief and the specs name.
- **dependencies** at 2026-10-30T13:15:13Z, `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- **specs/probe** 2026-10-30T13:15:3xZ — `<scratchpad>/L-ADD/sec5.py`: every §5 Lean block of this unit's specs is a byte substring of M's probe, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T13:15:50Z — `<scratchpad>/L-ADD/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition sha256 · 21568 B, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block is a substring of the output; every line ≤ 100 code points; no forbidden word; no `axiom` / `native_decide` / `set_option`; no definition.
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:16:10Z — clear at the first poll, no wait.
- **B1** 2026-10-30T13:16:10Z — `lake build G5.SectorGroup.Challenge`: exit **0**, wall 37 s (the module 33 s), `Build completed successfully (8709 jobs)`. First error: none. Warnings in this module: 2 × `declaration uses 'sorry'` (l. 31 `g5_u9_bg_a`, l. 40 `g5_u9_bg_b`) and nothing else; no unused-hypothesis linter warning on `hg` / `hh` appeared. The 20 upstream `sorry` warnings of U1, U7, U4 were replayed.
- `Challenge.lean` sha256 `c6a43405c82a8b43218854dc605d0b9952332b82681dfb03a9008e6e3195d6a8`, 43 lines, longest line 95 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 13:18:23Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U7 `689c36e6…10ae` · U4 `df5fdf79…996f`. STATEMENTS.md still `a84cecdd…0731` · 21568 B at 13:18:23Z.

## Rows
| row | theorem | status |
|---|---|---|
| G5-BGa | `G5.g5_u9_bg_a` | STATED |
| G5-BGb | `G5.g5_u9_bg_b` | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block's docstring already carries the row id, the locus and the prefix `a84cecdd`; the blocks are carried whole. The probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports (the full edition sha256 and the byte count, the rows, the frozen imports).
2. No `Solution.lean`; `G5.lean` untouched (the orchestrator adds the import); no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD/` (sec5.py, assemble.py, records.py, waits-U9.log not created (no wait), B1-U9.log).

Closed: 2026-10-30T13:19Z.

---

# PHASE proofs — seat L-ADD (unit U9), opened 2026-10-30T13:27:44Z

*Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD.md` (READY 2026-10-30T13:27:00Z), with the rules of `SEAT-P3-LEAN-L-proofs-U8.md`. No git, no web. Scratch: `<scratchpad>/L-ADD-proofs/`. Lean-process discipline: `tools/waitlean.sh` (pgrep -x on lean / lake / lean4export / comparator).*

- **frozen check** 2026-10-30T13:27:44Z — `shasum -a 256 G5/SectorGroup/Challenge.lean` = `c6a43405c82a8b43218854dc605d0b9952332b82681dfb03a9008e6e3195d6a8` — equals `statement_sha256` (FROZEN). Proceeding.
- **PRELUDE-RULE U9:** Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.Group.Solution`, `G5.Sector.Solution`, `G5.GroupLevel.Solution` (for `g5_u8_ell`) and `G5.WordLevel.Solution` (for `g5_u3_a_nonneg`, `g5_u3_a_y_eq_zero`) — all PROVED; not `G5.SectorGroup.Challenge`, no Challenge prelude; it restates nothing (U9 defines nothing; `rabs` comes from `G5.Sector.Solution`); the two statements are byte for byte the Challenge's, docstrings included, in order (checked by `<scratchpad>/L-ADD-proofs/assemble.py`: each docstring-plus-statement block up to `:= by` is a byte substring of both files); helpers private, `g5_u9_aux_*` (U5's real-value ring map and its order lemmas, renamed). Lines ≤ 100 code points (max 95).
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:40:27Z — clear at the first poll.
- **B1** 2026-10-30T13:40:27Z — `lake build G5.SectorGroup.Solution`: exit **1**, wall 33 s. First error: `G5/SectorGroup/Solution.lean:131:2: unsolved goals … ⊢ - -t = t` (the third case of `g5_u9_aux_rabs_neg` lacked `neg_neg`). Warnings: `show` changed the goal (l. 139); unused `[DecidablePred Q]` on `g5_u9_aux_hyp` (l. 187).
- **wait** before B2: clear at the first poll, 2026-10-30T13:41:17Z.
- **B2** 2026-10-30T13:41:17Z (`neg_neg` added; `show` → `change`; the unused instance argument removed) — `lake build G5.SectorGroup.Solution`: exit **0**, wall 41 s (module 37 s), `Build completed successfully (8713 jobs)`. First error: none. No warning in this module.
- **axioms** 2026-10-30T13:42:05Z (wait clear at the first poll) — `lake env lean <scratchpad>/L-ADD-proofs/U9/axioms.lean`:
  ```
  'G5.g5_u9_bg_a' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u9_bg_b' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
  No `sorryAx`.
- **comparator** 2026-10-30T13:42:26Z → 13:43:30Z (wait clear at the first poll) — `bash tools/comparator.sh G5/SectorGroup`: exit **0**, wall 64 s. Last lines:
  ```
  Build completed successfully (8713 jobs).
  Exporting #[G5.g5_u9_bg_a, G5.g5_u9_bg_b, propext, Quot.sound, Classical.choice, …] from G5.SectorGroup.Solution
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
  The landrun in use is the macOS shim (NOT sandboxed), as its own warning line says.
- `Solution.lean` sha256 `ad41084f17758cf26774b597142736d6cfa7aa5429166a842653619983535c79`, 237 lines. `Challenge.lean` still `c6a43405…d6a8`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-BGa | `G5.g5_u9_bg_a` | PROVED | `g5_u9_aux_hyp` with Q t := `1 ≤ y ∧ 0 ≤ x ∧ x ≤ y + 2`, the word leg U4's `g5_u4_ba` |
| G5-BGb | `G5.g5_u9_bg_b` | PROVED | `g5_u9_aux_hyp` with Q t := `11 · rabs (t^σ) ≤ (17 − 7φ) t`, the word leg the first conjunct of U4's `g5_u4_bc` |

`g5_u9_aux_hyp`: from U7's `g5_u7_nf`, the trace of the conjugate (`Matrix.trace_mul_cycle`, `Units.inv_mul`), the eight forms, the negated ones through `Matrix.trace_neg` and `rabs (−t) = rabs t` (`g5_u9_aux_rabs_neg`, through the real-value map's injectivity); `I`, `S`, `R^a` by `g5_u8_ell` and `decide` on `¬ 2 < rabs t`; a word by `rabs (tr W) = rabs t` (`g5_u1_trace`, `neg_one_pow_eq_or`), the constant words `t = ⟨2, 0⟩` (`g5_u3_a_y_eq_zero`, then `decide`), the others `rabs t = t` on ℕ[φ] (`g5_u3_a_nonneg`) and the hypotheses `∃ a ∈ w, a ≠ 1`, `∃ a ∈ w, a ≠ 4` of the U4 legs.

No `STATEMENT-CHANGE-NEEDED`. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched; no git run. Scratch: `<scratchpad>/L-ADD-proofs/` (assemble.py, embed_template.lean, waits.log, U9/{header,helpers,g5_u9_bg_a,g5_u9_bg_b}.lean, U9/B1.log, U9/B2.log, U9/axioms.lean, U9/axioms.txt, U9/cmp.log).
Closed: 2026-10-30T13:43:54Z.
