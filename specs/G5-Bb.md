# G5-Bb

## 1 · Header

row: G5-Bb
unit: U4
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:09Z)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-2′ (l. 14) and row AM-2's kill note (l. 13); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §6 "The slip" (l. 185, l. 187); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "The equality family (AM-2′): HOLDS, both directions" (l. 75, l. 88, l. 90); STATEMENTS.md row G5-B (l. 16; pointer) and its Lean note "the equality family as a separate theorem" — the SPLIT half b of G5-B; the rotation definition this unit names is mathlib's `List.IsRotated`
spec_clock: 2026-10-30T10:17:51Z

## 2 · Printed statement, verbatim

> *Conclusion.* x = y + 2 iff the word is a rotation of 1^a4^b. The hyperbolic ones have a, b ≥ 1.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 88

> *The trace.* The λ²-paths of a {1, 4} word are in bijection with the pairs (1-position, 4-position). So t = 2 + abφ² = (2 + ab) + abφ, which is S11's expected list.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 90

> - **Corrected statement.** Sign-normalized x = y + 2 holds iff the cyclic word is 1^a4^b with a, b ≥ 0, i.e. T^aL^b. Its trace is (2 + ab) + abφ.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 187

> - **Counterexample.** P₁²P₄² = (1 2φ; 0 1)(1 0; 2φ 1) has trace 2 + 4φ² = 6 + 4φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 185

> The wedge's equality family: x = y + 2 exactly on the words 1^a 4^b (a, b ≥ 0, not both 0 beyond the constants), with trace (2 + ab) + abφ.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 14

(the same row's verdict cell: "**SECOND HEAD HOLDS in both directions 2026-10-30T00:08:03Z (SH-P2-1 item 1):** x = y + 2 exactly on rotations of 1^a 4^b, t = (2 + ab) + abφ.")

The statement list's row (pointer, not authority):

> x = y + 2 exactly on rotations of 1^a 4^b (a, b ≥ 1), with t = (2 + ab) + abφ;
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 16

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, syllables in {1, 2, 3, 4}); k = `w.length`. Statements are about LISTS (STATEMENTS.md §2 note 4: words, not classes); the record's "cyclic word" is a list read up to rotation, and every statement below is rotation-invariant in content.
- t = `ntr w` (U1: the trace of P_{a₁} ⋯ P_{a_k}, the NORMALIZED trace; the literal trace is (−1)^k t by `g5_u1_trace`); x = `(ntr w).x`, y = `(ntr w).y`, integers.
- "Hyperbolic", read at the word level: the word is not (1^k) and not (4^k) — hypotheses `h1 : ∃ a ∈ w, a ≠ 1` and `h4 : ∃ a ∈ w, a ≠ 4`, stated inline (no predicate defined). This is the population the record's own proofs quantify over: Theorem A (G5-A) separates exactly the constant words (1^k), (4^k) ("y = 0 if and only if a₁ = ⋯ = a_k ∈ {1, 4}", AM-1-second-head l. 261), and TA's proof of Theorem B takes y ≥ 1 from it. That every such word is hyperbolic (|t| > 2), and that hyperbolic CLASSES are represented by such words, is not claimed here (G5-A / G5-LAD / U7).
- "Rotation of 1^a 4^b": `List.IsRotated w (List.replicate a 1 ++ List.replicate b 4)`. The rotation definition this unit names is mathlib's `List.IsRotated` (`Mathlib/Data/List/Rotate.lean:362`, `def IsRotated : Prop := ∃ n, l.rotate n = l'`, infix `~r`, written out), built on Batteries' `List.rotate` (a cyclic left shift by n mod the length): `List.IsRotated w v` says some rotation of w is v, a symmetric relation (`List.IsRotated.symm`). No new definition is made: the brief asked for a `List.rotate`-based rotation definition owned and named by this unit, and mathlib's is exactly that; it is also the one U3's G5-PHIa uses in the same argument order (`List.IsRotated w <family>`), so the lane carries one rotation notion, not two.
- a, b ≥ 1 (SH-P2-1 l. 88: "The hyperbolic ones have a, b ≥ 1"; STATEMENTS.md's row carries a, b ≥ 1). Under the hyperbolic hypotheses the a = 0 or b = 0 members (the constant words, x = 2, y = 0) are excluded, so the iff is the record's statement restricted to hyperbolic words, exactly as SH-P2-1 l. 88 restricts it.
- Two declarations: `g5_u4_bb` (the characterization, both directions — the record's "x = y + 2 iff") and `g5_u4_bb_tr` (the trace on the family, t = (2 + ab) + abφ, as the pair ⟨2 + ab, ab⟩). The second needs no hyperbolic hypothesis (a, b ≥ 1 implies it).

## 4 · Target mathlib declarations

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.symm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:376
List.length_rotate	FOUND List Mathlib/Data/List/Rotate.lean:119
List.mem_rotate	FOUND List Mathlib/Data/List/Rotate.lean:113
List.rotate_eq_drop_append_take	FOUND List Mathlib/Data/List/Rotate.lean:127
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
List.rotate	NOT FOUND
List.replicate	NOT FOUND
```

