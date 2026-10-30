# G5-U7-INTa

## 1 · Header

row: G5-U7-INTa
unit: U7
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:13:11Z; §4 Errata included)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-1, statement column (l. 12); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` "Theorem as I would print it" Corollary (l. 263–267) and §4 (l. 73–77); AM transcript §3.2 Theorem A (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128); STATEMENTS.md row G5-A (l. 15, pointer). SPLIT of the brief's G5-U7-INT: half a, the inclusion Θ ∩ ℤ ⊆ {0, ±2}
spec_clock: 2026-10-30T10:17:01Z

## 2 · Printed statement, verbatim

> **E1 PROVED, unconditionally (claimed):** R^a S = −P_a with P_a entrywise in {0, 1, φ}; the sign-normalized trace (−1)^k tr W = Σ_paths φ^c has x, y ≥ 0 and y = 0 only on the constant words; hence no hyperbolic class of G(5) has an integer trace and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 12

> **Corollary.** Every element of G(5) has trace in
>
>   {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}.
>
> In particular no hyperbolic element of G(5) has a rational-integer trace, and Θ(G(5)) ∩ ℤ = {0, ±2}: 0 from the elliptic involution, ±2 from the identity and the parabolic elements.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 263–267

> - **The non-hyperbolic traces.**
>   - Elliptic: 0 (±S), and ±φ, ±φ⁻¹ (±R^a, from the table in §1).
>   - Identity and parabolic: ±2.
>   - Of these, only 0 and ±2 are integers.
> - **Conclusion.** Integer traces are exactly {0, ±2}, and no hyperbolic element has a rational-integer trace. Uniqueness of the normal form would be needed only to say which words are distinct classes, and the theorem does not use that.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 73–77

> **Theorem A.** For every cyclic word W = R^{a₁}S⋯R^{a_k}S, (−1)^k tr W = x + yφ with x ≥ 0 and y ≥ 0; and y = 0 if and only if W is (1^k) or (4^k). Consequently no hyperbolic class of G(5) has an integer trace, and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128

## 3 · Formal reading

- **Domain.** Every g ∈ `HeckeGrp` (G5-U7-NF) — every element, not only every class (second head l. 72: "the statement covers every element of G(5) in SL and in PSL"); the trace is `Matrix.trace` of the underlying matrix `(g : M2)`, the literal SL trace (design note 2). The group contains −I, so the trace set is sign-symmetric and the PSL reading "up to sign" changes nothing.
- **"t ∈ ℤ"** is read in the ring as `phiCoeff t = 0` (t = x + 0·φ): ℤ ⊂ ℤ[φ] as the pairs ⟨x, 0⟩; in the pair ring the φ-coefficient is exact and no irrationality of φ is needed (design note 1; AM gap 1).
- **Conclusion.** t ∈ {0, 2, −2}, written as `0`, `(⟨2, 0⟩ : ZPhi)`, `(⟨-2, 0⟩ : ZPhi)` (explicit pairs, so no numeral cast enters the statement).
- **The record's "Θ(G(5)) ∩ ℤ = {0, ±2}" is an equality; this row is its ⊆ half; the ⊇ half (realization) is G5-U7-INTb.** The record's companion clause "no hyperbolic element of G(5) has a rational-integer trace" is subsumed: an integer trace lies in {0, ±2}, of absolute value ≤ 2; no hyperbolic predicate is defined in U7.
- **The citation (hypothesis-free; the L seat imports).** The statement carries no hypothesis from U3. The proof route the record gives (second head §4; AM §3.2 last sentence): G5-U7-NF (`g5_u7_nf`) → the trace is a class function → U1's `g5_u1_trace` (t = (−1)^k tr W) → U3's word-level y = 0 characterization (Theorem A, row G5-Ab; U3's spec `specs/G5-Ab.md` (SPEC-DRAFT, `_UNIT-U3.md` closed 2026-10-30T10:15:14Z) names it `g5_u3_a_y_eq_zero`: `(ntr w).y = 0 ↔` the word is constant 1 or constant 4, and then `(ntr w).x = 2` — the L seat uses U3's name as frozen) → the traces of ±I, ±S, ±R^a: ±2, 0, ±φ, ±φ⁻¹ (second head §1 table l. 26: tr R^a = φ, φ − 1, 1 − φ, −φ), whose integers are 0, ±2.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.val_inv_eq_inv_val	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:280
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Matrix.trace_one	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:146
```

- All FOUND. `Matrix.trace_mul_cycle` (`trace (A * B * C) = trace (C * A * B)`, `NonUnitalCommSemiring`) carries "the trace is a class function" for h g h⁻¹; `Units.val_mul` moves the product out of `M2ˣ`; `Matrix.trace_neg` the ± forms; `Matrix.trace_one` tr I = 2 (as `Fintype.card (Fin 2) • 1`, which the prover reduces to ⟨2, 0⟩).
- Lab names cited (not mathlib): `g5_u7_nf` (this unit), `g5_u1_trace` (U1), U3's y = 0 theorem `g5_u3_a_y_eq_zero` (spec G5-Ab).
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: every element of ⟨S, T⟩ whose trace has φ-coefficient 0 has trace 0, 2 or −2.

Probe: `<scratchpad>/M-U7/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, whole and unedited, then the U7 block; the probe's sha256 is recorded in `_UNIT-U7.md`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` from an M seat); the orchestrator elaborates it and returns any error to the row. The text below is the probe's text byte for byte.

Read after `open G5 ZPhi` and the U7 definitions block (`HeckeGrp`, `IsNF`; spec G5-U7-NF §5).

```lean
theorem g5_u7_int_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hy : phiCoeff (g : M2).trace = 0) :
    (g : M2).trace = 0 ∨ (g : M2).trace = (⟨2, 0⟩ : ZPhi) ∨
      (g : M2).trace = (⟨-2, 0⟩ : ZPhi) := by sorry
```

## 6 · What the row does not claim

- Not the realization of 0, 2, −2 (G5-U7-INTb).
- Not the printed Corollary's stronger containment "every element of G(5) has trace in {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}" (l. 263–265): on the record, but outside the brief's U7 cut; listed in `_UNIT-U7.md` for V₁ (OPEN, not specced).
- No hyperbolic predicate, no real order, no PSL quotient; nothing about which integer traces are elliptic or parabolic beyond the set {0, ±2}.
- No literature claim: the STATEMENT is published (ledger AM-1: SSW00 Cor. 5 + CW90); this row formalizes the statement and is silent on the route.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:01Z
