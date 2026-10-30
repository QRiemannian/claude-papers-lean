# G5-Ba

## 1 · Header

row: G5-Ba
unit: U4
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:09Z)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-2 (l. 13; the inequality half, whose verdict reads INEQUALITY HOLDS); TA transcript §1 "Theorem B" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 43–44); AM transcript §3.4 "Theorem B" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 141); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §6 "The slip" (l. 183); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "Theorem B: HOLDS" (l. 70–73); STATEMENTS.md row G5-B (l. 16; pointer) and its Lean note "the inequality part first" — the SPLIT half a of G5-B (the inequality)
spec_clock: 2026-10-30T10:17:51Z

## 2 · Printed statement, verbatim

> **Theorem B (the sector; WORKED OUT HERE).** Every hyperbolic trace, normalized t > 0, satisfies y ≥ 1 and 0 ≤ x ≤ y + 2. More precisely x − y = f_0 − f_1 − Σ_{j≥3} f_j F_{j−2} ≤ f_0 ≤ 2.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 43

> *Proof.* x − y = f_0 + Σ_{j≥1} f_j (F_{j−1} − F_j) = f_0 − f_1 − Σ_{j≥2} f_j F_{j−2}; F_0 = 0 kills j = 2. Lemma 2. ∎
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 44

> The wedge: after sign normalization 0 ≤ x ≤ y + 2; equivalently −t/φ² ≤ t^σ ≤ t/φ⁴ + 2√5/φ²; both edges realized (nφ by the ladder words; (n + 2) + nφ by (1, 4^n)). Sharpens the cone |t^σ| ≤ |t|.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 13

(the same row's verdict cell: "INEQUALITY HOLDS (0 violations, 182,469 values, both trees)")

> **Theorem B.** For every non-elliptic element, the sign-normalized trace x + yφ satisfies **0 ≤ x ≤ y + 2**.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 141

> The inequality 0 ≤ x ≤ y + 2 HOLDS, with 0 violations, and the proof of the inequality is right.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 183

> - The j = 2 term vanishes (F₀ = 0). So x − y = f₀ − f₁ − Σ_{j≥3} f_j F_{j−2} ≤ f₀ ≤ 2.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 72

> - x ≥ 0 comes from Lemma 1, and y ≥ 1 from Theorem A (law sheet). The census checks this identity on the full polynomial for k ≤ 8 with 0 mismatches.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 73

The statement list's row (pointer, not authority):

> Every hyperbolic normalized trace satisfies y ≥ 1 and 0 ≤ x ≤ y + 2;
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 16

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, syllables in {1, 2, 3, 4}); k = `w.length`. Statements are about LISTS (STATEMENTS.md §2 note 4: words, not classes); the record's "cyclic word" is a list read up to rotation, and every statement below is rotation-invariant in content.
- t = `ntr w` (U1: the trace of P_{a₁} ⋯ P_{a_k}, the NORMALIZED trace; the literal trace is (−1)^k t by `g5_u1_trace`); x = `(ntr w).x`, y = `(ntr w).y`, integers.
- "Hyperbolic", read at the word level: the word is not (1^k) and not (4^k) — hypotheses `h1 : ∃ a ∈ w, a ≠ 1` and `h4 : ∃ a ∈ w, a ≠ 4`, stated inline (no predicate defined). This is the population the record's own proofs quantify over: Theorem A (G5-A) separates exactly the constant words (1^k), (4^k) ("y = 0 if and only if a₁ = ⋯ = a_k ∈ {1, 4}", AM-1-second-head l. 261), and TA's proof of Theorem B takes y ≥ 1 from it. That every such word is hyperbolic (|t| > 2), and that hyperbolic CLASSES are represented by such words, is not claimed here (G5-A / G5-LAD / U7).
- Conclusion, in ℤ on the coordinates (no order on `ZPhi` is used): 1 ≤ y ∧ 0 ≤ x ∧ x ≤ y + 2. "Normalized t > 0" (TA) is the choice of `ntr` (sign (−1)^k removed); no positivity hypothesis on t is added.
- The literal-lift sign: the statement is about the normalized trace, so it is sign-free by construction (STATEMENTS.md §2 note 2); it transfers to the literal trace's coefficients as ±(x, y).
- The y ≥ 1 clause is TA's Theorem B's own first clause (it is also Theorem A's content, G5-A; carried here because the record's Theorem B states it).

