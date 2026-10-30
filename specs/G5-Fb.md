# G5-Fb

## 1 · Header

row: G5-Fb
unit: U4
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:09Z)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-3 (l. 15); AM transcript §3.5 "Theorem C" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 155, proof l. 157) and its §6 ledger candidate (l. 224); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §6 per-word census rows AM-3 (l. 126–129) and slip note 4 (l. 278); STATEMENTS.md row G5-F (l. 17; pointer) and its Lean note (the minimizer characterization may be split as a separate leg) — the SPLIT leg b of G5-F (the equality characterization, the delicate half)
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

The census rows of the second head (controls, not authority for the statement):

> | AM-3 | y = k − 1 at a non-minimizer | 0 | 0 |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 127

> | AM-3 | minimizer with y ≠ k − 1 | 0 | 0 |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 128

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, syllables in {1, 2, 3, 4}); k = `w.length`. Statements are about LISTS (STATEMENTS.md §2 note 4: words, not classes); the record's "cyclic word" is a list read up to rotation, and every statement below is rotation-invariant in content.
- t = `ntr w` (U1: the trace of P_{a₁} ⋯ P_{a_k}, the NORMALIZED trace; the literal trace is (−1)^k t by `g5_u1_trace`); x = `(ntr w).x`, y = `(ntr w).y`, integers.
- "Non-constant": NOT all syllables equal — `hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b`, inline. This is the literal reading, and the record's own: AM §1.3 (l. 56, "Constant words. (1^k), (4^k): … (2^k), (3^k): …") uses "constant words" for all four families. It excludes (2^k), (3^k) as well as (1^k), (4^k); the statement is therefore no stronger than the printed sentence (it is also true without excluding (2^k), (3^k), which G5-Fc covers with the larger bound k + 1).
- |y|: the integer absolute value of y = `(ntr w).y` (mathlib's `|·|` on ℤ). The record writes |y| for the literal trace's φ-coefficient; since the literal trace is (−1)^k `ntr w` (`g5_u1_trace`), its |y| is `|(ntr w).y|`. The statement keeps the record's absolute value (it does not import y ≥ 0 from G5-A).
- k ≥ 2: `hk : 2 ≤ w.length`.
- "Rotation of (1, 4^{k−1})": `List.IsRotated w (1 :: List.replicate (w.length - 1) 4)` with the rotation definition named in G5-Bb (mathlib's `List.IsRotated`); likewise (4, 1^{k−1}). The record's "cyclic word … (1, 4^{k−1})" is the cyclic class, i.e. the list up to rotation. At k = 2 the two families coincide ((1, 4) and (4, 1) are rotations of each other).
- Conclusion: |y| = k − 1 ↔ (rotation of (1, 4^{k−1}) ∨ rotation of (4, 1^{k−1})), both directions (the record's "with equality exactly for").

## 4 · Target mathlib declarations

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.length_rotate	FOUND List Mathlib/Data/List/Rotate.lean:119
List.mem_rotate	FOUND List Mathlib/Data/List/Rotate.lean:113
mabs_of_one_le	FOUND _root_ Mathlib/Algebra/Order/Group/Unbundled/Abs.lean:90
List.replicate	NOT FOUND
```

- `List.replicate` NOT FOUND in mathlib: Lean core, `Init/Data/List/Basic.lean:706` (as in G5-Bb). `List.rotate` (Batteries, `Batteries/Data/List/Basic.lean:653`) enters through `List.IsRotated` (G5-Bb §4).
- `mabs_of_one_le` is the source of the root `abs_of_nonneg` (`to_additive`; see G5-Fa §4).

## 5 · Intended Lean statement

In prose: for every word w of length k ≥ 2 whose syllables are not all equal, |y| = k − 1 if and only if w is a rotation of (1, 4^{k−1}) or of (4, 1^{k−1}).

Probe: `<scratchpad>/M-U4/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block). NOT RUN by this seat (brief amendment 2026-10-30T10:05:25Z: no `lake` from the M seats); the orchestrator elaborates it serially. The text below is the probe's text byte for byte.

```lean
theorem g5_u4_fb (w : List ℕ) (hw : IsWord w) (hk : 2 ≤ w.length)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) :
    |(ntr w).y| = (w.length : ℤ) - 1 ↔
      List.IsRotated w (1 :: List.replicate (w.length - 1) 4) ∨
        List.IsRotated w (4 :: List.replicate (w.length - 1) 1) := by sorry
```

Count line (the template's one-liner, run on this file): see `_UNIT-U4.md` §"Line counts".

## 6 · What the row does not claim

- Not the floor itself as a separate fact (G5-Fa; Fb's ← direction with Fa gives the attainment of the floor).
- Not the trace of the minimizers ((k + 1) + (k − 1)φ, AM §1.3) — the row states only the y-coefficient.
- Not the 2/3 clause (G5-Fc).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:51Z

V1: V1-GREEN 2026-10-30T10:27:35Z — every §2 cite matches verbatim (AM l. 155, 224 and AM-1-second-head l. 127, 128 exact; LEDGER l. 15, STATEMENTS l. 17 substrings). (d) The minimizer families `1 :: List.replicate (k − 1) 4` and `4 :: List.replicate (k − 1) 1` up to `List.IsRotated` are the record's cyclic words (1, 4^{k−1}), (4, 1^{k−1}) ("with equality exactly for", AM l. 155; STATEMENTS.md's "rotation of"); both directions stated, as the record's "exactly"/"iff" requires; at k = 2 the two families are [1, 4] and [4, 1], rotations of each other, so the disjunction is harmlessly redundant there. Natural subtraction exact (k ≥ 2). "Non-constant" and |y| as G5-Fa. Census k ≤ 8 (rotations computed directly): iff 0 failures. Parse: 0 Lean line(s) over 100 code points. SPLIT-OK (leg b of G5-F, the split STATEMENTS.md's Lean note invites).

V2: V2-GREEN 2026-10-30T10:48:53Z — Lean statement(s) byte-identical to §5 and faithful to the record at the locus (STATEMENTS.md e0df0f35, no §4 erratum touches this row); guards, domain, conventions and quantifiers as recorded; unit U4 signed at df5fdf79 (specs/_V2-U4.md).
