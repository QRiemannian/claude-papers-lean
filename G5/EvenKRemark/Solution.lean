import Mathlib
import G5.Ring.Solution
import G5.ModTwo.Solution
import G5.EvenK.Solution

/-!
# Unit U14 (`G5/EvenKRemark`) — Rem. 4.4's remark family (row G5-EVKR): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/EvenKRemark/Challenge.lean` (sha256 prefix `398c41e2`), five theorems under the
same names and statement texts, byte for byte. This module does not import the Challenge: it
imports the proved preludes `G5.Ring.Solution`, `G5.ModTwo.Solution`, `G5.EvenK.Solution` and
restates nothing (the unit defines nothing).
Method: U12's mechanism, restated as private helpers (U12's own are private): reduction mod 2 is
a ring map (`g5_u2_red_hom`), so the reduced literal word is the product of the reduced
syllables, and two syllables at a time `R̄^a S̄ R̄^b S̄ = R̄^(a − b)` in D̄₅, whence
`R̄^(A w mod 5)` at even length. The identity and order clauses are kernel `decide` over the
five exponents mod 5. The rotation is the closed form `A (l ++ [a]) = A l + (−1)^|l| a`.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers (private, `g5_u14_aux_*`): U12's mechanism restated, the order table -/

/-- Helper: `red2M` is the matrix map of a ring map that agrees with `red2`. -/
private theorem g5_u14_aux_map (f : ZPhi →+* F4) (hf : ∀ t : ZPhi, f t = red2 t) (M : M2) :
    red2M M = f.mapMatrix M := by
  simp only [red2M, RingHom.mapMatrix_apply]
  congr 1
  funext t
  exact (hf t).symm

/-- Helper: the reduction of a literal word is the product of its reduced syllables. -/
private theorem g5_u14_aux_red2M_W (f : ZPhi →+* F4) (hf : ∀ t : ZPhi, f t = red2 t)
    (w : List ℕ) : red2M (W w) = (w.map fun a => Rbar ^ a * Sbar).prod := by
  have hR : f.mapMatrix R = Rbar := (g5_u14_aux_map f hf R).symm
  have hS : f.mapMatrix S = Sbar := (g5_u14_aux_map f hf S).symm
  rw [g5_u14_aux_map f hf, W, map_list_prod, List.map_map]
  congr 1
  apply List.map_congr_left
  intro a _
  simp only [Function.comp_apply, map_mul, map_pow, hR, hS]

/-- Helper: `R̄^j` for an exponent read mod 5. -/
private def g5_u14_aux_f (j : ZMod 5) : F4M := Rbar ^ j.val

/-- Helper: the pairing `R̄^a S̄ R̄^b S̄ R̄^j = R̄^(a − b + j)` in D̄₅, a finite check. -/
private theorem g5_u14_aux_step :
    ∀ a ∈ Finset.Icc (1 : ℕ) 4, ∀ b ∈ Finset.Icc (1 : ℕ) 4, ∀ j : ZMod 5,
    Rbar ^ a * Sbar * (Rbar ^ b * Sbar * g5_u14_aux_f j) =
      g5_u14_aux_f ((a : ZMod 5) - b + j) := by
  decide +kernel

/-- Helper: at even length the reduced syllable product is `R̄^(A w mod 5)`. -/
private theorem g5_u14_aux_pair : ∀ w : List ℕ, (∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) → Even w.length →
    (w.map fun a => Rbar ^ a * Sbar).prod = g5_u14_aux_f (A w : ZMod 5)
  | [], _, _ => by simp [A, g5_u14_aux_f]
  | [_], _, h => by simp at h
  | a :: b :: l, hw, h => by
    have hl : Even l.length := by simpa [Nat.even_add_one] using h
    have ih := g5_u14_aux_pair l (fun c hc => hw c (by simp [hc])) hl
    have ha : a ∈ Finset.Icc 1 4 := Finset.mem_Icc.mpr (hw a (by simp))
    have hb : b ∈ Finset.Icc 1 4 := Finset.mem_Icc.mpr (hw b (by simp))
    have hA : ((A (a :: b :: l) : ℤ) : ZMod 5) = (a : ZMod 5) - b + (A l : ZMod 5) := by
      simp only [A]
      push_cast
      ring
    simp only [List.map_cons, List.prod_cons]
    rw [ih, g5_u14_aux_step a ha b hb, hA]

