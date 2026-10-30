# Unit U8 — the group-level legs of G5-L2, G5-M4, G5-M3 and the elliptic-trace lemma leg (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U8 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T11:00:43Z, closed 2026-10-30T11:10:37Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U8-group-level-legs.md` (BRIEF READY 2026-10-30T11:00:10Z). No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind.*

source_sha256: e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md` (§4 Errata included), `shasum -a 256` at 2026-10-30T11:00:47Z and again at 11:09:48Z; it matches the brief's digest. Charter: §4 l. 48 (the 10:29:26Z coverage decision) on the ground of §4 l. 47 (the 10:26:51Z scope note). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (the four frozen units, each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 11:01Z and 11:09:48Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `.x`, `.y`, `phi`, `M2`, `S`, `T`, `R`, `IsWord`, `W`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`, `IsNF`, `g5_u7_nf`)
- U2 `G5.ModTwo.Challenge` — `c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c` (`g5_u2_l2`)
- U6 `G5.Congruence.Challenge` — `d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532` (`ZPhi.red4`, `G5.H4`, `g5_u6_m4b`, `g5_u6_m3b`)

**U8 defines nothing.** Every name in its statements is a frozen unit's or mathlib's, used in the sense that unit fixed. U2's `red2` and U6's `red3` are named by the brief but used by no U8 statement: the L2G and M3G predicates are written on the integer coordinates exactly as the word legs `g5_u2_l2` and `g5_u6_m3b` write them, so each composition is verbatim.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-U8-ELL | SPEC-DRAFT | `g5_u8_ell : (1 : M2).trace = ⟨2, 0⟩ ∧ S.trace = 0 ∧ (R ^ 1).trace = ⟨0, 1⟩ ∧ (R ^ 2).trace = ⟨-1, 1⟩ ∧ (R ^ 3).trace = ⟨1, -1⟩ ∧ (R ^ 4).trace = ⟨0, -1⟩`; `g5_u8_ell_inv : (⟨-1, 1⟩ : ZPhi) = phi - 1 ∧ phi * (phi - 1) = 1` |
| G5-U8-L2G | SPEC-DRAFT | `g5_u8_l2g (g : M2ˣ) (hg : g ∈ HeckeGrp) : ¬ (Odd (g : M2).trace.x ∧ Even (g : M2).trace.y)` |
| G5-U8-M4G | SPEC-DRAFT | `g5_u8_m4g (g : M2ˣ) (hg : g ∈ HeckeGrp) : red4 (g : M2).trace ∈ H4` |
| G5-U8-M3G | SPEC-DRAFT | `g5_u8_m3g (g : M2ˣ) (hg : g ∈ HeckeGrp) : ¬ ((g : M2).trace.x ≡ (g : M2).trace.y [ZMOD 3] ∧ ¬ ((g : M2).trace.x ≡ 0 [ZMOD 3]))` |

