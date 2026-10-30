# G5-Aa

## 1 · Header

row: G5-Aa
unit: U3
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:12:04Z; first read 2026-10-30T10:06Z, same digest; §4 Errata included)
locus: `candidates/LEDGER.md` row AM-1, statement column (l. 12); `candidates/checks/AM-1-second-head.md` "Theorem as I would print it" (l. 253–259), §2 (l. 38) and §3 "Closure" (l. 44); AM transcript §3.2 "Theorem A" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128) and §0 (l. 14); DO transcript §1.2 (`…/transcript/depth-operations.md` l. 35); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 9); STATEMENTS.md row G5-A (pointer), §2 notes 2, 4, 5 — the positivity half of the brief's split of G5-A (the y = 0 half is G5-Ab)
spec_clock: 2026-10-30T10:14:20Z

## 2 · Printed statement, verbatim

The theorem as the second head prints it:

> **Theorem.** Let G(5) = ⟨S, T⟩ ⊂ SL(2, ℤ[φ]) with S = (0 −1; 1 0), T = (1 φ; 0 1), R = TS. Put P_a := −R^aS for a = 1, …, 4:
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 253

> P₁ = (1 φ; 0 1), P₂ = (φ φ; 1 φ), P₃ = (φ 1; φ φ), P₄ = (1 0; φ 1).
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 255

> Then for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4},
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 257

> tr(R^{a₁}S ⋯ R^{a_k}S) = (−1)^k (x + yφ) with x, y ∈ ℤ_{≥0},
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 259

Its cleanest form, and the closure it rests on:

> **Cleanest form:** tr(R^{a₁}S⋯R^{a_k}S) ∈ (−1)^k·ℕ[φ].
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 38

> - **Closure.** (a + bφ)(c + dφ) = (ac + bd) + (ad + bc + bd)φ. So ℕ[φ] is closed under + and ×. Every entry of P_a lies in {0, 1, φ}, so every entry of every product, and its trace, lies in ℕ[φ].
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 44

The adopted statement (the ledger), and the seat that proved it:

> **E1 PROVED, unconditionally (claimed):** R^a S = −P_a with P_a entrywise in {0, 1, φ}; the sign-normalized trace (−1)^k tr W = Σ_paths φ^c has x, y ≥ 0 and y = 0 only on the constant words; hence no hyperbolic class of G(5) has an integer trace and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 12

> **Theorem A.** For every cyclic word W = R^{a₁}S⋯R^{a_k}S, (−1)^k tr W = x + yφ with x ≥ 0 and y ≥ 0; and y = 0 if and only if W is (1^k) or (4^k). Consequently no hyperbolic class of G(5) has an integer trace, and Θ(G(5)) ∩ ℤ = {0, ±2}.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 128

> (−1)^k · tr W ∈ ℕ[φ], and its φ-coefficient is 0 only for the constant words (1^k) and (4^k).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 14

The law sheet and the third seat:

> **Theorem A (proved three ways in Phase 1, checked at the wall).** With P_a := −R^aS, P₁ = [[1, φ], [0, 1]], P₂ = [[φ, φ], [1, φ]], P₃ = [[φ, 1], [φ, φ]], P₄ = [[1, 0], [φ, 1]]; for every word, tr(R^{a₁}S ⋯ R^{a_k}S) = (−1)^k · tr(P_{a₁} ⋯ P_{a_k}) = (−1)^k (x + yφ) with x, y ≥ 0, and y = 0 only on the constant words (1^k), (4^k), where x = 2.
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 9

> So x ≥ 0 and y ≥ 0 for every class.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 35

