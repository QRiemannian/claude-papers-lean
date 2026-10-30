# G5-LADb

## 1 · Header

row: G5-LADb
unit: U5
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` read 2026-10-30T10:06:17Z; §4 Errata included)
locus: TA transcript §1 "Theorem 4" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 53), attainment; `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §2 item 2: (iii) (l. 164), (iv) (l. 166), "Uniqueness of the minimizers" (l. 168–170), the §1 Remark it cites (l. 120, l. 126, l. 128), the census ladder table (l. 335–339); STATEMENTS.md row G5-LAD (l. 18), attainment and uniqueness (pointer). SPLIT of G5-LAD per the brief (half b)
spec_clock: 2026-10-30T10:18:44Z

## 2 · Printed statement, verbatim

> **Theorem 4 (the ladder for every k, the previous occupant's D-5; WORKED OUT HERE).** The minimal hyperbolic |t| at syllable count k is (k+1)φ for k = 1 and every k ≥ 3, and 3 + φ at k = 2; attained by (1^{k−1}, 2) and (3, 4^{k−1}).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 53

> - At k = 2 the bound is 3 + φ, attained by (1, 4). Every 2/3 word at k = 2 has t ≥ 3φ > 3 + φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 164

> **(iv)** A₁^{k−1}A₂ = [[kλ, λ + (k−1)λ²], [1, λ]], with trace (k + 1)λ. A₃A₄^{k−1} likewise has trace (k + 1)λ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 166

> **Uniqueness of the minimizers (beyond TA's statement, which claims attainment only).**
> - If t = (k + 1)φ, then x = 0 because φ is irrational.
> - By the §1 remark, the minimizers are exactly the two classes (1^{k−1}, 2) and (3, 4^{k−1}) for k ≠ 2, and (1, 4) at k = 2.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 168–170

The remark the uniqueness rests on:

> **Remark (beyond the brief; answers AM §9 item 7 and S11's φ-line clause) — worked out here, one hand: x = 0 iff the word is a rotation of (1^{k−1}, 2) or (3, 4^{k−1}).**
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 120

> 6. Conversely, both families have F = (k + 1)λ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 126

> The census finds 2k words with x = 0 at each k ≤ 10, which is exactly these two classes. This also gives the ladder's minimizers uniquely (§2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 128

The census table (k = 1, 2, 3 rows shown; the table runs to k = 10):

> | k | min t | minimizing classes |
> |---|---|---|
> | 1 | 2φ | (2), (3) |
> | 2 | 3 + φ | (1, 4) |
> | 3 | 4φ | (1,1,2), (3,4,4) |
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 335–339

The list's row (pointer):

> attained exactly by the rotations of (1^{k−1}, 2) and (3, 4^{k−1}) for k ≥ 3 (minimizers unique)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 18

## 3 · Formal reading

- **Domain.** As G5-LADa: words w (U1's `IsWord`) of length k, other than (1^k), (4^k) (the record's hyperbolic classes, DEFINITIONS l. 21).
- **k ≥ 3:** t = (k + 1)φ (equality in ZPhi, i.e. of both coefficients) iff w is a rotation of (1^{k−1}, 2) or of (3, 4^{k−1}). "The two classes" (SH-P2-1 l. 170) = all rotations of the two words; `List.IsRotated w v` with v the printed representative.
- **k = 2:** t = 3 + φ iff w is a rotation of (1, 4), i.e. w ∈ {(1, 4), (4, 1)} (SH-P2-1 l. 164, l. 170: "(1, 4) at k = 2"; table l. 338).
- **k = 1:** t = 2φ iff w = (2) or (3) — "the named words at k = 1" (TA l. 53 at k = 1: (1^0, 2) = (2), (3, 4^0) = (3); table l. 337). Under the hypothesis both sides of this iff hold for every admissible w; the row is stated for completeness of the ladder's form, as the brief asks.
- **Attainment** is the ← direction (TA l. 53 "attained by"; SH-P2-1 l. 166 (iv)); **uniqueness** is the → direction (SH-P2-1 l. 168–170). Read with G5-LADa, each iff says the minimum is attained exactly there.
- The non-constant hypothesis is kept in all three so that the row is no stronger than "the minimizers" among hyperbolic classes (for a constant word t = 2, which equals none of the three values; that fact is not claimed here).
- **Conventions.** Words are lists over {1, 2, 3, 4} with U1's `IsWord` (non-empty); possibly-empty products of blocks carry `∀ b ∈ u, 1 ≤ b ∧ b ≤ 4` instead (SH-P2-1 §3.1: "A and B may be empty"; the empty product is `1 = I`). Words, not classes (STATEMENTS.md §2 note 4): a class statement is read as the statement for every word of the class, the trace being rotation-invariant; rotations are mathlib's `List.IsRotated w v` (∃ n, w.rotate n = v). The trace is the NORMALIZED one, U1's `ntr` = tr(P_{a₁}⋯P_{a_k}), which is (−1)^k · tr W for the literal lift (U1's `g5_u1_trace`); no statement here mentions `W`, so no sign enters. `≤` is U1's exact REAL order `instLE` (s ≤ t ⟺ t − s ≥ 0 as a real number, decided by the sign of a + b√5); `nonneg` is ℕ[φ].

## 4 · Target mathlib declarations

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.map	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:463
List.IsRotated.perm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:404
List.replicate	NOT FOUND
List.rotate	NOT FOUND
```

`List.replicate` is Lean CORE (`Init/Data/List/Basic.lean:706`); `List.rotate` is Batteries (`Batteries/Data/List/Basic.lean:653`); both resolve under `import Mathlib`. Not NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for a word w of length k other than (1^k), (4^k): (k = 1) t = 2φ iff w is (2) or (3); (k = 2) t = 3 + φ iff w is a rotation of (1, 4); (k ≥ 3) t = (k + 1)φ iff w is a rotation of (1^{k−1}, 2) or of (3, 4^{k−1}).

Probe: `<scratchpad>/M-U5/probe.lean` (sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec`; U1's final probe `f15f3200…` copied whole as the prefix, then U5's block). NOT RUN by this seat (the brief's amendment of 10:05:25Z): the orchestrator elaborates it. The text below is the probe's text byte for byte.

```lean
/-- G5-LADb, k = 1: the minimum `2φ` is attained exactly at the named words (2), (3). -/
theorem g5_u5_lad_b_one (w : List ℕ) (hw : IsWord w) (hk : w.length = 1)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = 2 * phi ↔ (w = [2] ∨ w = [3]) := by sorry

/-- G5-LADb, k = 2: the minimum `3 + φ` is attained exactly at the rotations of (1, 4). -/
theorem g5_u5_lad_b_two (w : List ℕ) (hw : IsWord w) (hk : w.length = 2)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = 3 + phi ↔ List.IsRotated w [1, 4] := by sorry

/-- G5-LADb, k ≥ 3: the minimum `(k + 1)φ` is attained exactly at the rotations of
`(1^{k−1}, 2)` and of `(3, 4^{k−1})`. -/
theorem g5_u5_lad_b_ge3 (w : List ℕ) (hw : IsWord w) (hk : 3 ≤ w.length)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = ((w.length : ZPhi) + 1) * phi ↔
      (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
        List.IsRotated w (3 :: List.replicate (w.length - 1) 4)) := by sorry
```

## 6 · What the row does not claim

- Not the minimum itself (G5-LADa); not the census consequence (G5-LADc, stopped).
- Not the φ-line law for all words (x = 0 iff a rotation of the two families: SH-P2-1 §1 Remark, STATEMENTS.md row G5-PHI) — only its use at t = (k + 1)φ for non-constant words of length k ≥ 3.
- Not primitivity, not a count of minimizing classes ("2k words … at each k ≤ 10", l. 128, is census, not claimed).
- Nothing about the literal trace or the group.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:18:44Z
