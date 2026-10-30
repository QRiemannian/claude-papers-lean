# G5-MONOb

## 1 · Header

row: G5-MONOb
unit: U5
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` read 2026-10-30T10:06:17Z; §4 Errata included)
locus: AM transcript §5.1 "Pruning lemma", the stronger clause (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.3 (l. 180–185), the §2 increment table (l. 138–147), slip 2 (l. 351); `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 21 (constant words); STATEMENTS.md row G5-MONO (l. 19), its THIRD clause (pointer). SPLIT of G5-MONO per the brief (half b); SH-P2-1 item 3's corrected form
spec_clock: 2026-10-30T10:18:44Z

## 2 · Printed statement, verbatim

The clause as AM first printed it:

> and every non-constant cyclic word has a rotation starting with 2, 3, or the pair (1, 4), after which every prefix has all entries ≥ 1 and each extension raises the trace by ≥ 1.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198

The second head's corrected form (the authority for this row's wording):

> **§3.3 AM §5.1, the stronger clause: HOLDS on the natural reading.** The reading is "every prefix that contains the opening 2 or 3, or the whole opening pair (1, 4)". The bare prefix (1) of a (1, 4)-start, P₁ = [[1, φ], [0, 1]], has a 0 entry.
> - **Rotation.** Every non-constant cyclic word has such a rotation: open at a 2 or 3 if one occurs; otherwise somewhere a 1 is cyclically followed by a 4.
> - **Entries.** P₂, P₃ and P₁P₄ = [[1 + φ², φ], [φ, 1]] have all entries ≥ 1. The property propagates, since QP_a = Q + Q(P_a − I) ≥ Q.
> - **Increments.** By the §2 table, each extension raises the trace by ≥ φ, which is stronger than AM's ≥ 1.
> - **Census.** Every prefix with such an opening has all entries ≥ 1 (0 violations). All 786,428 extensions of such prefixes, k ≤ 10, raise the trace by ≥ 1 (0 violations) and by ≥ φ (0 violations).
> - **Law sheet.** It reads "(and by ≥ φ once the ladder's hypothesis holds)". This is the same hypothesis as "all four entries ≥ 1", so the two clauses coincide at ≥ φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 180–185

> 2. **AM §5.1 wording.** "Every prefix" must read "every prefix containing the opening 2/3 or the whole opening pair (1, 4)". The prefix (1) has a 0 entry (§3.3). The increment is in fact ≥ φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 351

The increments it cites (the §2 table):

> **(i) The increments.** I recomputed tr(P(A_a − I)) = Σ P_ij(A_a − I)_ji for each letter:
>
> | a | A_a − I | increment | lower bound |
> |---|---|---|---|
> | 1 | [[0, φ], [0, 0]] | φP₂₁ | φ |
> | 4 | [[0, 0], [φ, 0]] | φP₁₂ | φ |
> | 2 | [[φ−1, φ], [1, φ−1]] | (φ−1)(P₁₁+P₂₂) + P₁₂ + φP₂₁ | 3φ − 1 |
> | 3 | [[φ−1, 1], [φ, φ−1]] | (φ−1)(P₁₁+P₂₂) + φP₁₂ + P₂₁ | 3φ − 1 |
>
> All four agree with TA, and each is ≥ φ. Inserting a letter at an arbitrary position reduces to inserting it at the end by rotating, and rotation preserves the trace, P ≥ I and det.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 138–147

The constant words and "hyperbolic", as the record defines them:

