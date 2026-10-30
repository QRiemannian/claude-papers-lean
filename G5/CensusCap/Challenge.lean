import Mathlib
import G5.Ring.Challenge
import G5.Ladder.Challenge
import G5.Census.Challenge

/-!
# Unit U13 (`G5/CensusCap`) — the census cap clause (row G5-CAP): statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` · 25981 B, which
EXTENDS the frozen units' edition: its first 21568 B are the edition sha256
`a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` · 21568 B.
Rows stated (STATEMENTS.md §5, l. 64): G5-CAPa (the cap, X ≥ 3φ), G5-CAPb (the failure
interval and its converse). This unit defines nothing: `ZPhi`, `phi`, the real order,
`IsWord`, `ntr` are unit U1's (`G5.Ring.Challenge`); unit U5 (`G5.Ladder.Challenge`, the
non-constancy form) and unit U11 (`G5.Census.Challenge`) are imported for the pieces the
proof composes with. All three imported units are frozen. Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-CAPa (the census cap, X ≥ 3φ). For `X` in ℤ[φ] with `3φ ≤ X` (real order), every
non-constant word with normalized trace `t ≤ X` has `(k + 1) φ ≤ X`, `k` its length.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353); STATEMENTS.md row G5-CAP (l. 64), part (a).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_a (X : ZPhi) (hX : 3 * phi ≤ X) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) :
    ((w.length : ZPhi) + 1) * phi ≤ X := by sorry

/-- G5-CAPb (the failure interval of the cap). If a non-constant word has normalized
trace `t ≤ X < (k + 1) φ` (real order), `k` its length, then it is a rotation of
`(1, 4)` and `3 + φ ≤ X < 3φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353); STATEMENTS.md row G5-CAP (l. 64), part (b).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) (hX : X < ((w.length : ZPhi) + 1) * phi) :
    List.IsRotated w [1, 4] ∧ 3 + phi ≤ X ∧ X < 3 * phi := by sorry

/-- G5-CAPb (the converse: the cap fails on that interval). A rotation of `(1, 4)` and
any `X` with `3 + φ ≤ X < 3φ` (real order) satisfy `t ≤ X < (k + 1) φ`, `k` its length.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353), "fails … for X ∈ [3 + φ, 3φ)"; STATEMENTS.md row G5-CAP (l. 64), part (b),
"exactly". STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b_conv (X : ZPhi) (w : List ℕ) (hr : List.IsRotated w [1, 4])
    (h1 : 3 + phi ≤ X) (h2 : X < 3 * phi) :
    ntr w ≤ X ∧ X < ((w.length : ZPhi) + 1) * phi := by sorry

end G5
