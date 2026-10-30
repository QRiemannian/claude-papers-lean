# G5-Ab

## 1 · Header

row: G5-Ab
unit: U3
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:12:04Z; first read 2026-10-30T10:06Z, same digest; §4 Errata included)
locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it" (l. 257–261) and §3 "Constant words" (l. 60), l. 63; AM transcript §3.2 "Theorem A" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128) and §0 (l. 14); `candidates/LEDGER.md` row AM-1, statement column (l. 12); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 9); STATEMENTS.md row G5-A (pointer), §2 notes 2, 4 — the y = 0 half of the brief's split of G5-A (the positivity half is G5-Aa)
spec_clock: 2026-10-30T10:14:20Z

## 2 · Printed statement, verbatim

The theorem as the second head prints it (the clause after the positivity display):

> Then for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4},
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 257

> tr(R^{a₁}S ⋯ R^{a_k}S) = (−1)^k (x + yφ) with x, y ∈ ℤ_{≥0},
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 259

> and y = 0 if and only if a₁ = ⋯ = a_k ∈ {1, 4}, in which case x = 2.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 261

The seat that proved it:

> **Theorem A.** For every cyclic word W = R^{a₁}S⋯R^{a_k}S, (−1)^k tr W = x + yφ with x ≥ 0 and y ≥ 0; and y = 0 if and only if W is (1^k) or (4^k). Consequently no hyperbolic class of G(5) has an integer trace, and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128

> (−1)^k · tr W ∈ ℕ[φ], and its φ-coefficient is 0 only for the constant words (1^k) and (4^k).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 14

The adopted statement and the law sheet (the "only" direction, with x = 2):

> **E1 PROVED, unconditionally (claimed):** R^a S = −P_a with P_a entrywise in {0, 1, φ}; the sign-normalized trace (−1)^k tr W = Σ_paths φ^c has x, y ≥ 0 and y = 0 only on the constant words; hence no hyperbolic class of G(5) has an integer trace and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 12

> **Theorem A (proved three ways in Phase 1, checked at the wall).** With P_a := −R^aS, P₁ = [[1, φ], [0, 1]], P₂ = [[φ, φ], [1, φ]], P₃ = [[φ, 1], [φ, φ]], P₄ = [[1, 0], [φ, 1]]; for every word, tr(R^{a₁}S ⋯ R^{a_k}S) = (−1)^k · tr(P_{a₁} ⋯ P_{a_k}) = (−1)^k (x + yφ) with x, y ≥ 0, and y = 0 only on the constant words (1^k), (4^k), where x = 2.
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 9

The constant words and the gap the second head checked:

> - **Constant words.** (1^k) gives P₁^k = (1 kφ; 0 1), trace 2. (4^k) likewise gives trace 2. Literal trace is (−1)^k·2.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 60

> The careless-reading gap the brief warns about does not occur. "No φ on any nonzero path" fails in case (i) by the state-1 path, and in case (ii) by the jump pair. So y = 0 forces a constant word, including at k = 1.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 63

## 3 · Formal reading

- **Hypothesis:** `IsWord w` (k ≥ 1, syllables in {1, 2, 3, 4}), as in G5-Aa; words, not classes (note 4).
- **y and x:** y = `(ntr w).y` (U1's `phiCoeff`, by definition `.y`) and x = `(ntr w).x`, the coordinates of the normalized trace t. As in G5-Aa, these are the record's (x, y) of tr W = (−1)^k (x + yφ), through `g5_u1_trace`.
- **"a₁ = ⋯ = a_k ∈ {1, 4}"** (l. 261) — equivalently AM's "W is (1^k) or (4^k)" — is read as `(∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)`: every syllable is 1, or every syllable is 4. (Equivalent to `w = List.replicate w.length 1 ∨ w = List.replicate w.length 4`; the ∀-form is used so that the unit defines nothing new.) The words (1) and (4) at k = 1 are included, as on the record (l. 61: "(1) and (4) are RS = −T and R⁴S = −L, with literal trace −2").
- **Claim, two conjuncts:** (i) y = 0 ⟺ the word is constant 1 or constant 4 — the second head's and AM §3.2's "if and only if"; the ledger and the law sheet print the "only" direction, and the "if" direction is their "where x = 2" computation (tr P₁^k = tr P₄^k = 2, l. 60); (ii) on a constant-1 or constant-4 word, x = 2 — the second head's "in which case x = 2" and the law sheet's "where x = 2". AM §3.2 prints only (i) in its statement and gives tr P₁^k = tr P₄^k = 2 in its proof (l. 130).
- Clause (ii) is stated with the constant-word condition as its hypothesis ("in which case"); given (i) this is the same as hypothesis y = 0.

## 4 · Target mathlib declarations (classifier of record, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
Matrix.trace_fin_two_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:232
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
List.forall_mem_cons	NOT FOUND
List.eq_replicate_iff	NOT FOUND
List.replicate	NOT FOUND
```

Notes: `List.forall_mem_cons`, `List.eq_replicate_iff` and `List.replicate` are Lean core at the pinned toolchain `leanprover/lean4:v4.33.0` (`Init/Data/List/Lemmas.lean:421`, `Init/Data/List/Lemmas.lean:2276`, `Init/Data/List/Basic.lean:706`); `List.replicate` is not used by the statement (the ∀-form is), only named for the equivalent reading. `Matrix.mul_fin_two` and `Matrix.trace_fin_two_of` carry the constant-word computation P₁^k = (1 kφ; 0 1) (l. 60). The y ≥ 1 direction is the record's two explicit closed paths (AM §4 gap 6: "an explicit lower bound on two entries"), which need no mathlib declaration beyond `Matrix.mul_apply` (G5-Aa §4). No row of this spec is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word (k ≥ 1, syllables in {1, 2, 3, 4}), the φ-coefficient of the normalized trace is 0 if and only if every syllable is 1 or every syllable is 4; and for such a constant word the rational coefficient is 2.

Probe: `<scratchpad>/M-U3/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole and unedited as the prefix, then this unit's block). **NOT RUN BY THIS SEAT** (brief amendment 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially after the fan lands). The text below is the probe's text byte for byte.

```lean
theorem g5_u3_a_y_eq_zero (w : List ℕ) (hw : IsWord w) :
    ((ntr w).y = 0 ↔ (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)) ∧
      ((∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4) → (ntr w).x = 2) := by sorry
```

## 6 · What the row does not claim

- Not positivity x, y ≥ 0 (G5-Aa); the two together give y ≥ 1 off the constant words, which this row does not state separately.
- Not that the constant words are parabolic, nor the law sheet's "hyperbolic ⟺ y ≥ 1" (`phase-2/PHASE-2-DEFINITIONS.md` l. 9): no hyperbolic predicate (|tr| > 2) is defined or used here.
- Not the group-level corollary (no hyperbolic integer trace; Θ(G(5)) ∩ ℤ = {0, ±2}) — unit U7.
- Not the quantitative forms (y ≥ 2F_m with m syllables in {2, 3} and y ≥ c₁c₄, TA l. 40; y ≥ F_{n₂₃}, DO l. 43), nor the floor |y| ≥ k − 1 (G5-F, U4), nor the φ-line (G5-PHI).
- Nothing about the words (2^k), (3^k): they are not constant in the row's sense and the row says only that their y is nonzero.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:20Z
