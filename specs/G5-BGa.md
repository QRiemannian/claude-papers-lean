# G5-BGa

## 1 · Header

row: G5-BGa
unit: U9 `G5/SectorGroup`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T13:02:59Z; equal to the brief's edition — nothing appended since)
source_bytes: 21568 (`wc -c` at 2026-10-30T13:02:59Z; the edition pair `sha256:a84cecdd… · 21568 B`, UPGRADE-697)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U4 `G5.Sector.Challenge` df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T13:02:59Z matches)
locus: `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1 "Theorem B" (l. 43); STATEMENTS.md row G5-BG (l. 24, the sector clause; the third column names TA l. 43 and l. 47 and the word-level rows G5-B, U4) and §2 item 7 (l. 39, the lane's scope)
spec_clock: 2026-10-30T13:02:59Z

## 2 · Printed statement, verbatim

> **Theorem B (the sector; WORKED OUT HERE).** Every hyperbolic trace, normalized t > 0, satisfies y ≥ 1 and 0 ≤ x ≤ y + 2. More precisely x − y = f_0 − f_1 − Σ_{j≥3} f_j F_{j−2} ≤ f_0 ≤ 2.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1, l. 43 (the whole line)

> Every hyperbolic element g of G(5) (|tr g| > 2) has, after sign normalization t = ±tr g > 0, t = x + yφ with y ≥ 1 and 0 ≤ x ≤ y + 2, and 11·|t^σ| ≤ (17 − 7φ)·t in the real order.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-BG, l. 24, the statement cell (a verbatim substring; the row's wording at the wall's adoption, 2026-10-30T12:52:09Z — this spec reads its sector clause "t = x + yφ with y ≥ 1 and 0 ≤ x ≤ y + 2")

## 3 · Formal reading

- **The element.** `g : M2ˣ` with `hg : g ∈ HeckeGrp` — U7's `Subgroup M2ˣ` ⟨S, T⟩ (frozen), its matrix the coercion `(g : M2)`, its trace `(g : M2).trace : ZPhi` (`Matrix.trace`), exactly as U7's `g5_u7_int_a` and U8's `g5_u8_l2g` write it. Every element, not every class: no conjugacy appears in the statement.
- **Hyperbolicity — the ONE definitional choice, for V₁'s signature.** The record's "hyperbolic element g of G(5) (|tr g| > 2)" is read as a predicate on the TRACE, `2 < rabs (g : M2).trace`, never on the element (no fixed points, no Jordan form). `rabs` is U4's frozen `ZPhi.rabs t = if RealNonneg t then t else -t`; `<` is U1's strict real order (`instLT`: `s ≤ t ∧ s ≠ t`, with `s ≤ t ↔ RealNonneg (t - s)`, the exact sign of a + b√5). The literal `2 : ZPhi` is the numeral (`OfNat` through the ring's `NatCast`), as U5 writes `2 * phi`.
- **The sign normalization.** The record's "after sign normalization t = ±tr g > 0" is `t := rabs (g : M2).trace`. Under the hypothesis `2 < rabs tr`, tr ≠ 0, so `rabs tr` is tr when tr > 0 and −tr when tr < 0 — the brief's "t = tr g if tr g > 0, else −tr g" with no case left over; `rabs` is used (not a new local definition) because U9 defines nothing.
- **The coordinates.** `t = x + y φ` with `x = t.x`, `y = t.y` (U1's structure fields; pairs ⟨x, y⟩ with (x, y)(u, v) = (xu + yv, xv + yu + yv)). The conclusion `1 ≤ t.y ∧ 0 ≤ t.x ∧ t.x ≤ t.y + 2` is U4's `g5_u4_ba` conclusion with `ntr w` replaced by `t` — the record's "y ≥ 1 and 0 ≤ x ≤ y + 2" on integers.
- **SL, the literal lift** (STATEMENTS.md §2 note 2): the record's G(5) sits in PSL(2, ℝ), where tr g is defined up to sign; `rabs` makes the hypothesis and the conclusion invariant under g ↦ −g, and −I = S² lies in ⟨S, T⟩, so the SL reading over every unit of `HeckeGrp` is the same statement.
- **The proof route on the record (for the L seat, not part of the statement):** `g5_u7_nf` gives h ∈ `HeckeGrp` with h g h⁻¹ in a form of `IsNF`; trace is a conjugation invariant (`Matrix.trace_mul_cycle` / `Matrix.trace_mul_comm` with `Units.val_mul`, `Units.mul_inv`); the non-word forms have traces ±⟨2, 0⟩, 0, ±⟨0, 1⟩, ±⟨−1, 1⟩ (U8's `g5_u8_ell` with `Matrix.trace_neg`), none with `2 < rabs` (own exact arithmetic, `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/check.py`); the constant words have t = 2 (U3's `g5_u3_a_y_eq_zero` through U1's `g5_u1_trace`), not hyperbolic; so ±W w with w non-constant, where `rabs (tr (±W w)) = ntr w` (U1's `g5_u1_trace`, U3's `g5_u3_a_nonneg`), then U4's `g5_u4_ba`. The route names U8 and U3 theorems; the STATEMENTS row names the Challenge imports as U1, U7, U4, so the statement file imports those three and the Solution may import more.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.mul_inv	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:201
Units.val_inv_eq_inv_val	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:280
```

- Targeted by the statement: `Matrix.trace` (with U7's `HeckeGrp`, U4's `ZPhi.rabs`, U1's `ZPhi` fields and order). The rest are proof aids for the conjugation route.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every unit g of `M2` in ⟨S, T⟩ (`HeckeGrp`) whose trace exceeds 2 in absolute value in the real order, the sign-normalized trace t = |tr g| has φ-coefficient ≥ 1 and integer part between 0 and its φ-coefficient plus 2.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U9.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (one of the probe's two theorems).

```lean
/-- G5-BGa (Theorem B at element level, the sector). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, after sign normalization `t = |tr g|`,
`t = x + y φ` with `y ≥ 1` and `0 ≤ x ≤ y + 2`.
Locus: TA transcript §1 "Theorem B" (l. 43); STATEMENTS.md row G5-BG (l. 24).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u9_bg_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    1 ≤ (rabs (g : M2).trace).y ∧ 0 ≤ (rabs (g : M2).trace).x ∧
      (rabs (g : M2).trace).x ≤ (rabs (g : M2).trace).y + 2 := by sorry
```

## 6 · What the row does not claim

- The θ bound is G5-BGb (the split, §"Split" of `_UNIT-U9.md`); this spec carries the sector only.
- No equality family at element level (U4's `g5_u4_bb` / `g5_u4_bb_tr`: x = y + 2 exactly on rotations of 1^a 4^b) and no "maximum attained only at 3 + φ" — the row G5-BG states the inequalities only.
- No word-level statement (U4's `g5_u4_ba` carries it, frozen); no statement about classes or conjugacy; nothing about elliptic or parabolic elements (they fall outside the hypothesis).
- TA l. 43's "More precisely x − y = f_0 − f_1 − Σ … ≤ f_0 ≤ 2" (the path-count identity) is proof-internal and not stated.

## 7 · Status

SPEC-DRAFT 2026-10-30T13:02:59Z
