# Unit U1 — the ring and the blocks (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U1 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T09:46:30Z, closed 2026-10-30T10:01:07Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U1-ring-and-blocks.md`. No git, no web, nothing under `NMC-Phase-1-Research/`; three probe runs (the permitted maximum).*

source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T09:45:42Z; it matches the brief's digest. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-U1-DEFS | SPEC-DRAFT | the definitions block (§5), cited by name below |
| G5-U1-R5 | SPEC-DRAFT | `g5_u1_r5 : R ^ 5 = -1` |
| G5-U1-RAS | SPEC-DRAFT | `g5_u1_ras (a) (ha : 1 ≤ a ∧ a ≤ 4) : R ^ a * S = -P a` |
| G5-U1-DET | SPEC-DRAFT | `g5_u1_det (a) (ha) : (P a).det = 1` |
| G5-U1-GEa | SPEC-DRAFT (SPLIT, half a) | `g5_u1_ge_a (a) (ha) (i j) : nonneg (P a i j) ∧ (1 : M2) i j ≤ P a i j` |
| G5-U1-GEb | **CC-CANDIDATE**, stopped, OPEN and uncounted (SPLIT, half b) | none (defect witness only) |
| G5-U1-TRACE | SPEC-DRAFT | `g5_u1_trace (w) (hw : IsWord w) : ntr w = (-1) ^ w.length * (W w).trace` |

