import Mathlib
import G5.Ring.Challenge
import G5.Group.Challenge
import G5.Sector.Challenge
import G5.WordLevel.Challenge
import G5.SectorGroup.Challenge

/-!
# Unit U16 (`G5/ClassSep`) — Cor. 3.7 at element level (row G5-CSEP): statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`5f2f0ed820a3acf6e2be57f5f11fe12a0c0c3010e74a0ae89ef33eec8783bdf3` · 36526 B (the
fourth extending edition: §7 appended with this wave's sheet lines), which EXTENDS the
editions before it: its first 31612 B are the edition sha256
`9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` · 31612 B (the specs'
edition; the docstrings below carry its prefix `9ebf3004`), its first 30598 B the edition
`4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, its first 25981 B the
edition `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` and its first
21568 B the edition `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`.
Rows stated (STATEMENTS.md §7, l. 84): G5-CSEPa (the linear clause, `t − t^σ = y √5 ≥ √5`),
G5-CSEPb (the distance clause, squared, `(t − t^σ)² = 5 y² ≥ 5`).
This unit defines nothing: `ZPhi` and its fields, `phi`, `conj`, the real order, `M2` are
unit U1's (`G5.Ring.Challenge`); `HeckeGrp` is unit U7's (`G5.Group.Challenge`); `rabs` is
unit U4's (`G5.Sector.Challenge`); unit U3 (`G5.WordLevel.Challenge`) and unit U9
(`G5.SectorGroup.Challenge`) are imported for the legs the proof composes with. All five
imported units are frozen. Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-CSEPa (Cor. 3.7 at element level, the linear clause). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, with its normalized trace `t = |tr g|`,
`t − t^σ = y √5 ≥ √5`, `y` the φ-coefficient of `t` and `√5` the ring element `2φ − 1`.
Locus: TA transcript §1 "E2, sharpened" (l. 49); DO transcript §1.3 (l. 47);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 197–200);
STATEMENTS.md row G5-SEP (l. 22). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u16_csep_lin (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    rabs (g : M2).trace - conj (rabs (g : M2).trace) =
        (rabs (g : M2).trace).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ rabs (g : M2).trace - conj (rabs (g : M2).trace) := by sorry

/-- G5-CSEPb (Cor. 3.7 at element level, the distance clause, squared). Every hyperbolic
element `g` of `⟨S, T⟩` (`|tr g| > 2` in the real order) has, with its normalized trace
`t = |tr g|`, `(t − t^σ)² = 5 y² ≥ 5`: the point `(t, t^σ)` lies at distance
`|t − t^σ| / √2 ≥ √(5/2)` from the diagonal of `ℝ²`, stated in the ring without `√`.
Locus: TA transcript §1 "E2, sharpened" (l. 49); DO transcript §1.3 (l. 47);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 200);
STATEMENTS.md row G5-SEP (l. 22). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u16_csep_sq (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    (rabs (g : M2).trace - conj (rabs (g : M2).trace)) ^ 2 =
        (⟨5 * (rabs (g : M2).trace).y ^ 2, 0⟩ : ZPhi) ∧
      (5 : ZPhi) ≤ (rabs (g : M2).trace - conj (rabs (g : M2).trace)) ^ 2 := by sorry

end G5
