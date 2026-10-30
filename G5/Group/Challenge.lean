import Mathlib
import G5.Ring.Challenge

/-!
# Unit U7 (`G5/Group`) — the group-level corollaries and the φ-line: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `e0df0f35`.
Rows stated: G5-U7-NF, G5-U7-INTa, G5-U7-INTb, G5-PHIa, G5-PHIb, G5-PHIc. This unit defines
`HeckeGrp` and `IsNF` (row G5-U7-NF, byte for byte from its spec); every other name is
unit U1's, imported from `G5.Ring.Challenge`.
Every proof here is `sorry`; the proofs live in `G5/Group/Solution.lean`.
-/

open G5 ZPhi

namespace G5

/-- The subgroup `⟨S, T⟩` of the units of `M2`: the closure of the units whose
underlying matrices are `S` and `T`. -/
def HeckeGrp : Subgroup M2ˣ :=
  Subgroup.closure {u : M2ˣ | (u : M2) = S ∨ (u : M2) = T}

/-- The syllable forms: `±I`, `±S`, `±R^a` (`1 ≤ a ≤ 4`), `±W w` (`IsWord w`). -/
def IsNF (m : M2) : Prop :=
  m = 1 ∨ m = -1 ∨ m = S ∨ m = -S ∨
    (∃ a : ℕ, (1 ≤ a ∧ a ≤ 4) ∧ (m = R ^ a ∨ m = -(R ^ a))) ∨
    ∃ w : List ℕ, IsWord w ∧ (m = W w ∨ m = -(W w))

end G5

namespace G5

/-- G5-U7-NF (normal form, existence). Every `g ∈ ⟨S, T⟩` has a conjugate `h g h⁻¹`,
`h ∈ ⟨S, T⟩`, equal to `±I`, `±S`, `±R^a` (`1 ≤ a ≤ 4`) or `±W w` for a word `w`.
Locus: `candidates/checks/AM-1-second-head.md` §4 "Scope" (l. 65–72) and the
Corollary of "Theorem as I would print it" (l. 263–267).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_nf (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ h ∈ HeckeGrp, IsNF ((h * g * h⁻¹ : M2ˣ) : M2) := by sorry

/-- G5-U7-INTa (integer traces, `⊆`). Every element of `⟨S, T⟩` whose trace has
φ-coefficient `0` has trace `0`, `2` or `−2`.
Locus: `candidates/LEDGER.md` row AM-1 (l. 12); `candidates/checks/AM-1-second-head.md`
Corollary (l. 263–267) and §4 (l. 73–77).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_int_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hy : phiCoeff (g : M2).trace = 0) :
    (g : M2).trace = 0 ∨ (g : M2).trace = (⟨2, 0⟩ : ZPhi) ∨
      (g : M2).trace = (⟨-2, 0⟩ : ZPhi) := by sorry

/-- G5-U7-INTb (integer traces, `⊇`). Each of `0`, `2`, `−2` is the trace of some
element of `⟨S, T⟩`.
Locus: `candidates/checks/AM-1-second-head.md` Corollary, last sentence (l. 267) and
§4 (l. 73–76); `candidates/LEDGER.md` row AM-1 (l. 12).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_int_b (t : ZPhi)
    (ht : t = 0 ∨ t = (⟨2, 0⟩ : ZPhi) ∨ t = (⟨-2, 0⟩ : ZPhi)) :
    ∃ g ∈ HeckeGrp, (g : M2).trace = t := by sorry

/-- G5-PHIa (the φ-line, characterization). For every word, `x = 0` in `t = x + y φ`
iff the word is a cyclic rotation of `(1^{k−1}, 2)` or of `(3, 4^{k−1})`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 Remark (l. 120–128);
`candidates/LEDGER.md` row R-4 (l. 37).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_a (w : List ℕ) (hw : IsWord w) :
    (ntr w).x = 0 ↔
      (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
        List.IsRotated w (3 :: List.replicate (w.length - 1) 4)) := by sorry

/-- G5-PHIb (the φ-line, value). For every word with `x = 0`, `t = (k + 1) φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 Remark, step 6 (l. 126)
and l. 128; `candidates/LEDGER.md` row R-4 (l. 37).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_b (w : List ℕ) (hw : IsWord w) (hx : (ntr w).x = 0) :
    ntr w = (⟨0, (w.length : ℤ) + 1⟩ : ZPhi) := by sorry

/-- G5-PHIc (the φ-line, realization). For every `k ≥ 1` some word of syllable count `k`
has `t = (k + 1) φ`.
Locus: RPA transcript, session `2026-10-29-g5-phase-1-structure-dig`, `transcript/rpa.md`
(l. 37); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "Realization" (l. 110).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_c (k : ℕ) (hk : 1 ≤ k) :
    ∃ w : List ℕ, IsWord w ∧ w.length = k ∧ ntr w = (⟨0, (k : ℤ) + 1⟩ : ZPhi) := by sorry

end G5