(DO's "class" is a word up to rotation; its t is tr(N_{a₁}⋯N_{a_k}) with N_a := −R^aS = P_a, DO §1.1 l. 22–24.)

## 3 · Formal reading

- **Hypothesis:** `IsWord w` — w a non-empty list (k = `w.length` ≥ 1) with every syllable in {1, 2, 3, 4}: the second head's "for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4}" (l. 257). Words, not classes (STATEMENTS.md §2 note 4): every list is covered, every rotation of it included; no class invariant is used.
- **Claim:** `nonneg (ntr w)` — the normalized trace t = tr(P_{a₁} ⋯ P_{a_k}) (`ntr w`, U1) has both coordinates ≥ 0, i.e. t ∈ ℕ[φ] (`nonneg`, U1; note 5).
- **The literal sign (note 2).** The record's sentence is about the LITERAL word: tr W = (−1)^k (x + yφ) with x, y ≥ 0. U1's `g5_u1_trace` gives `ntr w = (-1) ^ w.length * (W w).trace`; since ((−1)^k)² = 1, the record's (x, y) are exactly the coordinates of `ntr w`. So this row, read together with `g5_u1_trace`, is the record's sentence; on its own it is the second head's "cleanest form" tr W ∈ (−1)^k·ℕ[φ] restated through t (l. 38), and the form STATEMENTS.md row G5-A's Lean notes name as the core ("the word-level theorem (−1)^k tr ∈ ℕ[φ]"). The statement is made on `ntr`, as the brief directs.
- **The route the record gives** (not part of the claim): ℕ[φ] is closed under + and × (l. 44; AM §4 gap 6), every entry of every P_a lies in ℕ[φ] (U1's `g5_u1_ge_a`, first clause), so every entry of the product and its trace lie in ℕ[φ] (AM §3.2 proof, l. 130). No path combinatorics is needed for this half.
- k = 0 is excluded by `IsWord` (the record's population is k ≥ 1; the empty product would give tr I = 2, also in ℕ[φ], but is not stated).

## 4 · Target mathlib declarations (classifier of record, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Matrix.mul_apply	FOUND Matrix Mathlib/Data/Matrix/Mul.lean:298
Fin.sum_univ_two	NOT FOUND — @[to_additive] source Fin.prod_univ_two at Mathlib/Algebra/BigOperators/Fin.lean:111
Fin.prod_univ_two	FOUND Fin Mathlib/Algebra/BigOperators/Fin.lean:111
List.prod_cons	NOT FOUND
List.map_cons	NOT FOUND
```

Notes: `Fin.sum_univ_two` is generated by `@[to_additive]` from `Fin.prod_univ_two` (FOUND, `Fin`, `Mathlib/Algebra/BigOperators/Fin.lean:111`). Lean core at the pinned toolchain `leanprover/lean4:v4.33.0` (the classifier reads mathlib only, hence NOT FOUND): `List.prod_cons` and `List.map_cons` at `Init/Data/List/Basic.lean:2087` and `:478`. All are proof aids for the induction over the list (closure of ℕ[φ] under the 2 × 2 product); the statement itself uses only U1's names and `Matrix.trace` (through `ntr`). No row of this spec is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word (k ≥ 1, syllables in {1, 2, 3, 4}), the normalized trace tr(P_{a₁} ⋯ P_{a_k}) has non-negative rational coefficient and non-negative φ-coefficient.

Probe: `<scratchpad>/M-U3/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole and unedited as the prefix, then this unit's block). **NOT RUN BY THIS SEAT** (brief amendment 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially after the fan lands). The text below is the probe's text byte for byte.

```lean
theorem g5_u3_a_nonneg (w : List ℕ) (hw : IsWord w) : nonneg (ntr w) := by sorry
```

## 6 · What the row does not claim

- Not the y = 0 characterization nor x = 2 on the constant words (G5-Ab).
- Not the group-level corollary — no hyperbolic element has an integer trace; Θ(G(5)) ∩ ℤ = {0, ±2}; the trace set of every element (second head's Corollary, l. 263–267) — which needs the normal-form existence and conjugacy (unit U7).
- Not the closed form x = Σ F_{c−1}, y = Σ F_c over closed paths (second head's Remark, l. 269; DO §1.2), nor any quantitative lower bound (y ≥ F_m, DO l. 43); not the strict cone |t^σ| < |t| (AM §3.3); not the sector or the floor (U4).
- Not the closure of ℕ[φ] under + and × as a separate statement (a proof step on the record, not a row of STATEMENTS.md).
- Nothing about PSL classes; the sign is carried by `g5_u1_trace`. Not the published statement: the record carries the STATEMENT as published (SSW00 Cor. 5 + CW90, LEDGER AM-1 disposition) and the paper claims the proof; the row formalizes the statement, not the citation.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:20Z

V1: V1-GREEN 2026-10-30T10:20:20Z — all eleven §2 cites match their source lines verbatim (script), and the record at the locus (AM-1-second-head l. 257–259, AM l. 128, LEDGER l. 12, PHASE-2-DEFINITIONS l. 9) says "x, y ≥ 0 for every word, k ≥ 1". `nonneg (ntr w)` together with U1's frozen `g5_u1_trace` is that literal sentence: tr W = (−1)^k t because ((−1)^k)² = 1, so the record's (x, y) are t's coordinates. On its own it is the second head's "cleanest form" (l. 38), the core that STATEMENTS.md row G5-A's Lean notes name. I do not freeze the literal form `nonneg ((-1) ^ w.length * (W w).trace)`: it is a one-step rewrite by TRACE, and freezing both forms would add nothing. Conventions confirmed: t is U1's `ntr` (STATEMENTS.md §0), `nonneg` is gap 6, the domain is IsWord (k ≥ 1, the record's population), and it is a statement about words, not classes. Own arithmetic, independent of both trees: 0 violations on all 87,380 words with k ≤ 8. Parse: 0 Lean line(s) over 100 code points
