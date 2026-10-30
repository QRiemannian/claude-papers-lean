**CC-CANDIDATE** — G5-LADc is FALSE as recorded at K = 1: the word (1, 4) has length 2 > 1 and t = 3 + φ < 3φ = (K + 2)φ, so the depth-1 census is not complete below 3φ. Row STOPPED; OPEN and uncounted; not repaired.

# G5-LADc

## 1 · Header

row: G5-LADc
unit: U5
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` read 2026-10-30T10:06:17Z; §4 Errata included)
locus: TA transcript §1, after "Theorem 4" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 55), "Consequence for saturation"; STATEMENTS.md row G5-LAD (l. 18), "Consequence" (pointer); the witness from `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 109) and §2 (iii) (l. 164); the same defect in another sentence at SH-P2-1 §3.4 (l. 193). SPLIT of G5-LAD per the brief (half c)
spec_clock: 2026-10-30T10:18:44Z

## 2 · Printed statement, verbatim

> **Consequence for saturation:** the depth-K census is complete for |t| < (K+2)φ; at K = 12 that is 14φ = 22.652…, and the first value missing from the depth-12 census is exactly (0, 14) = 14φ
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 55

> Consequence: a depth-K census is complete exactly below (K + 2)φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 18

The value of the witness, in the record:

> - (3, 1) is realized by (1, 4), since P₁P₄ has trace 2 + φ² = 3 + φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 109

> - At k = 2 the bound is 3 + φ, attained by (1, 4). Every 2/3 word at k = 2 has t ≥ 3φ > 3 + φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 164

The record's own catch of the same boundary, in the census-cap sentence:

> - **Separately, the cap sentence itself.** "A class with t ≤ X has k ≤ X/φ − 1" fails only for the k = 2 class (1, 4) when 3 + φ ≤ X < 3φ, i.e. 4.618… ≤ X < 4.854…. This does not touch any grid X (all ≥ 25). For the record, the exact statement is: for X ≥ 3φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 193

## 3 · Formal reading (of the sentence as recorded, which is what fails)

- "A depth-K census is complete exactly below (K + 2)φ": every hyperbolic class with t < (K + 2)φ has syllable count ≤ K, and (K + 2)φ itself is not reached at depth ≤ K. As the brief's corollary over words: every non-constant word (not (1^k), (4^k)) of length > K has t ≥ (K + 2)φ in the real order. No restriction on K is printed (TA l. 55; STATEMENTS.md l. 18; nor in the audit, the synthesis or the FOLD-LOG, which repeat it).
- **The defect.** K = 1: w = (1, 4), length 2 > 1, non-constant; t = tr(P₁P₄) = 2 + φ² = 3 + φ (SH-P2-1 l. 109). (K + 2)φ = 3φ, and 3φ − (3 + φ) = 2φ − 3 = −3 + 2φ, whose real value is (−6 + 2 + 2√5)/2 = −2 + √5 > 0 (exact: `NonnegAB5 (−4) 2`, 16 ≤ 20, and ≠ 0). So t < (K + 2)φ: the corollary fails, and the depth-1 census (values {2φ}) misses 3 + φ < 3φ, so it is not complete below 3φ.
- **Where it holds (stated for the wall, not specced):** K = 0 (every non-constant word has t ≥ 2φ) and every K ≥ 2 (length k ≥ K + 1 ≥ 3 gives t ≥ (k + 1)φ ≥ (K + 2)φ by G5-LADa). The record's ladder (TA l. 53) excepts k = 2 from (k + 1)φ; the consequence inherits that exception at K = 1 and does not print it. SH-P2-1 §3.4 found the same boundary in the cap sentence ("holds for X ≥ 3φ; fails only on (1, 4) for X ∈ [3 + φ, 3φ)"), but not in this sentence.
- The repair (K ≠ 1, or K ≥ 2, or the k = 2 exception carried) is the wall's; this seat does not make it.

## 4 · Target mathlib declarations

```
Matrix.trace_fin_two_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:232
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
```

(Aids for the witness only; no statement is proposed.)

## 5 · Intended Lean statement

None — the row is stopped. The defect witness (not a statement for freezing) is in the probe after U5's theorems; this seat did not elaborate it, and its `decide` on `ntr [1, 4]` (a 2 × 2 matrix product over ZPhi) is the one line most likely to need another tactic. Probe: `<scratchpad>/M-U5/probe.lean` (sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec`; U1's final probe `f15f3200…` copied whole as the prefix, then U5's block). NOT RUN by this seat (the brief's amendment of 10:05:25Z): the orchestrator elaborates it. The text below, the witness only, is the probe's text byte for byte.

```lean
/- G5-LADc, the defect witness at K = 1 (not a statement for freezing): the word (1, 4)
has length 2 > 1 and `t = 3 + φ < 3φ = (K + 2)φ`. -/
example : ntr [1, 4] = 3 + phi := by decide
example : (3 : ZPhi) + phi < 3 * phi := by decide
```

## 6 · What the row does not claim

- Nothing: a CC-CANDIDATE row proposes no statement. In particular the seat does not claim the K ≥ 2 form; the wall decides whether a corrected statement enters the lane as a NEW unit (STATEMENTS.md §3).
- The defect does not touch G5-LADa or G5-LADb, nor the census numbers the record computed at K = 9, 12 (14φ at K = 12 stands, K ≥ 2).

## 7 · Status

CC-CANDIDATE 2026-10-30T10:18:44Z — stopped, OPEN, uncounted.

V1: V1-CC 2026-10-30T10:27:16Z — I agree with M's CC-CANDIDATE. The recorded sentence — TA l. 55 "the depth-K census is complete for |t| < (K+2)φ" and STATEMENTS.md l. 18 "a depth-K census is complete exactly below (K + 2)φ" (both cites verbatim, with SH-P2-1 l. 109, l. 164, l. 193) — prints no restriction on K and is FALSE at K = 1: the non-constant word (1, 4) has length 2 > 1 and t = 3 + φ, and 3φ − (3 + φ) = 2φ − 3 = √5 − 2 > 0 exactly (√5 > 2 as 5 > 4; in pairs (−3, 2), `RealNonneg` = `NonnegAB5 (−4) 2`, 16 ≤ 20, ≠ 0), so the depth-1 census {2φ} misses 3 + φ below 3φ. Phase 0 library (`impl-a/zphi.py`, read-only, `python3 -I -B`): t(1, 4) = (3, 1), sign_ab5(−4, 2) = +1; over all non-constant words of length ≤ 8 the corollary "length > K ⟹ t ≥ (K + 2)φ" holds at K = 0 and K = 2…7 and fails only at K = 1 (min (3, 1) < (0, 3)) — STATEMENTS.md §4's erratum (10:22:16Z; K = 0 and K ≥ 2 hold) agrees. The defect is in the RECORD (TA l. 55), not a spec drift; a restricted form enters, if at all, as a NEW unit. No statement proposed; uncounted. Parse: 0 Lean line(s) over 100 code points
