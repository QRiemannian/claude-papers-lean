# G5-PHIa

## 1 · Header

row: G5-PHIa
unit: U7
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:13:11Z; §4 Errata included)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1, "Remark (beyond the brief …)" (l. 120–128) and Slips item 6 (l. 355–356); `Claude-Papers/No1-G5/candidates/LEDGER.md` row R-4, disposition column (l. 37); STATEMENTS.md row G5-PHI (l. 23, pointer). SPLIT of G5-PHI: half a, the x = 0 characterization
spec_clock: 2026-10-30T10:17:01Z

## 2 · Printed statement, verbatim

> **Remark (beyond the brief; answers AM §9 item 7 and S11's φ-line clause) — worked out here, one hand: x = 0 iff the word is a rotation of (1^{k−1}, 2) or (3, 4^{k−1}).**
> 1. By Lemma 1, x = 0 forces f₀ = 0 and f_j = 0 for all j ≥ 2.
> 2. f₀ = 0 forces some 2 or 3 (Lemma 2).
> 3. The two constant-state paths are nonzero, each with c = m, so m ≤ 1, hence m = 1.
> 4. If the single letter is a 2 and some 4 is present: up at the 2 via (A₂)₁₂ = λ, down at the 4 via (A₄)₂₁ = λ. That path has c = 2, a contradiction.
> 5. If the single letter is a 3 and some 1 is present: up at the 1 via (A₁)₁₂ = λ, down at the 3 via (A₃)₂₁ = λ. Again c = 2, a contradiction.
> 6. Conversely, both families have F = (k + 1)λ.
>
> The census finds 2k words with x = 0 at each k ≤ 10, which is exactly these two classes. This also gives the ladder's minimizers uniquely (§2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 120–128

> **x = 0 EXCLUSIVITY PROVED 2026-10-30T00:08:03Z (SH-P2-1 beyond the brief, one hand):** x = 0 exactly on rotations of (1^{k−1}, 2) and (3, 4^{k−1}); census agrees (2k such words at each k ≤ 10). Settles AM §9 item 7 and the law sheet's S11 x = 0 clause; the y = 0 half is Theorem A; the pure-φ exclusivity at each k follows.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 37

## 3 · Formal reading

- **Domain.** Every word: `IsWord w` (non-empty list, k = `w.length` ≥ 1, syllables in {1, 2, 3, 4}; words, not classes — STATEMENTS.md §2 note 4).
- **x** is the φ-free coordinate `(ntr w).x` of the NORMALIZED trace t = tr(P_{a₁}⋯P_{a_k}) (U1's `ntr`; STATEMENTS.md §0; SH-P2-1 Lemma 1, l. 48: x = f₀ + Σ_{j≥2} f_j F_{j−1}). No sign enters: t is the literal trace times (−1)^k (U1 `g5_u1_trace`).
- **Rotation** is mathlib's `List.IsRotated w v` (∃ n, `w.rotate n = v`; symmetric by `List.IsRotated.symm`). The two families at syllable count k: (1^{k−1}, 2) = `List.replicate (k - 1) 1 ++ [2]` and (3, 4^{k−1}) = `3 :: List.replicate (k - 1) 4`, with k = `w.length` (natural subtraction is exact since k ≥ 1). At k = 1 they are `[2]` and `[3]`.
- **Every word, not only non-constant ones.** The record's remark carries no restriction; the brief's "for every non-constant word" is implied, not added: a constant word has x = 2 (U3, Theorem A) and is a rotation of neither family (each contains a 2 or a 3).
- **The trace value on the family** ("(trace (k + 1)φ)", l. 126 "Conversely, both families have F = (k + 1)λ") is G5-PHIb.
- **Standing as the record carries it: ONE HAND.** The x = 0 characterization is SH-P2-1's remark "beyond the brief … worked out here, one hand" (l. 120), carried to the wall as "Beyond the brief, one hand each, for the wall" (l. 355); ledger R-4: "x = 0 EXCLUSIVITY PROVED … (SH-P2-1 beyond the brief, one hand)"; STATEMENTS.md row G5-PHI: "PROVED (one hand beyond the brief; the realization half derived by the RPA)" and "a fresh V₁ reads it as new and may ask for a second head first". No second head on this clause is on the record at this clock. V₁ may ask for one before freezing.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.symm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:376
List.IsRotated.refl	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:372
List.rotate	NOT FOUND
List.replicate	NOT FOUND
List.rotate_eq_drop_append_take	FOUND List Mathlib/Data/List/Rotate.lean:127
List.isRotated_iff_mod	FOUND List Mathlib/Data/List/Rotate.lean:448
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
```

- `List.rotate` reads NOT FOUND in Mathlib: it is BATTERIES at the pin (`.lake/packages/batteries/Batteries/Data/List/Basic.lean:653`, `def rotate (l : List α) (n : Nat)`), in scope under `import Mathlib`. `List.replicate` reads NOT FOUND: Lean CORE (`Init/Data/List/Basic.lean:706` of `leanprover/lean4:v4.33.0`). Both resolve; neither is a gap.
- `List.IsRotated` FOUND (`Mathlib/Data/List/Rotate.lean:362`, `def IsRotated : Prop := ∃ n, l.rotate n = l'`; infix `~r`, written out in the statement). `Matrix.trace_mul_comm` carries rotation invariance of t (proof aid).
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word, the φ-free coordinate x of the normalized trace is 0 exactly when the word is a cyclic rotation of (1^{k−1}, 2) or of (3, 4^{k−1}), k its syllable count.

Probe: `<scratchpad>/M-U7/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, whole and unedited, then the U7 block; the probe's sha256 is recorded in `_UNIT-U7.md`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` from an M seat); the orchestrator elaborates it and returns any error to the row. The text below is the probe's text byte for byte.

Read after `open G5 ZPhi` and the U7 definitions block (`HeckeGrp`, `IsNF`; spec G5-U7-NF §5).

```lean
theorem g5_u7_phi_a (w : List ℕ) (hw : IsWord w) :
    (ntr w).x = 0 ↔
      (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
        List.IsRotated w (3 :: List.replicate (w.length - 1) 4)) := by sorry
```

## 6 · What the row does not claim

- Not the trace value on the families (G5-PHIb) and not the realization (G5-PHIc).
- Nothing about y = 0 (Theorem A, U3), about the ladder's minimality (U5, G5-LAD), or about classes: the statement is per word.
- Not the set-level sentence "the pure-φ traces of hyperbolic classes are exactly nφ" as its own statement: it follows from PHIa–PHIc (a word with x = 0 has t = (k + 1)φ > 2, so it is hyperbolic) and is not separately specced.
- **Standing as the record carries it: ONE HAND.** The x = 0 characterization is SH-P2-1's remark "beyond the brief … worked out here, one hand" (l. 120), carried to the wall as "Beyond the brief, one hand each, for the wall" (l. 355); ledger R-4: "x = 0 EXCLUSIVITY PROVED … (SH-P2-1 beyond the brief, one hand)"; STATEMENTS.md row G5-PHI: "PROVED (one hand beyond the brief; the realization half derived by the RPA)" and "a fresh V₁ reads it as new and may ask for a second head first". No second head on this clause is on the record at this clock. V₁ may ask for one before freezing.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:01Z

V1: V1-GREEN 2026-10-30T10:26:49Z — both §2 cites match verbatim (script; SH-P2-1 l. 120–128 exact, LEDGER l. 37 a verbatim substring of row R-4's disposition column). (d) Encodings: (1^{k−1}, 2) = `List.replicate (k - 1) 1 ++ [2]` and (3, 4^{k−1}) = `3 :: List.replicate (k - 1) 4` with k = `w.length` ≥ 1 (natural subtraction exact; k = 1 gives [2] and [3], the record's k = 1 x = 0 words), and 'a rotation of' is `List.IsRotated w v` (∃ n, w.rotate n = v; both lists have length k). The domain, every word, is the record's: the remark carries no restriction, and a constant word has x = 2 and is a rotation of neither family. x is U1's normalized `(ntr w).x`, the remark's x (Lemma 1, l. 48). Standing: ONE HAND, as the spec says. I do NOT ask for a second head before the freeze: I reworked the remark's six steps by hand from the blocks (x = f₀ + Σ_{j≥2} f_j F_{j−1} forces every nonzero path to weight λ; both constant-state paths weigh λ^m, so m = 1; the up-at-2/down-at-4 and up-at-1/down-at-3 paths weigh λ²; P₁^{k−1}P₂ and P₃P₄^{k−1} have trace (k + 1)φ) and found no gap, and my own census (own pair arithmetic, every word with k ≤ 9, 349,524 words) gives 0 mismatches with exactly 2k words with x = 0 at each k. That is a V₁ reading, not a graded second head: the standing stays one hand, the grade stays the wall's, and the L seat's proof is the decisive check on a frozen statement. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:56:50Z — SH-P2-1 l. 120 / LEDGER R-4 l. 37: for every word (`IsWord`, k ≥ 1, the P filler never reached), x = `(ntr w).x` of the NORMALIZED trace is 0 iff the word is a rotation (`List.IsRotated`, ∃ n, rotate) of (1^{k−1}, 2) = `replicate (k − 1) 1 ++ [2]` or (3, 4^{k−1}) = `3 :: replicate (k − 1) 4`, k = `w.length` (natural subtraction exact at k ≥ 1; k = 1 gives [2], [3]). Neither direction weakened; the remark carries no non-constant restriction. Own census k ≤ 8: 0 mismatches, 2k words with x = 0 at each k. Byte-identical to §5 (script). Standing stays ONE HAND, the wall's.