Specced 4 · split 0 · stopped 0. No CC-CANDIDATE: every U8 statement is true as recorded. The non-word forms were computed exactly (own pair arithmetic, `<scratchpad>/M-U8/ell_check.py`, 11:05:12Z): tr I = ⟨2, 0⟩, tr S = ⟨0, 0⟩, tr R^a = ⟨0, 1⟩, ⟨−1, 1⟩, ⟨1, −1⟩, ⟨0, −1⟩ for a = 1..4 (the second head's table l. 26 in order), and their negatives. None has x odd and y even. All lie in H₄ mod 4, and none has x ≡ y ≢ 0 mod 3. H₄ is closed under negation, and the L2G and M3G predicates are sign-symmetric, so the ±W w forms follow from the word legs.

**ELL holds two theorems in one spec:** `g5_u8_ell` (the values) and `g5_u8_ell_inv` (the table's "φ − 1 = φ⁻¹", read as ⟨−1, 1⟩ = φ − 1 and φ · (φ − 1) = 1, since the pair ring has no inverse by name). `g5_u8_ell_inv` is the one clause beyond the brief's list, and no leg uses it. V₁ may strike it.

**Not restated, by the charter:** L-2's "in particular" (Θ ∩ ℤ ⊆ 2ℤ) — U7's INTa carries it (§4 l. 48), and U2's `g5_u2_l2_int` its word leg. The ledger's k-indexed mod-4 form (row AM-4) and the norm form (y odd ⟹ N ≡ 3 mod 4) are not lifted: k is a word datum, not a class invariant, so these stay U6's word-level `g5_u6_m4d` and `g5_u6_m4c`.

## Offered, not specced (scope is the wall's; to the Phase 3 close report as a scope question)

- V₁-U7's option (c): the printed Corollary's stronger containment "Every element of G(5) has trace in {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}" (`candidates/checks/AM-1-second-head.md` l. 263–265). Note: U8's `g5_u8_ell` together with `g5_u7_nf` and U3's word-level positivity are its parts; the containment itself is not stated here.
- V₃-U1's nine uncarried statements: R of order 10; det W = 1; S² = −I; σ a ring involution; nrm = t·σ(t); the order as the real order; ℕ[φ] closure; φ² = φ + 1; the T^mS identities.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45`.

Declarations per row (verdict lines pasted whole in each spec's §4):
- G5-U8-ELL: `Matrix.trace`, `Matrix.trace_fin_two`, `Matrix.trace_one`, `Matrix.trace_neg`, `pow_succ`, `pow_one` (FOUND).
- G5-U8-L2G: `Matrix.trace`, `Matrix.trace_mul_cycle`, `Matrix.trace_mul_comm`, `Matrix.trace_neg`, `Units.val_mul`, `Units.val_inv_eq_inv_val`, `Units.mul_inv`, `Int.even_or_odd`, `odd_neg`, `Odd.neg` (FOUND); `Even.neg`, `even_neg` (NOT FOUND — `@[to_additive]`-generated, present at `Mathlib/Algebra/Group/Even.lean:156` (`isSquare_inv`) and l. 159 (alias `IsSquare.inv`); proof aids only).
- G5-U8-M4G: `Matrix.trace`, `Matrix.trace_mul_cycle`, `Matrix.trace_mul_comm`, `Matrix.trace_neg`, `Units.val_mul`, `Units.val_inv_eq_inv_val`, `Units.mul_inv`, `Int.cast_neg`, `Finset.mem_insert`, `Finset.mem_singleton` (FOUND).
- G5-U8-M3G: `Matrix.trace`, `Matrix.trace_mul_cycle`, `Matrix.trace_mul_comm`, `Matrix.trace_neg`, `Units.val_mul`, `Units.val_inv_eq_inv_val`, `Units.mul_inv`, `Int.ModEq`, `Int.ModEq.neg`, `Int.ModEq.refl` (FOUND).

**Every name NOT FOUND, and why:**
- `Even.neg` and `even_neg` are `to_additive` forms, present at the pin.
- Also tried, NOT targeted by any row: `Int.even_neg` and `Int.odd_neg` (NOT FOUND; the root `odd_neg` and the `to_additive` `even_neg` serve); `Prod.ext` (NOT FOUND, Lean core); `Int.emod_emod_of_dvd` (NOT FOUND, not needed).
- No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U8/probe.lean`, sha256 `e7dafc827ad281df4697da5de159b6804e926ad448f994262d77807201e5a0e9`, 45 lines. It is `import Mathlib` and the four frozen Challenge imports (`G5.Ring.Challenge`, `G5.Group.Challenge`, `G5.ModTwo.Challenge`, `G5.Congruence.Challenge`), then `open G5 ZPhi`, `namespace G5`, the five theorems `:= by sorry`, and `end G5`. **NOT RUN by this seat** (the brief: no `lake` command; five proof seats hold the one Lean slot). It is left for the orchestrator to elaborate serially. Every spec's §5 Lean text is a byte-for-byte substring of the probe (asserted by `gen.py` at write). Expected on elaboration: 5 `declaration uses 'sorry'` warnings, no error. This is not yet observed.

**Elaboration risks I see:**
1. **Built imports.** `lake env lean` reads existing oleans. `G5.Group.Challenge`, `G5.ModTwo.Challenge` and `G5.Congruence.Challenge` must be built (and `G5.Ring.Challenge` under them). An unbuilt module fails at the import line, not in U8's text.
2. **Four imports under one `open G5 ZPhi`.** U2's `G5.F4.zero_x` etc. and U1's `ZPhi.zero_x` etc. share short names. No U8 statement uses them. `red4` resolves only to `ZPhi.red4` and `H4` only to `G5.H4`. No U8 name collides with an existing declaration (`G5.g5_u8_*` are new).
3. **`S.trace`** is dot notation on a term of type `M2` (an `abbrev` for `Matrix`). This is the same mechanism as U7's `(g : M2).trace`, which elaborated at exit 0. The fallback, if it fails, is `Matrix.trace S`.
4. **`phi - 1`** finds `Sub ZPhi` either through U1's `instSub` or through `CommRing`'s `toSub`. Either elaborates. A diamond between them is a proof concern only (the L seat's `rfl`/`decide`).
5. **`(⟨-1, 1⟩ : ZPhi)`** is an anonymous constructor with a negative integer literal, as U7's `⟨-2, 0⟩` (elaborated).
6. **`[ZMOD 3]`** is the global `Int.ModEq` notation, as in U6's frozen file (elaborated).
7. **`R ^ 1` … `R ^ 4`** use `Monoid.npow` on `M2`, as U1's `R ^ 5` (elaborated).

## Line counts (the template's one-liner, per spec)

- `specs/G5-U8-ELL.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U8-L2G.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U8-M4G.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U8-M3G.md`: 0 Lean line(s) over 100 code points

(The probe's longest line is 94 code points.)

## The one thing V₁ should look hardest at, per row

- **G5-U8-ELL:**
  - The spelling `R ^ 1` (not `R`), so that the legs meet U7's `IsNF` (`m = R ^ a`) literally.
  - Whether `g5_u8_ell_inv` is a fair reading of the table's "φ − 1 = φ⁻¹" or should be struck. It goes beyond the brief's list, and no leg cites it.
- **G5-U8-L2G:** the domain. The statement covers every unit in U7's `HeckeGrp` with the literal SL trace; the record says "no element of G(5)" in PSL. Check that this is the same statement by sign-invariance. Also check that the row's "in particular" is left to U7's INTa by the charter, not dropped.
- **G5-U8-M4G:**
  - Check that the H₄ form alone is the group-level clause. The ledger's k-form (AM-4) and the norm form stay word-level, because k is no class invariant.
  - PHASE-2-DEFINITIONS l. 15 states the law on the NORMALIZED (x, y); DO l. 246 on "every trace". The two agree only because H₄ is closed under negation.
- **G5-U8-M3G:** the reading of "x ≡ y ≢ 0" as `x ≡ y ∧ ¬ x ≡ 0`. It is U6's `g5_u6_m3b` form, chosen so that the word leg composes verbatim, and `red3` is unused.

## Files

Specs (write path), all under `~/Claude/projects/claude-papers-lean/specs/`:
- `G5-U8-ELL.md`
- `G5-U8-L2G.md`
- `G5-U8-M4G.md`
- `G5-U8-M3G.md`
- `_UNIT-U8.md` (this file)

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U8/probe.lean` (the probe for the orchestrator's elaboration, and the source of every §5 block).

Also in that folder:
- `head.lean`, `ell.lean`, `l2g.lean`, `m4g.lean`, `m3g.lean` (the probe's parts)
- `gen.py` (the script that wrote the specs; it pulls every §2 quote by file and line from the record, every §4 verdict from the classifier, and every §5 block from the probe parts)
- `ell_check.py` (the exact pair-arithmetic check of the non-word traces against the three predicates)

## Status

SPEC-DRAFT 2026-10-30T11:10:37Z — U8 on disk; V₁ may open against it.

*Orchestrator note 2026-10-30T11:31Z, from V₁-U8: `g5_u8_ell_inv` STRUCK (V1-DRIFT — the φ·(φ − 1) = 1 identity is V₃-U1's uncarried statement and the wall's scope; no leg uses it); the "k is no class invariant" reason covers the k-indexed AM-4 form only — the norm form (y odd ⟹ N ≡ 3 mod 4) is a residue corollary of M4G (for y odd, residue ∈ H₄ ⟺ N ≡ 3 mod 4) and stays word-level on U6 by the charter, not by that reason; three row-line pointers corrected (L2G l. 14, M4G l. 20, M3G l. 21). ELL returns to V₁ for its line on the struck form.*
