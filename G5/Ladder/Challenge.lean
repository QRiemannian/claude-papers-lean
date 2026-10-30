import Mathlib
import G5.Ring.Challenge

/-!
# Unit U5 (`G5/Ladder`) — monotonicity and the exact ladder: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `e0df0f35`.
Rows stated: G5-MONOa, G5-MONOb, G5-LADa, G5-LADb (eleven theorems, one per clause).
G5-LADc is on the correction track (V1-CC) and is not stated here.
This unit defines nothing: every name is unit U1's, imported from `G5.Ring.Challenge`,
or mathlib's / core's. Every proof here is `sorry`; the proofs live in
`G5/Ladder/Solution.lean`.
-/

open G5 ZPhi

namespace G5

/-! ## G5-MONOa — monotonicity: the trace inequality (and the product clause)
Locus: AM transcript §5.1 "Pruning lemma" (l. 198), with §1.1 (l. 34) and §1.2 (l. 50);
TA transcript §1 "Lemma 3" (l. 51); session `2026-10-29-g5-phase-1-structure-dig`;
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.1 (l. 176), §3.2 (l. 178);
STATEMENTS.md row G5-MONO (l. 19), the second clause, read with §4 Errata.
STATEMENTS.md sha256 prefix `e0df0f35`.
V1: V1-GREEN 2026-10-30T10:27:16Z. -/

/-- G5-MONOa, the record's hypothesis made explicit: a product of blocks (the empty product
is `1`) has entries in ℕ[φ] and is `≥ I` entrywise in the real order. -/
theorem g5_u5_mono_prod (u : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4) (i j : Fin 2) :
    nonneg (blockProd u i j) ∧ (1 : M2) i j ≤ blockProd u i j := by sorry

/-- G5-MONOa: for products `A, B` of blocks, `tr (A P_a B) ≥ tr (A B)` in the real order. -/
theorem g5_u5_mono_a (u v : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4)
    (hv : ∀ b ∈ v, 1 ≤ b ∧ b ≤ 4) (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (blockProd u * blockProd v).trace ≤ (blockProd u * P a * blockProd v).trace := by sorry

/-! ## G5-MONOb — monotonicity: the strong clause (rotation, entries, increments)
Locus: AM transcript §5.1 "Pruning lemma", the stronger clause (l. 198),
session `2026-10-29-g5-phase-1-structure-dig`;
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.3 (l. 180–185),
the §2 increment table (l. 138–147), slip 2 (l. 351); `phase-0/DEFINITIONS.md` l. 21;
STATEMENTS.md row G5-MONO (l. 19), the third clause.
STATEMENTS.md sha256 prefix `e0df0f35`.
V1: V1-GREEN 2026-10-30T10:27:16Z. -/

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

/-! ## G5-LADa — the exact ladder: the minimum (lower bound)
Locus: TA transcript §1 "Theorem 4" (l. 53; parts (i)–(iii) at l. 54),
session `2026-10-29-g5-phase-1-structure-dig`;
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §2 item 2 (l. 151, l. 156, l. 162–164);
`phase-0/DEFINITIONS.md` l. 21; STATEMENTS.md row G5-LAD (l. 18), the minimum.
STATEMENTS.md sha256 prefix `e0df0f35`.
V1: V1-GREEN 2026-10-30T10:27:16Z. -/

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

/-! ## G5-LADb — the exact ladder: attainment and uniqueness of the minimizers
Locus: TA transcript §1 "Theorem 4" (l. 53), attainment,
session `2026-10-29-g5-phase-1-structure-dig`;
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §2 item 2 (l. 164, l. 166, l. 168–170),
the §1 Remark (l. 120, l. 126, l. 128), the census table (l. 335–339);
STATEMENTS.md row G5-LAD (l. 18), attainment and uniqueness.
STATEMENTS.md sha256 prefix `e0df0f35`.
V1: V1-GREEN 2026-10-30T10:27:16Z. -/

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

end G5
