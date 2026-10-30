# BUILD-LOG — unit U8 (`G5/GroupLevel`), seat L-U8, PHASE statements

*Seat L-U8 opened 2026-10-30T11:35:21Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U8.md` (BRIEF READY 2026-10-30T11:32:42Z). No git, no web. Scratch: `<scratchpad>/L-U8/`. Lean-process discipline per the dispatch: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md `shasum -a 256` at 2026-10-30T11:35:41Z: `e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf` — the edition the four specs' headers and §5 docstrings carry, and the one the dispatch names.
- **dependencies** at 2026-10-30T11:35:2xZ, `shasum -a 256` of each frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256`: U1 `G5.Ring.Challenge` `863127f8…` · U7 `G5.Group.Challenge` `689c36e6…` · U2 `G5.ModTwo.Challenge` `c342ab92…` · U6 `G5.Congruence.Challenge` `d576229b…`.
- **probe** `<scratchpad>/M-U8/probe.lean` sha256 `34bf2bc262479428a112eefa1fc49c4017a9d54f6b5bd7383ad346cc9771161e` (four theorems; no `g5_u8_ell_inv`). Its orchestrator log `probe-orch-run2.log` shows four `declaration uses 'sorry'` warnings (l. 17, 25, 31, 36) and no error; the log carries no exit line, and the exit 0 is the orchestrator's report.
- **specs** each §5 Lean block (G5-U8-ELL, -L2G, -M4G, -M3G; V1-GREEN 11:28:12Z, ELL re-signed 11:34:32Z) is a byte substring of the probe (`<scratchpad>/L-U8/sec5.py`, 11:35:5xZ).
- **assemble** 2026-10-30T11:36:22Z — `<scratchpad>/L-U8/assemble.py` writes `Challenge.lean`: `import Mathlib`, the four frozen imports (`G5.Ring.Challenge`, `G5.Group.Challenge`, `G5.ModTwo.Challenge`, `G5.Congruence.Challenge`), a module doc, `open G5 ZPhi`, `namespace G5`, the four §5 blocks (docstring + theorem, each byte-identical to its spec and a byte substring of the probe), `end G5`. No definition; no `g5_u8_ell_inv`. Checks: each block is a substring of the output; longest line 94 code points; no forbidden word; no `axiom` / `native_decide` / `set_option`.
- **wait** before B1: `tools/waitlean.sh` 11:36:30Z → 11:38:00Z, 6 waits (two sibling `lake`/`lean` builds in turn), clear at 11:38:00Z.
- **B1** 2026-10-30T11:38:06Z → 11:38:32Z — `lake build G5.GroupLevel.Challenge`: exit **0**, wall 26 s (the module 22 s), `Build completed successfully (8710 jobs)`. First error: none. Warnings in this module: 4 × `declaration uses 'sorry'` (l. 32, 40, 46, 51 — the four theorems) and nothing else; no unused-hypothesis linter warning on `hg` appeared. The 26 upstream `sorry` warnings of U1, U7, U2, U6 were replayed.
- **wait** before the inspect: 11:38:54Z → 11:39:54Z, 4 waits (a sibling's `lake` + `lean4export` + `comparator` drive), clear at 11:39:54Z.
- **inspect** 11:39:54Z → 11:40:04Z — `lake env lean <scratchpad>/L-U8/inspect.lean` (`import G5.GroupLevel.Challenge`, `#check` on the four full names, `#print axioms G5.g5_u8_m4g`): exit 0. `G5.g5_u8_ell`, `G5.g5_u8_l2g`, `G5.g5_u8_m4g`, `G5.g5_u8_m3g` resolve and print as the specs' §5 state them, over U7's `G5.HeckeGrp`, U6's `ZPhi.red4` / `G5.H4`, U1's `G5.S` / `G5.R`. Axioms: propext, sorryAx, Classical.choice, Quot.sound (sorryAx expected in this phase).
- **B2 (final)** 2026-10-30T11:40:11Z → 11:40:14Z (waitlean clear at the first poll) — `lake build G5.GroupLevel.Challenge`: exit **0**, wall 3 s (replayed). First error: none. Warnings: the same 4 × `sorry` in this module, the 26 upstream replayed, nothing else.
- `Challenge.lean` sha256 `bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd`, recorded in `formalization.yaml` as `statement_sha256_draft`. At 11:40:14Z the four frozen `Challenge.lean` digests still equal their `statement_sha256` (recorded as the four-entry `depends_on`), and STATEMENTS.md still reads `e0df0f35…33bf`.

## Departures from the specs' text (none in a signature)
1. **Locus and prefix ride inside the spec's own docstrings.** Each §5 block's docstring already carries the row id, the source-of-record locus and the prefix `e0df0f35`, which is the edition current at open. So no extra comment was added, and the blocks are carried whole.
2. **Not carried:** the probe's one-line module comment ("proposed; seat M-U8"). It is replaced by a module doc in the U7 / U6 form, which names the rows, the four imported units and the loci short forms. `G5.lean` is untouched; the orchestrator adds the import. There is no `Solution.lean`.
3. **The struck theorem is named in `formalization.yaml` only**, under `rows_not_stated`, as the record of the strike (the U1 form for GEb). It is not in `Challenge.lean`.
4. **Lean-process discipline:** the dispatch's `tools/waitlean.sh` (name match, 15 s) was used, not the brief's `pgrep -fl "lean|lake"` / 30 s, as the later course correction directs. Waits log: `<scratchpad>/L-U8/waits.log`.
5. **Scratch:** `<scratchpad>/L-U8/` only: sec5.py, assemble.py, waits.log, B1.log, B2.log, inspect.lean, inspect.txt.

Closed: 2026-10-30T11:41Z.

---

# BUILD-LOG — unit U8 (`G5/GroupLevel`), seat L-U8, PHASE proofs

*Seat L-U8 (proofs) opened 2026-10-30T12:07:14Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-proofs-U8.md` (BRIEF READY 2026-10-30T11:44:27Z). No git, no web. Scratch: `<scratchpad>/L-U8-proofs/`. Lean-process discipline: poll by process name (`pgrep -x` on lean / lake / lean4export / comparator), 15 s per wait, never `pgrep -f`.*

- **frozen check** 2026-10-30T12:06:29Z — `shasum -a 256 G5/GroupLevel/Challenge.lean` = `bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd`, equal to the frozen `statement_sha256`. Proceeding.
- **U7 present** 2026-10-30T12:07:14Z — `G5/Group/Solution.lean` exists (836 lines); its BUILD-LOG closes 12:04:19Z with all six rows PROVED. U8 proceeds (no BLOCKED-ON).
- PRELUDE-RULE U8: Solution imports the four proved preludes — `G5.Ring.Solution`, `G5.Group.Solution`, `G5.ModTwo.Solution`, `G5.Congruence.Solution` — and neither its own Challenge nor any Challenge prelude; it restates nothing (U8 defines nothing).
- **assemble** 2026-10-30T12:07:3xZ — `<scratchpad>/L-U8-proofs/assemble.py` writes `Solution.lean`: `import Mathlib` + the four proved preludes, a module doc, then the Challenge text from `open G5 ZPhi` to `end G5` with the private helpers (`g5_u8_aux_tr_conj`, `g5_u8_aux_main`, `g5_u8_aux_trR`, `g5_u8_aux_red4_neg`, `g5_u8_aux_H4_neg`) inserted after `namespace G5` and each `:= by sorry` replaced by its proof. Script checks: each theorem's docstring + statement text (from `/--` to `:=`) is a byte substring of `Solution.lean`, same order; longest line 94 code points; no `sorry` / `admit` / `native_decide` / `axiom` / forbidden word.
- **wait** before B1: 12:07:47Z → 12:08:02Z, 1 wait (a sibling's `lake` + `lean4export` + `comparator`), clear at 12:08:02Z.
- **B1** 2026-10-30T12:08:02Z — `lake build G5.GroupLevel.Solution`: exit **1**, wall 40 s. First error: `G5/GroupLevel/Solution.lean:85:29: Unknown constant 'Int.odd_neg'` (and `Int.even_neg`, in the L2G sign step). ELL, M4G, M3G and the helpers elaborated without error. Fix: the root-namespace `odd_neg` / `even_neg`.
- **wait** before B2: 12:08:50Z → 12:10:50Z, 8 waits (a sibling's `lake` + `lean4export` + `comparator`), clear at 12:10:50Z.
- **B2** 2026-10-30T12:10:50Z — `lake build G5.GroupLevel.Solution`: exit **0**, wall 26 s (the module 22 s), `Build completed successfully (8711 jobs)`. First error: none. No warning in `G5/GroupLevel/Solution.lean` (the upstream linter warnings of U7 replayed). All four theorems built in this one build (the per-theorem builds were folded: B1 already elaborated three of the four rows, and B2 closes the fourth).
- **axioms** 2026-10-30T12:11:27Z (waitlean clear at the first poll) — `lake env lean <scratchpad>/L-U8-proofs/axioms.lean`: exit 0.
  ```
  'G5.g5_u8_ell' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u8_l2g' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u8_m4g' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u8_m3g' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
  No `sorryAx`: the four proved preludes carry no `sorry` into U8.
- **comparator** 2026-10-30T12:12:02Z → 12:13:13Z (waitlean clear at the first poll) — `bash tools/comparator.sh G5/GroupLevel`: exit **0**, wall 71 s. Last lines:
  ```
  comparator.sh @ 2026-10-30T12:12:02Z · unit G5/GroupLevel · landrun …/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
  Build completed successfully (8711 jobs).
  Exporting #[G5.g5_u8_ell, G5.g5_u8_l2g, G5.g5_u8_m4g, G5.g5_u8_m3g, propext, Quot.sound, Classical.choice, …] from G5.GroupLevel.Solution
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
  The prelude arrangement (four proved Solutions imported, no Challenge) is accepted.
- `Solution.lean` sha256 `e13158fcd8a1f24d2de37e8f3078b61f968e349dfa06d2ed69b7c4ff8aa85846`, 126 lines. `Challenge.lean` still `bf7316f7…08ccd`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-U8-ELL | `G5.g5_u8_ell` | PROVED | six conjuncts, each `rw [Matrix.trace_fin_two]` then kernel `decide` on the entries |
| G5-U8-L2G | `G5.g5_u8_l2g` | PROVED | `g5_u8_aux_main` with Q t := ¬(Odd x ∧ Even y): sign step by `odd_neg` / `even_neg`; `I`, `S` by ELL + `decide`; `R^a` by `g5_u8_aux_trR` (four values) + `decide`; words by U2's `g5_u2_l2` |
| G5-U8-M4G | `G5.g5_u8_m4g` | PROVED | `g5_u8_aux_main` with Q t := red4 t ∈ H4: sign step `red4 (−t) = −red4 t` (`Int.cast_neg`) and `H₄` closed under negation (`decide` over the eight residues); finite forms by `decide`; words by U6's `g5_u6_m4b` |
| G5-U8-M3G | `G5.g5_u8_m3g` | PROVED | `g5_u8_aux_main` with Q t := ¬(x ≡ y ∧ x ≢ 0 mod 3): sign step by `Int.ModEq.neg`; finite forms by `decide`; words by U6's `g5_u6_m3b` |

`g5_u8_aux_main`: from U7's `g5_u7_nf`, rewrite the trace by the conjugate's (`Matrix.trace_mul_cycle`, `Units.inv_mul`), case-split `IsNF` into the eight forms, the four negated ones through `Matrix.trace_neg` and the law's sign step.

No `STATEMENT-CHANGE-NEEDED`. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched; no git run. Scratch: `<scratchpad>/L-U8-proofs/` (helpers.lean, assemble.py, waits.log, B1.log, B2.log, axioms.lean, axioms.txt, cmp.log).
Closed: 2026-10-30T12:13:45Z.
