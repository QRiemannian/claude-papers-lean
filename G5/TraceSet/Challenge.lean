import Mathlib
import G5.Ring.Challenge
import G5.Group.Challenge
import G5.GroupLevel.Challenge

/-!
# Unit U17 (`G5/TraceSet`) — the trace set's sign-symmetry and `±φ⁻¹` (rows G5-TSYM,
G5-PHIINV): statements

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
Rows stated (STATEMENTS.md §7, l. 85, l. 86): G5-TSYM (every literal trace has its
negative), G5-PHIINV (each of `±φ⁻¹` is a trace).
This unit defines nothing: `ZPhi`, `M2` are unit U1's (`G5.Ring.Challenge`); `HeckeGrp` is
unit U7's (`G5.Group.Challenge`); unit U8 (`G5.GroupLevel.Challenge`) is imported for the
leg PHIINV composes with. All three imported units are frozen. Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-TSYM (the sign-symmetry of the trace set). For every element `g` of `⟨S, T⟩` there is
an element `h` of `⟨S, T⟩` with `tr h = −tr g`: the set of literal traces is symmetric under
`t ↦ −t`.
Locus: `candidates/checks/AM-1-second-head.md` §4 "Every element, not only every class"
(l. 72); the print `phase-4/draft/S2-preliminaries.md` §2.1 (l. 66–68).
STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u17_tsym (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ h ∈ HeckeGrp, (h : M2).trace = -(g : M2).trace := by sorry

/-- G5-PHIINV (`±φ⁻¹` realized). Each of `φ⁻¹` and `−φ⁻¹` — the pairs `⟨−1, 1⟩ = φ − 1` and
`⟨1, −1⟩ = 1 − φ` — is the trace of some element of `⟨S, T⟩`.
Locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 26) and §4 "The non-hyperbolic
traces" (l. 73–74); the print `phase-4/draft/S2-preliminaries.md` Prop. 2.5 (l. 196–199),
l. 210–212, and `phase-4/draft/S3-theorem-a.md` l. 51–53.
STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u17_phiinv (t : ZPhi)
    (ht : t = (⟨-1, 1⟩ : ZPhi) ∨ t = (⟨1, -1⟩ : ZPhi)) :
    ∃ g ∈ HeckeGrp, (g : M2).trace = t := by sorry

end G5
