# G5-U1-GEa

## 1 · Header

row: G5-U1-GEa
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: AM transcript §5.1 "Pruning lemma" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198) and §1.1 (l. 34); TA transcript §1 "Lemma 3" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 51); DO transcript §2 "Lemma L1" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 60); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.1 (l. 176); STATEMENTS.md row G5-MONO, first clause (pointer), and §2 note 6 — the split half of the brief's identity "P_a ≥ I entrywise over ℕ[φ]" that the record carries as true (see G5-U1-GEb for the other half)
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim

> every P_a has real-nonnegative entries
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198

(the opening of §5.1's "Pruning lemma (WORKED OUT HERE)")

> Every entry lies in {0, 1, φ} ⊂ ℕ[φ]; every P_a has determinant 1; every P_a − I has real-nonnegative entries (φ − 1 > 0). (P_a − I does NOT have entries in ℕ[φ] for a = 2, 3, since φ − 1 = −1 + φ; see the correction note in §1.2.)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34

> Each A_a(φ) ≥ I entrywise with non-negative entries
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 51

(TA's A_a(φ) is P_a: TA §1 "Fact 0", l. 30, records `A_a(phi) == -M_a` with M_a = R^aS.)

> **Lemma L1 (WORKED OUT HERE).** Each N_a ≥ I entrywise. For non-negative P, P·N_a ≥ P, so tr(P N_a) ≥ tr P. The trace of a sequence therefore dominates the trace of each of its prefixes.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 60

(DO's N_a := −R^aS, DO §1.1 l. 22–23, is P_a.)

> The inequality holds because BA ≥ 0 and P_a − I ≥ 0 entrywise.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 176

## 3 · Formal reading

- For each a ∈ {1, 2, 3, 4} and each entry (i, j): (i) the entry P_a(i, j) lies in ℕ[φ] (`nonneg`: both coefficients ≥ 0) — the record's "Every entry lies in {0, 1, φ} ⊂ ℕ[φ]" and TA's "with non-negative entries"; (ii) I(i, j) ≤ P_a(i, j) in the REAL order of G5-U1-DEFS (the exact sign of a + b√5) — the record's "P_a − I real-nonnegative entries" (AM §1.1, §5.1), "≥ I entrywise" (TA Lemma 3, DO L1), "P_a − I ≥ 0 entrywise" (SH-P2-1 §3.1, whose inequality is the real one: it concludes tr(A P_a B) ≥ tr(AB) as a real inequality).
- This is the reading the record carries as TRUE. The other reading of the brief's words — P_a − I with entries in ℕ[φ] — is the row G5-U1-GEb, stopped.
- Literal matrices; I is `1 : M2`.

## 4 · Target mathlib declarations

```
Matrix.one_apply	FOUND Matrix Mathlib/Data/Matrix/Diagonal.lean:234
Matrix.of_apply	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:92
Matrix.cons_val_zero	FOUND Matrix Mathlib/Data/Fin/VecNotation.lean:126
```

(`Fin.forall_fin_two` was tried as a proof aid and reads NOT FOUND at the pin under that name; it is not targeted. A proof can close by `decide` per entry: the probe closes the a = 2, (0, 0) instance of clause (ii) by `decide`.)

## 5 · Intended Lean statement

In prose: for a = 1, 2, 3, 4 and every entry (i, j), the entry of P_a lies in ℕ[φ] and is ≥ the corresponding entry of the identity in the real order.

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
theorem g5_u1_ge_a (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) (i j : Fin 2) :
    nonneg (P a i j) ∧ (1 : M2) i j ≤ P a i j := by sorry
```

## 6 · What the row does not claim

- NOT that P_a − I has entries in ℕ[φ] (false for a = 2, 3: G5-U1-GEb).
- Not the monotonicity consequences (tr(A P_a B) ≥ tr(AB); prefix domination; the ≥ φ increments) — those are G5-MONO's later clauses, unit U5.

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z