> - The constant words (1, 1, …, 1) and (q − 1, …, q − 1) are parabolic (trace ±2), the words T^{±k}; every other cyclic word is hyperbolic. When the Atlas counts "classes" it counts cyclic words up to rotation; where it says "hyperbolic classes" the two parabolic constant words at each length are excluded. When it counts "words visited" it counts SEQUENCES, all (q − 1)^k of them at each k, rotations included.
>
> — `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 21

The list's row (pointer):

> after a rotation beginning with 2, 3 or the whole pair (1, 4), every prefix has all four entries ≥ 1 and each further syllable raises the trace by ≥ φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 19

## 3 · Formal reading

Three declarations, one per clause of the corrected form:
- **Rotation** (SH-P2-1 l. 181): for every word w other than (1^k), (4^k), some rotation v of w opens with 2, or with 3, or with the whole pair (1, 4): `v.head? = some 2 ∨ v.head? = some 3 ∨ v.take 2 = [1, 4]`. "Non-constant" is the record's (below).
- **Entries** (SH-P2-1 l. 180, l. 182, slip 2 l. 351): every prefix that holds the opening 2 or 3, or the WHOLE opening pair (1, 4), has all four entries ≥ 1 in the real order. Read over all words p with such an opening: every prefix of the rotated word that contains its opening is such a p, and every such p is a prefix of itself, so the two quantifications coincide. The bare prefix (1) of a (1, 4)-start is excluded by `p.take 2 = [1, 4]` (it has a 0 entry, l. 180).
- **Increments** (SH-P2-1 l. 183, with the l. 138–147 table): for such a p and each a ∈ {1, 2, 3, 4}, tr(p a) ≥ tr(p) + φ in the real order — "each extension raises the trace by ≥ φ", the extension being one further syllable at the end. The ≥ φ is the corrected strength (AM printed ≥ 1; SH-P2-1 l. 183: "stronger than AM's ≥ 1"; the STATEMENTS.md row and the brief carry ≥ φ).
- **Constant words.** "Constant" is the record's: the words (1^k) and (4^k) only (`phase-0/DEFINITIONS.md` l. 21; AM l. 14; `PHASE-2-DEFINITIONS.md` l. 9), written `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4`. (2^k), (3^k) are NOT constant in this sense (they are hyperbolic). The record defines "hyperbolic class" as exactly these non-constant words: "every other cyclic word is hyperbolic … where it says "hyperbolic classes" the two parabolic constant words at each length are excluded" (DEFINITIONS l. 21, quoted in §2).
- **Conventions.** Words are lists over {1, 2, 3, 4} with U1's `IsWord` (non-empty); possibly-empty products of blocks carry `∀ b ∈ u, 1 ≤ b ∧ b ≤ 4` instead (SH-P2-1 §3.1: "A and B may be empty"; the empty product is `1 = I`). Words, not classes (STATEMENTS.md §2 note 4): a class statement is read as the statement for every word of the class, the trace being rotation-invariant; rotations are mathlib's `List.IsRotated w v` (∃ n, w.rotate n = v). The trace is the NORMALIZED one, U1's `ntr` = tr(P_{a₁}⋯P_{a_k}), which is (−1)^k · tr W for the literal lift (U1's `g5_u1_trace`); no statement here mentions `W`, so no sign enters. `≤` is U1's exact REAL order `instLE` (s ≤ t ⟺ t − s ≥ 0 as a real number, decided by the sign of a + b√5); `nonneg` is ℕ[φ].
- "≥ 1" on an entry and "≥ φ" on an increment are both real-order (`instLE`); the 1 is `(1 : ZPhi)`, φ is U1's `phi`.

## 4 · Target mathlib declarations

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.perm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:404
List.replicate	NOT FOUND
List.head?	NOT FOUND
List.take	NOT FOUND
List.rotate	NOT FOUND
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
```

`List.replicate`, `List.head?` and `List.take` are Lean CORE at the pinned toolchain (`Init/Data/List/Basic.lean:706`, `:381`, `:912`); `List.rotate`, which `List.IsRotated` unfolds to (`∃ n, l.rotate n = l'`, `Mathlib/Data/List/Rotate.lean:362–364`), is in Batteries (`.lake/packages/batteries/Batteries/Data/List/Basic.lean:653`). All resolve under `import Mathlib`; the row is not NEEDS-DEVELOPMENT. Statements use the name `List.IsRotated` rather than its infix `~r`.

## 5 · Intended Lean statement

