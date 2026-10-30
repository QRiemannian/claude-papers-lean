# G5-U1-RAS

## 1 · Header

row: G5-U1-RAS
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: `candidates/checks/AM-1-second-head.md` §1 (l. 22, l. 28–32) and "Theorem as I would print it" (l. 253–255); AM transcript §1.1 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 28, l. 32); `candidates/LEDGER.md` row AM-1 (l. 12); STATEMENTS.md §0 and §2 note 6 (U1: "R^aS = −P_a")
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim

> | R^aS = −P_a, a = 1..4 | all four True, entrywise |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 22

(the table row of §1 "The matrices — CONFIRMED", columns check | result), with the blocks it compares against:

> (1 φ; 0 1), (φ φ; 1 φ), (φ 1; φ φ), (1 0; φ 1).
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 30

> These are exactly P₁, P₂, P₃, P₄.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 32

>   R^a S = s_a RS − s_{a−1} S = −(s_a T + s_{a−1} S) =: −P_a,
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 28

>   P₁ = [[1, φ], [0, 1]] = T,  P₂ = [[φ, φ], [1, φ]],  P₃ = [[φ, 1], [φ, φ]],  P₄ = [[1, 0], [φ, 1]] =: L.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 32

> R^a S = −P_a with P_a entrywise in {0, 1, φ}
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 12

## 3 · Formal reading

- For each a ∈ {1, 2, 3, 4}: the literal matrix R^a S equals the negative of the printed block P_a (G5-U1-DEFS defines `P a` as the printed matrix, so the record's definition P_a := −R^aS becomes this identity).
- Domain: a : ℕ with 1 ≤ a ≤ 4 (the record's a = 1..4). Entrywise equality in `M2`.
- Literal SL matrices; no sign is quotiented.

## 4 · Target mathlib declarations

```
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
Matrix.neg_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:340
Matrix.ext_iff	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:69
```

## 5 · Intended Lean statement

In prose: for a = 1, 2, 3, 4, R^a S = −P_a.

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
theorem g5_u1_ras (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : R ^ a * S = -P a := by sorry
```

## 6 · What the row does not claim

- Nothing for a ∉ {1, 2, 3, 4} (at a = 0 the left side is S and `P 0` is the filler `1`; the hypothesis excludes it). Not the general Hecke form P_a = [[s_a, s_{a+1}], [s_{a−1}, s_a]] of AM §1.1 (an intermediate of the record's derivation, not a statement on the list).
- "Entrywise in {0, 1, φ}" (the ledger's clause) is not part of this row; its ℕ[φ] content is carried by G5-U1-GEa.

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z
