# Unit U9 `G5/SectorGroup` — G5-BG, Theorem B at element level (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD (statement author, step 2 of the lean-papers loop, Phase 4 addendum), opened 2026-10-30T12:55:06Z, U9 closed 2026-10-30T13:04:19Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` (BRIEF READY 2026-10-30T12:54:29Z), with every rule of `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, nothing under `NMC-Phase-1-Research/`.*

source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 · source_bytes: 21568 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read in one act at 2026-10-30T12:55:06Z and again at 13:02:59Z; equal to the brief's edition pair `sha256:a84cecdd… · 21568 B` (no bytes appended since — none touch this unit). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 12:57Z and 13:02:59Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `.x`, `.y`, `phi`, `conj`, `RealNonneg`, the real order `instLE`/`instLT`, `M2`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`)
- U4 `G5.Sector.Challenge` — `df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f` (`ZPhi.rabs`)

**U9 defines nothing.** The imports are the row's (STATEMENTS.md l. 24: U1, U7, U4). The proof route also names U8's `g5_u8_ell` (`bf7316f7…`) and U3's `g5_u3_a_nonneg` / `g5_u3_a_y_eq_zero` (`69533d2d…`); the Solution may import them; the statement does not need them.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-BGa | SPEC-DRAFT | `g5_u9_bg_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) : 1 ≤ (rabs (g : M2).trace).y ∧ 0 ≤ (rabs (g : M2).trace).x ∧ (rabs (g : M2).trace).x ≤ (rabs (g : M2).trace).y + 2` |
| G5-BGb | SPEC-DRAFT | `g5_u9_bg_b (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) : 11 * rabs (conj (rabs (g : M2).trace)) ≤ (17 - 7 * phi) * rabs (g : M2).trace` |

Specced 2 · **split 1** (G5-BG → G5-BGa the sector, TA l. 43; G5-BGb the θ bound, TA l. 47 — the brief's permitted split, on the pattern of U4's Ba / Bc, for V₁'s sign-off) · stopped 0. No CC-CANDIDATE: true as recorded. Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/check.py`): no non-word form (±⟨2, 0⟩, 0, ±⟨0, 1⟩, ±⟨−1, 1⟩) satisfies `2 < rabs`; over every non-constant word of length ≤ 8, `rabs (ntr w)` with `2 < rabs` satisfies both conclusions (0 violations).

**The one definitional choice, for V₁'s signature:** hyperbolicity as a predicate on the trace, `2 < rabs (g : M2).trace` (U4's `rabs`, U1's strict real order), never on the element; the sign-normalized trace is `rabs (g : M2).trace`, which equals the brief's "tr g if tr g > 0, else −tr g" because the hypothesis forces tr g ≠ 0.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45`.

Per row (verdict lines whole in each spec's §4): G5-BGa and G5-BGb — `Matrix.trace` (targeted), `Matrix.trace_mul_comm`, `Matrix.trace_mul_cycle`, `Matrix.trace_neg`, `Units.val_mul`, `Units.mul_inv`, `Units.val_inv_eq_inv_val` (proof aids), all FOUND. **Not found: none.** No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U9.lean`, sha256 `a1a5506279fb360b42378eab0015a2037fa3c7bb435fd1ce3cd7dc1f5b41960c`, 27 lines, longest line 93 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.Group.Challenge`, `import G5.Sector.Challenge`, `open G5 ZPhi`, `namespace G5`, the two theorems `:= by sorry`, `end G5`. **NOT RUN by this seat.** Each spec's §5 block is a byte-for-byte substring (asserted by `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/gen.py` at write). Expected: 2 `declaration uses 'sorry'` warnings, no error — not observed.

**Elaboration risks I see:**
1. `rabs (g : M2).trace` must parse as `rabs ((g : M2).trace)` — the same shape as U8's `red4 (g : M2).trace ∈ H4`, which elaborated.
2. `2 < …`, `11 * …`, `17 - 7 * phi`: numerals of `ZPhi` through `OfNat`/`NatCast` and U1's `instLT` — as U4's `g5_u4_bc` and U5's `2 * phi ≤ ntr w` (elaborated). `<` resolves only to U1's `instLT` (no `Preorder ZPhi` instance exists).
3. `conj` resolves to `ZPhi.conj` under `open G5 ZPhi`, as in U4 (mathlib's `conj` notation is scoped to `ComplexConjugate`, not opened).
4. Built imports: `G5/{Ring,Group,Sector}/Challenge.olean` present at 13:03:44Z.

## Line counts (the template's one-liner, per spec)

- `specs/G5-BGa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-BGb.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-BGa:** the hyperbolicity predicate and the normalization in one stroke — `2 < rabs tr` as the record's "|tr g| > 2" (U1's strict real order is `≤ ∧ ≠`), and `rabs tr` as "t = ±tr g > 0"; check that no element the record calls hyperbolic is excluded and none it does not is admitted (both turn on tr only, and the PSL sign is absorbed by `rabs`).
- **G5-BGb:** that the cross-multiplied `11 * rabs (conj t) ≤ (17 - 7 * phi) * t` is the record's θ bound — TA l. 47 prints the decimal 0.5158…·|t|; the exact constant (17 − 7φ)/11 is SH-P2-1 l. 103 (U4's `g5_u4_bc_id`); the row G5-BG states it cross-multiplied; and that dropping the equality clause ("maximum only at 3 + φ") matches the row, which states the inequality only.

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-BGa.md`, `G5-BGb.md`, `_UNIT-U9.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U9.lean`. Also there: `bga.lean`, `bgb.lean` (the probe's parts), `gen.py` (wrote the specs: §2 quotes pulled by file and line, §4 verdicts from the classifier, §5 blocks from the parts), `check.py` (exact pair arithmetic for the truth checks).

## Status

SPEC-DRAFT 2026-10-30T13:04:19Z — U9 on disk; V₁ may open against it.
