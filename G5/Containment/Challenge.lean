import Mathlib
import G5.Ring.Challenge
import G5.Group.Challenge
import G5.GroupLevel.Challenge
import G5.WordLevel.Challenge

/-!
# Unit U10 (`G5/Containment`) — the Corollary's containment (row G5-COR): statement

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` · 21568 B.
Row stated: G5-COR. This unit defines nothing: `ZPhi`, `M2` are unit U1's
(`G5.Ring.Challenge`), `HeckeGrp` is unit U7's (`G5.Group.Challenge`); unit U8
(`G5.GroupLevel.Challenge`) and unit U3 (`G5.WordLevel.Challenge`) are imported for the legs
the proof composes with. All four imported units are frozen. `φ⁻¹` is notation for the pair
`⟨−1, 1⟩ = φ − 1`; no inverse theorem is stated. Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-COR (the Corollary's containment). Every element of `⟨S, T⟩` has trace in
`{±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + y φ) : x ≥ 0, y ≥ 1}`, with `φ⁻¹` the pair `⟨−1, 1⟩ = φ − 1`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it",
Corollary (l. 263–265); STATEMENTS.md row G5-COR (l. 25).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u10_cor (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ((g : M2).trace = (⟨2, 0⟩ : ZPhi) ∨ (g : M2).trace = (⟨-2, 0⟩ : ZPhi) ∨
      (g : M2).trace = 0 ∨
      (g : M2).trace = (⟨0, 1⟩ : ZPhi) ∨ (g : M2).trace = (⟨0, -1⟩ : ZPhi) ∨
      (g : M2).trace = (⟨-1, 1⟩ : ZPhi) ∨ (g : M2).trace = (⟨1, -1⟩ : ZPhi)) ∨
    ∃ x y : ℤ, 0 ≤ x ∧ 1 ≤ y ∧
      ((g : M2).trace = (⟨x, y⟩ : ZPhi) ∨ (g : M2).trace = -(⟨x, y⟩ : ZPhi)) := by sorry

end G5
