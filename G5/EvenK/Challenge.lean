import Mathlib
import G5.Ring.Challenge
import G5.ModTwo.Challenge

/-!
# Unit U12 (`G5/EvenK`) — the even-k law (row G5-EVK): statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` · 25981 B, which
EXTENDS the frozen units' edition: its first 21568 B are the edition sha256
`a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` · 21568 B.
Rows stated (STATEMENTS.md §5, l. 63): G5-EVKa ((a) ⟺ (c)), G5-EVKb ((c) ⟺ (d)).
This unit defines ONE thing, the alternating sum `A : List ℕ → ℤ`. `ZPhi` and its fields,
`IsWord`, `W` are unit U1's (`G5.Ring.Challenge`); unit U2 (`G5.ModTwo.Challenge`) is
imported for the reduction mod 2 the proof composes with. Both imported units are frozen.
Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-EVK, the one definition: the alternating sum of the syllables,
`A [a₁, a₂, …, a_k] = a₁ − a₂ + a₃ − ⋯` in ℤ, by recursion: `A [] = 0` and
`A (a :: l) = a − A l`.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 (l. 58); STATEMENTS.md row
G5-EVK (l. 63). STATEMENTS.md sha256 prefix `1fb5b03e`. -/
def A : List ℕ → ℤ
  | [] => 0
  | a :: l => (a : ℤ) - A l

/-- G5-EVKa (the even-k law, (a) ⟺ (c)). For a word of even length, `5 ∣ A w` exactly
when the φ-coefficient `y` of `tr W = x + y φ` is even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); AM transcript §3.1 (l. 124); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_a (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ Even (W w).trace.y := by sorry

/-- G5-EVKb (the even-k law, (c) ⟺ (d)). For a word of even length, the φ-coefficient
`y` of `tr W = x + y φ` is even exactly when `x` and `y` are both even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    Even (W w).trace.y ↔ (Even (W w).trace.x ∧ Even (W w).trace.y) := by sorry

end G5