- `List.rotate` NOT FOUND in mathlib: it is defined in Batteries, `.lake/packages/batteries/Batteries/Data/List/Basic.lean:653` (`namespace List`, `def rotate (l : List α) (n : Nat) : List α`), imported by `import Mathlib`; the mathlib lemma file `Mathlib/Data/List/Rotate.lean` is about it.
- `List.replicate` NOT FOUND in mathlib: Lean core at the pinned toolchain, `Init/Data/List/Basic.lean:706` (`def replicate : (n : Nat) → (a : α) → List α`).
- `Matrix.trace_mul_comm` is the proof aid for rotation invariance of `ntr` (tr(AB) = tr(BA)); not part of the statement.

## 5 · Intended Lean statement

In prose: (i) for every word w that is neither (1^k) nor (4^k), x = y + 2 if and only if w is a rotation of 1^a 4^b for some a, b ≥ 1; (ii) for a, b ≥ 1 and every rotation w of 1^a 4^b, `ntr w` = (2 + ab) + abφ.

Probe: `<scratchpad>/M-U4/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block). NOT RUN by this seat (brief amendment 2026-10-30T10:05:25Z: no `lake` from the M seats); the orchestrator elaborates it serially. The text below is the probe's text byte for byte.

```lean
theorem g5_u4_bb (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    (ntr w).x = (ntr w).y + 2 ↔
      ∃ a b : ℕ, 1 ≤ a ∧ 1 ≤ b ∧
        List.IsRotated w (List.replicate a 1 ++ List.replicate b 4) := by sorry

theorem g5_u4_bb_tr (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) (w : List ℕ)
    (hw : List.IsRotated w (List.replicate a 1 ++ List.replicate b 4)) :
    ntr w = (⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi) := by sorry
```

Count line (the template's one-liner, run on this file): see `_UNIT-U4.md` §"Line counts".

## 6 · What the row does not claim

- Not AM §3.4's original equality clause ("exactly for the parabolic words and the family (1, 4^n), (4, 1^n)"), which is FALSE as printed (ledger AM-2, "EQUALITY CLAUSE KILLED"; (1, 1, 4, 4) has trace 6 + 4φ = (2 + 2·2) + 2·2φ, x = y + 2, inside the corrected family a = b = 2).
- Not the census counts (k(k − 1) non-constant family words per k; 224 outside AM's named family at k ≤ 10).
- Not the inequality (G5-Ba), nor anything for the constant words (1^k), (4^k), which have x = y + 2 but sit outside the hyperbolic hypotheses.
- No lemma about `List.IsRotated` (symmetry, transitivity, invariance of `ntr`) is stated in this row; rotation invariance of `ntr` is a proof step (`Matrix.trace_mul_comm`).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:51Z

V1: V1-GREEN 2026-10-30T10:27:35Z — every §2 cite matches verbatim (SH-P2-1 l. 88, 90 and AM-1-second-head l. 185, 187 exact; LEDGER l. 14, STATEMENTS l. 16 substrings). (b) a, b ≥ 1 under h1 ∧ h4 is SH-P2-1 l. 88's form ("The hyperbolic ones have a, b ≥ 1") and STATEMENTS.md's; it is equivalent, under the hypotheses, to AM-2′'s a, b ≥ 0 (a rotation of 1^a with b = 0 fails h1, of 4^b with a = 0 fails h4), so neither stronger nor weaker; the record's "cyclic word 1^a4^b" is the list up to rotation. Rotation: mathlib's `List.IsRotated` (∃ n, w.rotate n = v) ACCEPTED, no alias asked — U1 fixed no rotation name (it left rotations to the later units), it is exactly a List.rotate-based predicate, and U3's G5-PHIa (V1-GREEN) uses the same name in the same argument order, so the lane carries one notion. `g5_u4_bb_tr` restricted to a, b ≥ 1 matches STATEMENTS.md's attachment of t = (2 + ab) + abφ to that family (true also at a or b = 0, not claimed). The killed AM §3.4 clause is named in §6 and stated nowhere. Independent census k ≤ 8 (rotations computed directly): iff 0 failures, trace 0 failures. Parse: 0 Lean line(s) over 100 code points. SPLIT-OK (part b of G5-B).
