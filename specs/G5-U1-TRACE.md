# G5-U1-TRACE

## 1 · Header

row: G5-U1-TRACE
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: `phase-2/PHASE-2-DEFINITIONS.md` §1 "Theorem A" paragraph (l. 9); AM transcript §1.1 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 37); `candidates/checks/AM-1-second-head.md` §2 (l. 36) and "Theorem as I would print it" (l. 253–257); STATEMENTS.md §0 ("Normalized trace t := tr(P_{a₁} ⋯ P_{a_k}) = (−1)^k tr W", pointer)
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim

> tr W = tr((−P_{a₁})⋯(−P_{a_k})) = (−1)^k tr(P_{a₁}⋯P_{a_k}).
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 36

> So **tr W = (−1)^k tr(P_{a₁}⋯P_{a_k})**
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 37

> for every word, tr(R^{a₁}S ⋯ R^{a_k}S) = (−1)^k · tr(P_{a₁} ⋯ P_{a_k})
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 9

> **The normalized trace** of a class is t := tr(P_{a₁} ⋯ P_{a_k})
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 9

## 3 · Formal reading

- Hypothesis: `IsWord w` — w a non-empty list (k = `w.length` ≥ 1) with every syllable in {1, 2, 3, 4} (the second head's "for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4}").
- Claim: t := tr(P_{a₁} ⋯ P_{a_k}) (`ntr w`) equals (−1)^k · tr(R^{a₁}S ⋯ R^{a_k}S) (`W w`), in `ZPhi`, (−1) the ring element.
- The record writes the identity in both directions (tr W = (−1)^k t and t = (−1)^k tr W); they are equivalent since ((−1)^k)² = 1. The proposed form follows STATEMENTS.md §0 (t on the left).
- Literal words (design note 2): the sign (−1)^k is a statement about the literal product, not about a PSL class.

## 4 · Target mathlib declarations

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
List.prod_map_neg	FOUND List Mathlib/Algebra/BigOperators/Ring/List.lean:47
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Matrix.trace_smul	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:68
```

(`List.prod_map_neg` at the pin reads `(l.map Neg.neg).prod = (-1) ^ l.length * l.prod`, in a `Monoid` with `HasDistribNeg`; with G5-U1-RAS it carries the proof. `List.prod` itself is Lean core, `Init/Data/List/Basic.lean:2083`.)

## 5 · Intended Lean statement

In prose: for every word (k ≥ 1, syllables in {1, 2, 3, 4}), the normalized trace tr(P_{a₁} ⋯ P_{a_k}) equals (−1)^k times the trace of the literal word R^{a₁}S ⋯ R^{a_k}S.

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
theorem g5_u1_trace (w : List ℕ) (hw : IsWord w) :
    ntr w = (-1) ^ w.length * (W w).trace := by sorry
```

## 6 · What the row does not claim

- Not the matrix identity P_{a₁} ⋯ P_{a_k} = (−1)^k W (true, the record's proof step, not its statement); not positivity of t, not x, y ≥ 0 (Theorem A, U3); nothing about conjugacy classes or rotations (the identity is per word).
- Not the k = 0 case (excluded by `IsWord`; it would read tr I = tr I).

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z
