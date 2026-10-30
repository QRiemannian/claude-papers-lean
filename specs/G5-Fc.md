# G5-Fc

## 1 · Header

row: G5-Fc
unit: U4
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:09Z)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-3 (l. 15); AM transcript §3.5 "Theorem C" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 155, proof l. 157) and its §6 ledger candidate (l. 224); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §6 per-word census rows AM-3 (l. 126–129) and slip note 4 (l. 278); STATEMENTS.md row G5-F (l. 17; pointer) and its Lean note (the minimizer characterization may be split as a separate leg) — the SPLIT leg c of G5-F (the 2/3 clause)
spec_clock: 2026-10-30T10:17:51Z

## 2 · Printed statement, verbatim

> **Theorem C.** For every non-constant cyclic word of syllable count k ≥ 2, |y| ≥ k − 1, with equality exactly for (1, 4^{k−1}) and (4, 1^{k−1}). If the word contains a syllable 2 or 3, |y| ≥ k + 1 (k = 1: |y| = 2), attained by (1^{k−1}, 2), (4^{k−1}, 2) and their flips.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 155

> The floor: |y| ≥ k − 1 at syllable count k, equality only on (1, 4^{k−1}) and (4, 1^{k−1}); |y| ≥ k + 1 if a syllable 2 or 3 occurs.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 15

(the same row's verdict cell: "PROVED-PENDING-CHECK"; STATEMENTS.md's standing column for G5-F reads "PROVED; P1-PC controls 0 violations both trees")

> - **AM-3 (Theorem C, growth floor).** |y| ≥ k − 1 (k ≥ 2, non-constant), equality iff (1, 4^{k−1}), (4, 1^{k−1}); |y| ≥ k + 1 if a 2 or 3 occurs. PROVED-HERE. Falsifier: one word below the floor or another minimizer. Census: per-k minimum |y| and its minimizing classes, k ≤ 12.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 224

The statement list's row (pointer, not authority):

> For a non-constant word of syllable count k ≥ 2, |y| ≥ k − 1, with equality iff the word is a rotation of (1, 4^{k−1}) or (4, 1^{k−1}); and |y| ≥ k + 1 if some syllable is 2 or 3.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 17

The census row of the second head (control, not authority for the statement):

> | AM-3 | word containing 2 or 3 with y < k + 1 | 0 | 0 |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 129

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, syllables in {1, 2, 3, 4}); k = `w.length`. Statements are about LISTS (STATEMENTS.md §2 note 4: words, not classes); the record's "cyclic word" is a list read up to rotation, and every statement below is rotation-invariant in content.
- t = `ntr w` (U1: the trace of P_{a₁} ⋯ P_{a_k}, the NORMALIZED trace; the literal trace is (−1)^k t by `g5_u1_trace`); x = `(ntr w).x`, y = `(ntr w).y`, integers.
- Scope: EVERY word containing a syllable 2 or 3 (`h23 : 2 ∈ w ∨ 3 ∈ w`), every k ≥ 1, constant words (2^k), (3^k) included. Grounds, all in the source of record: AM §3.5's sentence is its own ("If the word contains a syllable 2 or 3, |y| ≥ k + 1 (k = 1: |y| = 2)") and names k = 1 explicitly, so it is not scoped by the first sentence's "non-constant … k ≥ 2"; the ledger row AM-3 and AM's §6 candidate state it with no non-constant or k ≥ 2 qualifier ("|y| ≥ k + 1 if a syllable 2 or 3 occurs"); the proof's case m ≥ 1 (l. 157) uses neither; the second head's census row tests it on every word (l. 129). The statement list's row places the clause after "For a non-constant word of syllable count k ≥ 2" — read as a pointer, the record governing.
- |y| as in G5-Fa: `|(ntr w).y|`, the record's absolute value kept.
- Conclusion: k + 1 ≤ |y|, in ℤ.

## 4 · Target mathlib declarations

```
one_le_mabs	FOUND _root_ Mathlib/Algebra/Order/Group/Unbundled/Abs.lean:109
mabs_of_one_le	FOUND _root_ Mathlib/Algebra/Order/Group/Unbundled/Abs.lean:90
List.mem_rotate	FOUND List Mathlib/Data/List/Rotate.lean:113
```

(`one_le_mabs` / `mabs_of_one_le` are the `to_additive` sources of the root `abs_nonneg` / `abs_of_nonneg`, see G5-Fa §4; proof aids only.)

## 5 · Intended Lean statement

In prose: for every word w containing a syllable 2 or 3, |y| ≥ k + 1, where k is its length.

Probe: `<scratchpad>/M-U4/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block). NOT RUN by this seat (brief amendment 2026-10-30T10:05:25Z: no `lake` from the M seats); the orchestrator elaborates it serially. The text below is the probe's text byte for byte.

```lean
theorem g5_u4_fc (w : List ℕ) (hw : IsWord w) (h23 : 2 ∈ w ∨ 3 ∈ w) :
    (w.length : ℤ) + 1 ≤ |(ntr w).y| := by sorry
```

Count line (the template's one-liner, run on this file): see `_UNIT-U4.md` §"Line counts".

## 6 · What the row does not claim

- Not the k = 1 equality "|y| = 2" (the parenthetical; at k = 1 the bound reads |y| ≥ 2, and equality there is a computation not in the statement list's row), not the attainment by (1^{k−1}, 2), (4^{k−1}, 2) and their flips.
- Not D-1b's sharpened bound y ≥ F_{n₂₃} + k (LIVE, not on the lane), nor the proof's y ≥ 2F_m + n₁ + n₄.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:51Z

V1: V1-GREEN 2026-10-30T10:27:35Z — every §2 cite matches verbatim (AM l. 155, 224 and AM-1-second-head l. 129 exact; LEDGER l. 15, STATEMENTS l. 17 substrings). (e) SCOPE decided for M's broad reading: the source of record states the 2/3 clause unscoped — AM l. 155 gives it its own sentence with "(k = 1: |y| = 2)", and at k = 1 every word is constant, so the clause cannot be under "non-constant … k ≥ 2"; LEDGER l. 15 and AM's §6 candidate (l. 224, whose parenthesis "(k ≥ 2, non-constant)" attaches to the first clause) carry no qualifier; the m ≥ 1 case of the proof (l. 157) and the census row (AM-1-second-head l. 129, "word containing 2 or 3") use none. STATEMENTS.md l. 17 joins it with "and", which reads either way, and is a pointer. The narrower form (with hk, hnc) is also true. Census k ≤ 8, constants (2^k), (3^k) included: 0 failures (ntr [2] = 2φ, |y| = 2 at k = 1). Parse: 0 Lean line(s) over 100 code points. SPLIT-OK (leg c of G5-F).