In prose: (rotation) a word other than (1^k), (4^k) has a rotation opening with 2, with 3, or with (1, 4); (entries) a word opening with 2, with 3, or with (1, 4) has a block product with all four entries ≥ 1 in the real order; (increments) for such a word p and any syllable a, the normalized trace of p followed by a is ≥ the normalized trace of p plus φ, in the real order.

Probe: `<scratchpad>/M-U5/probe.lean` (sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec`; U1's final probe `f15f3200…` copied whole as the prefix, then U5's block). NOT RUN by this seat (the brief's amendment of 10:05:25Z): the orchestrator elaborates it. The text below is the probe's text byte for byte.

```lean
/-- G5-MONOb, the rotation: a word other than `(1^k)`, `(4^k)` has a rotation opening
with 2, with 3, or with the whole pair (1, 4). -/
theorem g5_u5_mono_b_rot (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ∃ v, List.IsRotated w v ∧
      (v.head? = some 2 ∨ v.head? = some 3 ∨ v.take 2 = [1, 4]) := by sorry

/-- G5-MONOb, the entries: a prefix holding the opening 2 or 3, or the whole opening
pair (1, 4), has all four entries `≥ 1` in the real order. -/
theorem g5_u5_mono_b_ge1 (p : List ℕ) (hp : IsWord p)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) (i j : Fin 2) :
    1 ≤ blockProd p i j := by sorry

/-- G5-MONOb, the increments: past such a prefix, each further syllable raises the
normalized trace by `≥ φ` in the real order. -/
theorem g5_u5_mono_b_step (p : List ℕ) (hp : IsWord p)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4])
    (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    ntr p + phi ≤ ntr (p ++ [a]) := by sorry
```

## 6 · What the row does not claim

- Not AM's uncorrected "every prefix" (the prefix (1) of a (1, 4)-start has a 0 entry); not AM's ≥ 1 as a separate statement (it is implied by ≥ φ).
- Not that the rotation is unique, nor which rotation; not that (2^k), (3^k) are excluded (they are covered: they open with 2 or 3).
- Not insertion at an arbitrary position (only appending one syllable at the end of an opened word; SH-P2-1 l. 147's reduction of arbitrary insertion to the end by rotation is not stated).
- Not the census-instrument claims (completeness, termination, the k cap: SH-P2-1 §3.4) — they are about a program, not about the words.
- Nothing about the coefficientwise order; nothing about the literal trace `W`.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:18:44Z

V1: V1-GREEN 2026-10-30T10:27:16Z — all six §2 cites match verbatim (AM l. 198 substring; SH-P2-1 l. 180–185, l. 351, l. 138–147, DEFINITIONS l. 21 whole; STATEMENTS.md l. 19 substring). The three declarations are SH-P2-1 §3.3's corrected clause, the row's strength: (rot) l. 181; (ge1) "every prefix" as slip 2's "every prefix containing the opening 2/3 or the whole opening pair (1, 4)" (l. 351), `p.take 2 = [1, 4]` excluding the bare (1), whose P₁ has a 0 entry (l. 180; checked) — quantifying over all opened words equals quantifying over the opened prefixes of a rotated word, as §3 argues; (step) one syllable appended at the end with ≥ φ (l. 183, the corrected strength; AM's ≥ 1 implied, not restated); insertion at an arbitrary position is not claimed (narrower than SH-P2-1 l. 147, which the row does not carry). Convention confirmed: "non-constant" = not (1^k), not (4^k), AM's own usage at l. 14 and DEFINITIONS l. 21; (2^k), (3^k) are included and covered by the record's argument ("open at a 2 or 3 if one occurs", l. 181). Lane note, not a drift: U4's G5-Fa/Fb read "non-constant" as not-all-equal (AM l. 56), a different notion, each grounded for its own row. Names: U1's `IsWord`, `blockProd`, `ntr`, `phi`, `instLE`; mathlib `List.IsRotated`; core `head?`, `take`, `replicate`; nothing defined. Exact check (k ≤ 8): rot 87,364 words, ge1 49,151, step 196,604 — 0 violations. Parse: 0 Lean line(s) over 100 code points
