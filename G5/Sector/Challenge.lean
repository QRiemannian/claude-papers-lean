import Mathlib
import G5.Ring.Challenge

/-!
# Unit U4 (`G5/Sector`) — the sector (Theorem B) and the floor: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `e0df0f35`.
Rows stated: G5-Ba, G5-Bb, G5-Bc, G5-Fa, G5-Fb, G5-Fc (nine theorems). This unit defines one
thing, `ZPhi.rabs` (row G5-Bc); every other name is unit U1's, imported from `G5.Ring.Challenge`.
Every proof here is `sorry`; the proofs live in `G5/Sector/Solution.lean`.
-/

open G5 ZPhi

namespace G5

/-- G5-Ba (Theorem B, the sector inequality). For every word that is neither
`(1^k)` nor `(4^k)`, the normalized trace `x + y φ` has `y ≥ 1` and `0 ≤ x ≤ y + 2`.
Locus: TA transcript §1 "Theorem B" (l. 43–44); `candidates/LEDGER.md` row AM-2
(l. 13); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 70–73).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_ba (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    1 ≤ (ntr w).y ∧ 0 ≤ (ntr w).x ∧ (ntr w).x ≤ (ntr w).y + 2 := by sorry

/-- G5-Bb (Theorem B, the equality family). For every word that is neither `(1^k)`
nor `(4^k)`, `x = y + 2` iff the word is a rotation of `1^a 4^b`, `a, b ≥ 1`.
Locus: `candidates/LEDGER.md` row AM-2′ (l. 14);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 75, l. 88, l. 90).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bb (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    (ntr w).x = (ntr w).y + 2 ↔
      ∃ a b : ℕ, 1 ≤ a ∧ 1 ≤ b ∧
        List.IsRotated w (List.replicate a 1 ++ List.replicate b 4) := by sorry

/-- G5-Bb (Theorem B, the family's trace). For `a, b ≥ 1` and every rotation
of `1^a 4^b`, `t = (2 + ab) + ab φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 88, l. 90).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bb_tr (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) (w : List ℕ)
    (hw : List.IsRotated w (List.replicate a 1 ++ List.replicate b 4)) :
    ntr w = (⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi) := by sorry

end G5

-- G5-Bc: the one definition this unit owns (spec G5-Bc §5).
namespace ZPhi

/-- The real absolute value: `t` if `t ≥ 0` in the real order (`RealNonneg`), else `−t`. -/
def rabs (t : ZPhi) : ZPhi := if RealNonneg t then t else -t

end ZPhi

namespace G5

/-- G5-Bc (Theorem B, the θ bound). For every word that is neither `(1^k)` nor
`(4^k)`, `11 |t^σ| ≤ (17 − 7φ) t` in the real order, with equality iff `t = 3 + φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 94–114);
TA transcript §1 (l. 47); `candidates/LEDGER.md` row TA-0 (l. 28).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    11 * rabs (conj (ntr w)) ≤ (17 - 7 * phi) * ntr w ∧
      (11 * rabs (conj (ntr w)) = (17 - 7 * phi) * ntr w ↔ ntr w = 3 + phi) := by sorry

/-- G5-Bc (the constant). `(4 − φ) · 11 = (17 − 7φ)(3 + φ)` in ℤ[φ], the
cross-multiplied form of `(4 − φ)/(3 + φ) = (17 − 7φ)/11`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 103, l. 105).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc_id : (4 - phi) * 11 = (17 - 7 * phi) * (3 + phi) := by sorry

/-- G5-Bc (attainment). The word `(1, 4)` has `t = 3 + φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc_att : ntr [1, 4] = 3 + phi := by sorry

/-- G5-Fa (the floor). For every non-constant word of length `k ≥ 2`,
`|y| ≥ k − 1`.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fa (w : List ℕ) (hw : IsWord w) (hk : 2 ≤ w.length)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) :
    (w.length : ℤ) - 1 ≤ |(ntr w).y| := by sorry

/-- G5-Fb (the minimizers). For every non-constant word of length `k ≥ 2`,
`|y| = k − 1` iff the word is a rotation of `(1, 4^{k−1})` or `(4, 1^{k−1})`.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fb (w : List ℕ) (hw : IsWord w) (hk : 2 ≤ w.length)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) :
    |(ntr w).y| = (w.length : ℤ) - 1 ↔
      List.IsRotated w (1 :: List.replicate (w.length - 1) 4) ∨
        List.IsRotated w (4 :: List.replicate (w.length - 1) 1) := by sorry

/-- G5-Fc (the 2/3 clause). For every word containing a syllable 2 or 3,
`|y| ≥ k + 1`, `k` its length.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fc (w : List ℕ) (hw : IsWord w) (h23 : 2 ∈ w ∨ 3 ∈ w) :
    (w.length : ℤ) + 1 ≤ |(ntr w).y| := by sorry

end G5