/-- Helper: the mechanism in the helper's notation. -/
private theorem g5_u14_aux_mech (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    red2M (W w) = g5_u14_aux_f (A w : ZMod 5) := by
  obtain ⟨f, hf⟩ := g5_u2_red_hom
  rw [g5_u14_aux_red2M_W f hf, g5_u14_aux_pair w hw.2 hk]

/-- Helper: `R̄^j = 1` exactly at `j = 0` mod 5, a finite check. -/
private theorem g5_u14_aux_one : ∀ j : ZMod 5, g5_u14_aux_f j = 1 ↔ j = 0 := by
  decide +kernel

/-- Helper: for `j ≠ 0` mod 5, `R̄^j` has fifth power 1 and no smaller positive power 1. -/
private theorem g5_u14_aux_ord_tab : ∀ j : ZMod 5, j ≠ 0 →
    g5_u14_aux_f j ^ 5 = 1 ∧ ∀ m < 5, 0 < m → g5_u14_aux_f j ^ m ≠ 1 := by
  decide +kernel

/-- Helper: for `j ≠ 0` mod 5, `R̄^j` has order exactly 5. -/
private theorem g5_u14_aux_ord (j : ZMod 5) (hj : j ≠ 0) : orderOf (g5_u14_aux_f j) = 5 :=
  (orderOf_eq_iff (by norm_num)).mpr (g5_u14_aux_ord_tab j hj)

/-- Helper: `5 ∣ A w` read in `ZMod 5`. -/
private theorem g5_u14_aux_dvd (w : List ℕ) : (5 : ℤ) ∣ A w ↔ ((A w : ℤ) : ZMod 5) = 0 :=
  (ZMod.intCast_zmod_eq_zero_iff_dvd (A w) 5).symm

/-- Helper: the closed form of `A` on an appended last letter. -/
private theorem g5_u14_aux_snoc (a : ℕ) :
    ∀ l : List ℕ, A (l ++ [a]) = A l + (-1) ^ l.length * (a : ℤ)
  | [] => by simp [A]
  | b :: l => by
    simp only [List.cons_append, A, List.length_cons, g5_u14_aux_snoc a l, pow_succ]
    ring

/-- G5-EVKRa (Rem. 4.4, the mechanism). For a word of even length, the reduction mod 2 of
the literal word is `R̄` raised to the alternating sum `A w` read mod 5 (`R̄⁵ = 1`).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (1).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_mech (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    red2M (W w) = Rbar ^ (A w : ZMod 5).val := by
  exact g5_u14_aux_mech w hw hk

/-- G5-EVKRb (Rem. 4.4, clause (b): the first leg). For a word of even length, `5 ∣ A w`
exactly when the reduction mod 2 of the literal word is the identity.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_one (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ red2M (W w) = 1 := by
  rw [g5_u14_aux_dvd, g5_u14_aux_mech w hw hk, g5_u14_aux_one]

/-- G5-EVKRb (Rem. 4.4, clause (b): the second leg). For a word of even length with
`5 ∤ A w`, the reduction mod 2 of the literal word has order exactly 5.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_ord (w : List ℕ) (hw : IsWord w) (hk : Even w.length)
    (h5 : ¬ (5 : ℤ) ∣ A w) : orderOf (red2M (W w)) = 5 := by
  rw [g5_u14_aux_mech w hw hk]
  exact g5_u14_aux_ord _ (fun h => h5 ((g5_u14_aux_dvd w).mpr h))

/-- G5-EVKRb (Rem. 4.4, (a) ⟺ (b)). For a word of even length, `5 ∣ A w` exactly when
the image of the literal word mod 2 has order other than 5 (the Atlas's test (11.4)).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ orderOf (red2M (W w)) ≠ 5 := by
  by_cases h5 : (5 : ℤ) ∣ A w
  · refine ⟨fun _ => ?_, fun _ => h5⟩
    rw [(g5_u14_evkr_one w hw hk).mp h5, orderOf_one]
    norm_num
  · exact ⟨fun h => absurd h h5, fun h => absurd (g5_u14_evkr_ord w hw hk h5) h⟩

/-- G5-EVKRc (Rem. 4.4, the rotation). For a list `a :: l` of even length, the one-step
rotation `l ++ [a]` has alternating sum exactly `−A (a :: l)`, as integers.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Rotation (the brief's
question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72), clause (3).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_rot (a : ℕ) (l : List ℕ) (hk : Even (a :: l).length) :
    A (l ++ [a]) = -A (a :: l) := by
  have hl : Odd l.length := by
    simpa [List.length_cons, Nat.even_add_one, Nat.not_even_iff_odd] using hk
  rw [g5_u14_aux_snoc, hl.neg_one_pow]
  simp only [A]
  ring

end G5
