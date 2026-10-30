import Mathlib
import G5.Ring.Challenge
import G5.ModTwo.Challenge
import G5.EvenK.Challenge

/-!
# Unit U14 (`G5/EvenKRemark`) — Rem. 4.4's remark family (row G5-EVKR): statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` · 31612 B (the
§6 errata appended after V₁), which EXTENDS the editions before it: its first 30598 B
are the edition sha256 `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`
· 30598 B (the specs' edition; the docstrings below carry its prefix `4a53d9ba`), its
first 25981 B the edition `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`
and its first 21568 B the edition
`a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`.
Rows stated (STATEMENTS.md §6, l. 72): G5-EVKRa (clause (1), the mechanism), G5-EVKRb
(clause (2): its two legs and (a) ⟺ (b)), G5-EVKRc (clause (3), the rotation).
This unit defines nothing: `ZPhi`, `IsWord`, `W` are unit U1's (`G5.Ring.Challenge`);
`F4M`, `red2M`, `Rbar` are unit U2's (`G5.ModTwo.Challenge`); the alternating sum `A` is
unit U12's (`G5.EvenK.Challenge`). All three imported units are frozen.
Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-EVKRa (Rem. 4.4, the mechanism). For a word of even length, the reduction mod 2 of
the literal word is `R̄` raised to the alternating sum `A w` read mod 5 (`R̄⁵ = 1`).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (1).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_mech (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    red2M (W w) = Rbar ^ (A w : ZMod 5).val := by sorry

/-- G5-EVKRb (Rem. 4.4, clause (b): the first leg). For a word of even length, `5 ∣ A w`
exactly when the reduction mod 2 of the literal word is the identity.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_one (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ red2M (W w) = 1 := by sorry

/-- G5-EVKRb (Rem. 4.4, clause (b): the second leg). For a word of even length with
`5 ∤ A w`, the reduction mod 2 of the literal word has order exactly 5.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_ord (w : List ℕ) (hw : IsWord w) (hk : Even w.length)
    (h5 : ¬ (5 : ℤ) ∣ A w) : orderOf (red2M (W w)) = 5 := by sorry

/-- G5-EVKRb (Rem. 4.4, (a) ⟺ (b)). For a word of even length, `5 ∣ A w` exactly when
the image of the literal word mod 2 has order other than 5 (the Atlas's test (11.4)).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ orderOf (red2M (W w)) ≠ 5 := by sorry

/-- G5-EVKRc (Rem. 4.4, the rotation). For a list `a :: l` of even length, the one-step
rotation `l ++ [a]` has alternating sum exactly `−A (a :: l)`, as integers.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Rotation (the brief's
question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72), clause (3).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_rot (a : ℕ) (l : List ℕ) (hk : Even (a :: l).length) :
    A (l ++ [a]) = -A (a :: l) := by sorry

end G5