**The split, for V₁'s sign-off.** The brief's identity "P_a ≥ I entrywise over ℕ[φ]" (id G5-U1-GE; also STATEMENTS.md row G5-MONO's first clause and `phase-2/PHASE-2-DEFINITIONS.md` §1 l. 11) has two readings. **GEa:** every entry of P_a lies in ℕ[φ], and I ≤ P_a entrywise in the REAL order — what the record's proofs state and use (AM §5.1 l. 198, AM §1.1 l. 34, TA Lemma 3 l. 51, DO Lemma L1 l. 60, SH-P2-1 §3.1 l. 176); true; specced. **GEb:** P_a − I has entries in ℕ[φ] — FALSE for a = 2, 3 (top-left entry of P₂ − I is φ − 1 = (−1, 1)); the record says so itself (AM §1.1 l. 34; AM §1.2 correction note l. 52: "a first draft of §1.1 said "P_a ≥ I entrywise in ℕ[φ]"; that is false for a = 2, 3"). Not repaired; listed as CC-CANDIDATE. The defect is wording (the phrase "over ℕ[φ]" in PHASE-2-DEFINITIONS §1 and STATEMENTS.md G5-MONO), not the mathematics: no proof on the record uses the false reading. The probe's `decide` closes both the refutation of the GEb reading and the GEa inequality at a = 2, entry (0, 0).

## Names fixed for U2–U7 (all in G5-U1-DEFS §5; statements read after `open G5 ZPhi`)

- `ZPhi` — the pair ring ℤ[φ] (`structure`, fields `x y : ℤ`, `@[ext]`, `DecidableEq`); `ZPhi.instCommRing` its `CommRing` (axioms proved, no `sorry`); simp lemmas `ZPhi.zero_x`, `zero_y`, `one_x`, `one_y`, `add_x`, `add_y`, `neg_x`, `neg_y`, `sub_x`, `sub_y`, `mul_x`, `mul_y` (all `rfl`).
- `ZPhi.phi` = ⟨0, 1⟩ · `ZPhi.phiCoeff` (= `.y`) · `ZPhi.conj` (σ: ⟨x, y⟩ ↦ ⟨x + y, −y⟩) · `ZPhi.nrm` (x² + xy − y²; not `norm`, to stay clear of mathlib's exported `Norm.norm`).
- The exact order: `ZPhi.NonnegAB5 a b` (a + b√5 ≥ 0, the `sign_ab5` test) · `ZPhi.RealNonneg t` (= `NonnegAB5 (2x + y) y`, the `sign5` test) · `ZPhi.instLE` (s ≤ t ⟺ `RealNonneg (t − s)`) · `ZPhi.instLT` (s ≤ t ∧ s ≠ t) · decidability `instDecNonnegAB5`, `instDecRealNonneg`, `instDecLE`, `instDecLT`.
- ℕ[φ]: `ZPhi.nonneg t` (0 ≤ x ∧ 0 ≤ y), `instDecNonneg`.
- `G5.M2` = `Matrix (Fin 2) (Fin 2) ZPhi` · `G5.S` · `G5.T` · `G5.R` (= `T * S`) · `G5.P : ℕ → M2` (the printed blocks at 1..4; filler `1` elsewhere) · `G5.IsWord` (non-empty, syllables in {1, 2, 3, 4}) · `G5.W` (literal R^{a₁}S ⋯ R^{a_k}S) · `G5.blockProd` (P_{a₁} ⋯ P_{a_k}) · `G5.ntr` (the normalized trace t).
- Theorem names: `g5_u1_r5`, `g5_u1_ras`, `g5_u1_det`, `g5_u1_ge_a`, `g5_u1_trace` (the pattern `g5_<unit>_<row>` is offered to U2–U7, not imposed).
- Deliberately NOT in U1 (each later unit defines what it alone needs): the finite images mod 2, 3, 4; absolute values; rotations and constant words; the hyperbolic predicate; the subgroup ⟨S, T⟩ and conjugacy; any real embedding; any `Preorder`/`LinearOrder` on `ZPhi`.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.det_fin_two_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:814`.

Targeted per row (verdict lines pasted whole in each spec's §4):
- DEFS: `CommRing`, `Matrix`, `Matrix.of`, `Matrix.trace`, `Matrix.det`, `zsmulRec` (FOUND); `goldenRatio` (FOUND, `Real`), `Zsqrtd` (FOUND) — deliberately unused.
- R5: `Matrix.one_fin_two`, `Matrix.mul_fin_two`, `Matrix.neg_of` (FOUND; proof aids).
- RAS: `Matrix.mul_fin_two`, `Matrix.neg_of`, `Matrix.ext_iff` (FOUND).
- DET: `Matrix.det`, `Matrix.det_fin_two_of`, `Matrix.det_fin_two` (FOUND).
- GEa: `Matrix.one_apply`, `Matrix.of_apply`, `Matrix.cons_val_zero` (FOUND).
- TRACE: `Matrix.trace`, `List.prod_map_neg` (FOUND `List`, `(l.map Neg.neg).prod = (-1) ^ l.length * l.prod`), `Matrix.trace_neg`, `Matrix.trace_smul` (FOUND).

**NOT FOUND at the pin:** `List.prod` and `nsmulRec` — both Lean CORE at the pinned toolchain (`Init/Data/List/Basic.lean:2083`, `Init/Data/Zero.lean:51`), resolved in the probe; `Fin.forall_fin_two` and `List.map_congr_left` — tried as proof aids, not found under those names, NOT targeted by any row. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U1/probe.lean`, final sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`; run as `cd ~/Claude/projects/claude-papers-lean && /usr/bin/time -l lake env lean <probe>`; nothing written under the repo's tree. Every spec's §5 Lean text is a byte-for-byte substring of the final probe (checked by script).

| run | revision | exit | first error | maximum resident set size | real |
|---|---|---|---|---|---|
| 1 | rev 1 (`probe-rev1.lean`) | 0 | none (five `declaration uses 'sorry'` warnings, the five theorems) | 4,669,767,680 bytes | 36.55 s |
| 2 | rev 2 (`probe-rev2.lean`: instances named, `norm` → `nrm`, `LT` added) | 0 | none (same five warnings) | 4,706,942,976 bytes | 41.19 s |
| 3 | final (`IsWord` gains `w ≠ []`, k ≥ 1) | 0 | none (same five warnings) | 4,806,836,224 bytes | 25.73 s |

The `CommRing` axiom proofs and both GEb-witness `decide`s elaborate with no error. Logs: `probe-run1.log`, `probe-run2.log`, `probe-run3.log` beside the probe.

## Line counts (the template's one-liner, per spec)

- `specs/G5-U1-DEFS.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-R5.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-RAS.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-DET.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-GEa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-GEb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U1-TRACE.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-U1-DEFS:** that `NonnegAB5`/`RealNonneg` is exactly `sign_ab5(2x + y, y) ≥ 0` (`zphi.py` l. 72–88) in every sign case, including the boundary cases a = 0 > b and a < 0 = b; and whether the `P` filler value `1` off {1, 2, 3, 4} and the non-empty `IsWord` are the conventions V₁ will freeze.
- **G5-U1-R5:** that `-1 : M2` is −I and R is the literal `T * S` (SL, not PSL); nothing else is at stake.
- **G5-U1-RAS:** that `P` is DEFINED by the printed blocks (so R^aS = −P_a has content) and that the entries of each `!![…]` match AM-1-second-head l. 30 / AM l. 32 in order (row-major: P₂ = [[φ, φ], [1, φ]], P₃ = [[φ, 1], [φ, φ]]).
- **G5-U1-DET:** only that the determinant is taken in `ZPhi` (`(1, 0)` in the record is the pair 1 + 0φ).
- **G5-U1-GEa:** the reading — "≥ I" in the REAL order, "entries in ℕ[φ]" as `nonneg` — and that it is no stronger than the record (it is AM §1.1's two clauses conjoined).
- **G5-U1-GEb:** whether V₁ agrees the "over ℕ[φ]" phrase is a defect of wording (CC-CANDIDATE) rather than a reading to be silently dropped; the repair is the wall's.
- **G5-U1-TRACE:** the direction (t on the left, STATEMENTS.md §0's form) and the k ≥ 1 restriction (the second head's "for every k ≥ 1").

## Files

Specs (write path): `~/Claude/projects/claude-papers-lean/specs/` — `G5-U1-DEFS.md`, `G5-U1-R5.md`, `G5-U1-RAS.md`, `G5-U1-DET.md`, `G5-U1-GEa.md`, `G5-U1-GEb.md`, `G5-U1-TRACE.md`, `_UNIT-U1.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U1/probe.lean` (the final probe, the source of every §5 block). Also there: `probe-rev1.lean`, `probe-rev2.lean`, `probe-run{1,2,3}.log`, `gen.py` (the script that wrote the specs, pulling every §2 quote by file and line from the record and every §5 block from the probe).

## Status

SPEC-DRAFT 2026-10-30T10:01:07Z — U1 on disk; U2–U7 may dispatch against the names above.