## 4 · Target mathlib declarations

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
```

(`List.prod`, used through U1's `blockProd`, is Lean core at the pinned toolchain, as U1 records. No new mathlib object is needed for the statement; the three names are proof aids for a path-expansion or induction proof.)

## 5 · Intended Lean statement

In prose: for every word w that is neither (1^k) nor (4^k), the normalized trace x + yφ = `ntr w` has 1 ≤ y, 0 ≤ x and x ≤ y + 2.

Probe: `<scratchpad>/M-U4/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block). NOT RUN by this seat (brief amendment 2026-10-30T10:05:25Z: no `lake` from the M seats); the orchestrator elaborates it serially. The text below is the probe's text byte for byte.

```lean
theorem g5_u4_ba (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    1 ≤ (ntr w).y ∧ 0 ≤ (ntr w).x ∧ (ntr w).x ≤ (ntr w).y + 2 := by sorry
```

Count line (the template's one-liner, run on this file): see `_UNIT-U4.md` §"Line counts".

## 6 · What the row does not claim

- Not the equality family (x = y + 2 exactly on rotations of 1^a 4^b): G5-Bb. AM §3.4's own equality sentence ("Equality x = y + 2 holds exactly for the parabolic words and the family (1, 4^n), (4, 1^n)") is FALSE as printed (ledger AM-2, "EQUALITY CLAUSE KILLED"; counterexample (1, 1, 4, 4), trace 6 + 4φ) and is not stated anywhere in this unit; its corrected form AM-2′ is G5-Bb.
- Not the θ bound (G5-Bc), not the Minkowski restatements (−t/φ² ≤ t^σ ≤ t/φ⁴ + 2√5/φ²), not the realization of the edges, not the refined identity x − y = f₀ − f₁ − Σ_{j≥3} f_j F_{j−2} (a proof device).
- Nothing about classes, conjugacy or the group G(5) (U7); nothing about the constant words (1^k), (4^k), which are excluded by hypothesis.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:51Z

V1: V1-GREEN 2026-10-30T10:27:35Z — every §2 cite matches its source line verbatim (script over eight cites: TA l. 43, 44 and SH-P2-1 l. 72, 73 exact; LEDGER l. 13, AM l. 141, AM-1-second-head l. 183, STATEMENTS l. 16 verbatim substrings). The statement 1 ≤ y ∧ 0 ≤ x ∧ x ≤ y + 2 is TA §1 Theorem B's own conclusion, no stronger, no weaker; the normalized trace `ntr` is TA's "normalized t > 0" (U1 convention, sign-free). Convention confirmed (a): "hyperbolic" at the word level as h1 ∧ h4 (neither (1^k) nor (4^k)) is the population the record's proof quantifies over (y ≥ 1 from Theorem A, AM-1-second-head l. 261; x ≥ 0 and x − y ≤ f₀ ≤ 2 for every word), adds nothing and uses no |t| > 2 fact; it differs from AM §3.4's "every non-elliptic element" only by the parabolic words, for which TA's y ≥ 1 is false, so TA's hyperbolic form is the one stated, as STATEMENTS.md's row says. Words, not classes (STATEMENTS §2 note 4; the class-level reading is U7's leg). Independent census (own arithmetic, all 87,380 words k ≤ 8): 0 failures. Parse: 0 Lean line(s) over 100 code points. SPLIT-OK (part a of G5-B).

V2: V2-GREEN 2026-10-30T10:48:53Z — Lean statement(s) byte-identical to §5 and faithful to the record at the locus (STATEMENTS.md e0df0f35, no §4 erratum touches this row); guards, domain, conventions and quantifiers as recorded; unit U4 signed at df5fdf79 (specs/_V2-U4.md).
