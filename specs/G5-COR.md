# G5-COR

## 1 · Header

row: G5-COR
unit: U10 `G5/Containment`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T13:02:59Z; equal to the brief's edition — nothing appended since)
source_bytes: 21568 (`wc -c` at 2026-10-30T13:02:59Z; the edition pair `sha256:a84cecdd… · 21568 B`, UPGRADE-697)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U8 `G5.GroupLevel.Challenge` bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd · U3 `G5.WordLevel.Challenge` 69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T13:02:59Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` "Theorem as I would print it", Corollary (l. 263–265); STATEMENTS.md row G5-COR (l. 25) and §2 item 7 (l. 39, the lane's scope: φ − 1 = φ⁻¹ is notation, not on the lane)
spec_clock: 2026-10-30T13:02:59Z

## 2 · Printed statement, verbatim

> **Corollary.** Every element of G(5) has trace in
>
>   {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` "Theorem as I would print it", Corollary, l. 263 and l. 265 (l. 264 blank)

> Every element of G(5) has trace in {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-COR, l. 25, the statement cell (verbatim; the row's wording at the wall's adoption)

> from U8's — φ − 1 = φ⁻¹ (notation: the paper writes ±φ⁻¹ for the pairs ±⟨−1, 1⟩ in Preliminaries)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §2 item 7, l. 39 (a verbatim substring — the notation, and why no inverse theorem is stated)

## 3 · Formal reading

- **The element:** `g : M2ˣ` with `hg : g ∈ HeckeGrp` (U7, frozen), trace `(g : M2).trace : ZPhi`, every element, not every class (as U7's `g5_u7_int_a`, U8's `g5_u8_l2g`).
- **The finite part, {±2, 0, ±φ, ±φ⁻¹}, as seven pairs ⟨x, y⟩ = x + y φ:** ±2 = `⟨2, 0⟩`, `⟨-2, 0⟩` (U7's INTa spelling); 0 = `0`; ±φ = `⟨0, 1⟩` (U1's `phi`), `⟨0, -1⟩`; ±φ⁻¹ = `⟨-1, 1⟩`, `⟨1, -1⟩`. **The record's φ⁻¹ is the pair ⟨−1, 1⟩ = φ − 1** (φ(φ − 1) = φ² − φ = 1); the pair ring has no inverse by name, and the identity φ − 1 = φ⁻¹ is "notation" and "not on the lane" (STATEMENTS.md §2 item 7, l. 39; V₁-U8 struck it from U8, §4 l. 55), so no inverse theorem is stated. These are exactly the values of U8's frozen `g5_u8_ell` (⟨2, 0⟩, 0, ⟨0, 1⟩, ⟨−1, 1⟩, ⟨1, −1⟩, ⟨0, −1⟩) closed under negation, so the L seat rewrites with it directly.
- **The infinite part, {±(x + yφ) : x ≥ 0, y ≥ 1}:** `∃ x y : ℤ, 0 ≤ x ∧ 1 ≤ y ∧ (tr = ⟨x, y⟩ ∨ tr = -⟨x, y⟩)` — x, y integers (the record's x + yφ ∈ ℤ[φ]), the ± written as the literal negation `-(⟨x, y⟩ : ZPhi)`.
- **The union** is the outer disjunction; membership in the finite set is the inner disjunction of seven equalities (the house form of U7's INTa), not a `Set` literal.
- **SL, the literal lift:** both parts are closed under negation, so the SL statement over every unit of `HeckeGrp` is the PSL statement (−I = S² ∈ ⟨S, T⟩).
- **The proof route on the record (for the L seat; the pieces named by the row):** `g5_u7_nf` + trace a conjugation invariant (`Matrix.trace_mul_cycle`, `Units.val_mul`, `Units.mul_inv`) + `Matrix.trace_neg`; the non-word forms by `g5_u8_ell`; ±W w by U1's `g5_u1_trace` (tr W = (−1)^k ntr w) and U3's `g5_u3_a_nonneg` (x, y ≥ 0) with `g5_u3_a_y_eq_zero` (y = 0 only on constant words, where x = 2, giving ±⟨2, 0⟩).

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.mul_inv	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:201
Units.val_inv_eq_inv_val	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:280
```

- Targeted by the statement: `Matrix.trace` (with U7's `HeckeGrp`, U1's `ZPhi` and its anonymous constructor). The rest are proof aids.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: the trace of every unit g of `M2` in ⟨S, T⟩ is one of 2, −2, 0, φ, −φ, φ − 1, 1 − φ, or is ±(x + yφ) for integers x ≥ 0 and y ≥ 1.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U10.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the probe's one theorem).

```lean
/-- G5-COR (the Corollary's containment). Every element of `⟨S, T⟩` has trace in
`{±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + y φ) : x ≥ 0, y ≥ 1}`, with `φ⁻¹` the pair `⟨−1, 1⟩ = φ − 1`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it",
Corollary (l. 263–265); STATEMENTS.md row G5-COR (l. 25).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u10_cor (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ((g : M2).trace = (⟨2, 0⟩ : ZPhi) ∨ (g : M2).trace = (⟨-2, 0⟩ : ZPhi) ∨
      (g : M2).trace = 0 ∨
      (g : M2).trace = (⟨0, 1⟩ : ZPhi) ∨ (g : M2).trace = (⟨0, -1⟩ : ZPhi) ∨
      (g : M2).trace = (⟨-1, 1⟩ : ZPhi) ∨ (g : M2).trace = (⟨1, -1⟩ : ZPhi)) ∨
    ∃ x y : ℤ, 0 ≤ x ∧ 1 ≤ y ∧
      ((g : M2).trace = (⟨x, y⟩ : ZPhi) ∨ (g : M2).trace = -(⟨x, y⟩ : ZPhi)) := by sorry
```

## 6 · What the row does not claim

- The Corollary's "In particular" (l. 267: no hyperbolic element has a rational-integer trace; Θ(G(5)) ∩ ℤ = {0, ±2}) is not restated — U7's `g5_u7_int_a` / `g5_u7_int_b` carry it.
- No realization: the containment is one direction; nothing says every listed value occurs (U7's INTb for 0, ±2; U7's PHIc for nφ).
- No inverse identity φ(φ − 1) = 1 (§2 item 7: notation, not on the lane); no hyperbolicity reading; no class statement.

## 7 · Status

SPEC-DRAFT 2026-10-30T13:02:59Z
