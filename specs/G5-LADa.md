# G5-LADa

## 1 · Header

row: G5-LADa
unit: U5
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` read 2026-10-30T10:06:17Z; §4 Errata included)
locus: TA transcript §1 "Theorem 4" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 53; the proof's parts (i), (ii), (iii) at l. 54); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §2 item 2: (ii) the claim (l. 151) and the filled step (l. 156), (iii) (l. 162–164); `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 21 (hyperbolic classes = the non-constant words); STATEMENTS.md row G5-LAD (l. 18), the minimum (pointer). SPLIT of G5-LAD per the brief: a = the minimum (lower bound); b = attainment and uniqueness (G5-LADb); c = the census consequence (G5-LADc)
spec_clock: 2026-10-30T10:18:44Z

## 2 · Printed statement, verbatim

> **Theorem 4 (the ladder for every k, the previous occupant's D-5; WORKED OUT HERE).** The minimal hyperbolic |t| at syllable count k is (k+1)φ for k = 1 and every k ≥ 3, and 3 + φ at k = 2; attained by (1^{k−1}, 2) and (3, 4^{k−1}).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 53

The second head's filled induction and the {1, 4} case:

> *Claim.* Every sequence of length k ≥ 1 containing a 2 or 3 has t ≥ (k + 1)φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 151

> - **The step TA leaves implicit.** TA's text calls w′ "hyperbolic" without saying why. Its hyperbolicity, tr > 2, is supplied by the induction hypothesis itself: kφ ≥ 2φ > 2. So (i) applies, and re-inserting a raises the trace by ≥ φ, giving t ≥ (k + 1)φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 156

> - So t ≥ 2 + c₁c₄φ² ≥ 2 + (k − 1)φ², using c₁c₄ − (k − 1) = (c₁ − 1)(c₄ − 1) ≥ 0. That is t ≥ (k + 1) + (k − 1)φ.
> - The excess over (k + 1)φ is (k + 1) − 2φ > 0 for k ≥ 3, so these words never tie with the ladder.
> - At k = 2 the bound is 3 + φ, attained by (1, 4). Every 2/3 word at k = 2 has t ≥ 3φ > 3 + φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 162–164

"Hyperbolic class", as the record defines it:

> - The constant words (1, 1, …, 1) and (q − 1, …, q − 1) are parabolic (trace ±2), the words T^{±k}; every other cyclic word is hyperbolic. When the Atlas counts "classes" it counts cyclic words up to rotation; where it says "hyperbolic classes" the two parabolic constant words at each length are excluded. When it counts "words visited" it counts SEQUENCES, all (q − 1)^k of them at each k, rotations included.
>
> — `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 21

The list's row (pointer):

> The minimal normalized trace of a hyperbolic class of syllable count k is 2φ (k = 1), 3 + φ (k = 2), (k + 1)φ (k ≥ 3)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 18

## 3 · Formal reading

- **Domain.** Words w (U1's `IsWord`: non-empty, syllables in {1, 2, 3, 4}) of length k, other than (1^k) and (4^k). This is "hyperbolic class of syllable count k" read over words: the record defines the hyperbolic classes as exactly the cyclic words other than the two constant words at each length (DEFINITIONS l. 21), and the second head's proof runs over exactly these words — the words "containing a 2 or 3" (l. 151) and "{1, 4} words with both letters" (l. 159), with no hyperbolicity hypothesis used as input (l. 156: hyperbolicity of the shortened word "is supplied by the induction hypothesis itself"). Stating the hypothesis as `2 < ntr w` instead would make the row depend on Theorem A (U3) and is not done.
- **Bound.** t = `ntr w` (normalized, so |t| = t: TA's "|t|" is the normalized trace; no absolute value is formalized). k = 1: t ≥ 2φ; k = 2: t ≥ 3 + φ; k ≥ 3: t ≥ (k + 1)φ — all in the real order (`instLE`). TA states k = 1 inside "(k+1)φ for k = 1 and every k ≥ 3"; at k = 1 that is 2φ, the form the STATEMENTS.md row and the brief print.
- **Classes vs words.** The trace of a word equals the trace of each rotation, so the class statement and the word statement are the same; the word statement is what is formalized.
- **Constant words.** "Constant" is the record's: the words (1^k) and (4^k) only (`phase-0/DEFINITIONS.md` l. 21; AM l. 14; `PHASE-2-DEFINITIONS.md` l. 9), written `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4`. (2^k), (3^k) are NOT constant in this sense (they are hyperbolic). The record defines "hyperbolic class" as exactly these non-constant words: "every other cyclic word is hyperbolic … where it says "hyperbolic classes" the two parabolic constant words at each length are excluded" (DEFINITIONS l. 21, quoted in §2).
- **Conventions.** Words are lists over {1, 2, 3, 4} with U1's `IsWord` (non-empty); possibly-empty products of blocks carry `∀ b ∈ u, 1 ≤ b ∧ b ≤ 4` instead (SH-P2-1 §3.1: "A and B may be empty"; the empty product is `1 = I`). Words, not classes (STATEMENTS.md §2 note 4): a class statement is read as the statement for every word of the class, the trace being rotation-invariant; rotations are mathlib's `List.IsRotated w v` (∃ n, w.rotate n = v). The trace is the NORMALIZED one, U1's `ntr` = tr(P_{a₁}⋯P_{a_k}), which is (−1)^k · tr W for the literal lift (U1's `g5_u1_trace`); no statement here mentions `W`, so no sign enters. `≤` is U1's exact REAL order `instLE` (s ≤ t ⟺ t − s ≥ 0 as a real number, decided by the sign of a + b√5); `nonneg` is ℕ[φ].

## 4 · Target mathlib declarations

```
List.replicate	NOT FOUND
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Matrix.trace_fin_two_of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:232
Matrix.one_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:434
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
```

`List.replicate` is Lean CORE (`Init/Data/List/Basic.lean:706`), resolved under `import Mathlib`. The numerals `2`, `3` and the cast `(w.length : ZPhi)` use U1's `CommRing ZPhi` (mathlib's `instOfNat` / `Nat.cast`); nothing further is targeted. Not NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word w of length k other than (1^k), (4^k): if k = 1 then 2φ ≤ t; if k = 2 then 3 + φ ≤ t; if k ≥ 3 then (k + 1)φ ≤ t; t the normalized trace, ≤ the real order.

Probe: `<scratchpad>/M-U5/probe.lean` (sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec`; U1's final probe `f15f3200…` copied whole as the prefix, then U5's block). NOT RUN by this seat (the brief's amendment of 10:05:25Z): the orchestrator elaborates it. The text below is the probe's text byte for byte.

```lean
/-- G5-LADa, k = 1: a word of length 1 other than `(1)`, `(4)` has `t ≥ 2φ`. -/
theorem g5_u5_lad_a_one (w : List ℕ) (hw : IsWord w) (hk : w.length = 1)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    2 * phi ≤ ntr w := by sorry

/-- G5-LADa, k = 2: a word of length 2 other than `(1, 1)`, `(4, 4)` has `t ≥ 3 + φ`. -/
theorem g5_u5_lad_a_two (w : List ℕ) (hw : IsWord w) (hk : w.length = 2)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    3 + phi ≤ ntr w := by sorry

/-- G5-LADa, k ≥ 3: a word of length k other than `(1^k)`, `(4^k)` has `t ≥ (k + 1)φ`. -/
theorem g5_u5_lad_a_ge3 (w : List ℕ) (hw : IsWord w) (hk : 3 ≤ w.length)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ((w.length : ZPhi) + 1) * phi ≤ ntr w := by sorry
```

## 6 · What the row does not claim

- Not attainment, not uniqueness (G5-LADb); not the census consequence (G5-LADc, stopped).
- Nothing about constant words (their t = 2 is AM l. 56 / Theorem A, U3) — they are excluded by hypothesis.
- Not the intermediate claims of the proof as statements (all four entries ≥ 1 for a hyperbolic product; the {1, 4} bound t ≥ (k + 1) + (k − 1)φ; the k = 2 bound t ≥ 3φ for words with a 2 or 3).
- Nothing about the literal trace's sign, the group, or conjugacy classes beyond rotation.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:18:44Z

V1: V1-GREEN 2026-10-30T10:27:16Z — all six §2 cites match verbatim (TA l. 53, SH-P2-1 l. 151, l. 156, l. 162–164, DEFINITIONS l. 21 whole; STATEMENTS.md l. 18 substring). Convention confirmed: "hyperbolic class of syllable count k" is read by the record's own definition (DEFINITIONS l. 21: the two constant words (1^k), (4^k) excluded, every other word hyperbolic), not as `2 < ntr w` — the two populations coincide only through Theorem A (U3), and TA l. 54's working "tr P > 2" is the same set by that theorem, so the row is neither stronger nor weaker and does not route through U3; SH-P2-1 l. 156 uses no hyperbolicity input. The three bounds are STATEMENTS.md l. 18's values 2φ / 3 + φ / (k + 1)φ (TA l. 53's "(k+1)φ for k = 1" = 2φ); "|t|" (TA) is the normalized trace, non-negative on these words, so `ntr w` with no absolute value is STATEMENTS.md's "minimal normalized trace". The minimum is split as bound (here) + attainment (LADb): V1-SPLIT-OK. Names: U1's `IsWord`, `ntr`, `phi`, the CommRing cast; core `replicate`; nothing defined. Exact check: all 87,364 non-constant words of length ≤ 8 meet the bound — 0 violations. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:53:28Z — 2φ / 3 + φ / (k + 1)φ on the normalized trace over every non-constant word of each length (STATEMENTS.md l. 18; TA l. 53; SH-P2-1 l. 151, l. 162–164; DEFINITIONS l. 21): the constant words, where t = 2, are excluded by hc, exactly the record's hyperbolic population; untouched by the 10:22:16Z erratum; §5 byte-identical in Challenge.lean (sha256 ea6b4aed…); 0 violations on an independent exact check.
