# G5-U1-DET

## 1 · Header

row: G5-U1-DET
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 23); AM transcript §1.1 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34); `phase-0/DEFINITIONS.md` §1 (l. 12) and §3 (C-i); STATEMENTS.md §2 note 6 (U1: "det 1")
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim

> | det P_a | (1, 0) for all four |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 23

(the table row of §1 "The matrices — CONFIRMED", columns check | result; (1, 0) is the pair 1 + 0φ)

> every P_a has determinant 1
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34

## 3 · Formal reading

- For each a ∈ {1, 2, 3, 4}, the determinant of the printed block P_a, computed in `ZPhi`, is 1 = ⟨1, 0⟩.
- `Matrix.det` over the commutative ring `ZPhi` (G5-U1-DEFS's instance).

## 4 · Target mathlib declarations

```
Matrix.det	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:60
Matrix.det_fin_two_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:814
Matrix.det_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:807
```

## 5 · Intended Lean statement

In prose: det P_a = 1 for a = 1, 2, 3, 4.

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
theorem g5_u1_det (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : (P a).det = 1 := by sorry
```

## 6 · What the row does not claim

- Not the control (C-i) "det W = 1 for every product" (that follows by multiplicativity but is not this row); not det S = det T = 1.

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z
