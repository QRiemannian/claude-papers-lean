import Mathlib
import G5.Ring.Solution
import G5.ModTwo.Solution

/-!
# Unit U12 (`G5/EvenK`) — the even-k law (row G5-EVK): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/EvenK/Challenge.lean` (sha256 prefix `321dfbf5`), two theorems under the same
names and statement texts, byte for byte. This module does not import the Challenge: it imports
the proved preludes `G5.Ring.Solution` and `G5.ModTwo.Solution` and restates the unit's one
definition `A` byte for byte.
Method: reduction mod 2 is a ring map (`g5_u2_red_hom`), so the reduced literal word is the
product of the reduced syllables `R̄^a S̄`. Two syllables at a time, `R̄^a S̄ R̄^b S̄ = R̄^(a − b)`
in D̄₅ (a kernel `decide` over the exponents mod 5), so at even length the reduced word is
`R̄^(A w mod 5)`; its trace has φ̄-coefficient 0 exactly at exponent 0 mod 5 (`decide`). EVKb
is U2's `g5_u2_l2`.
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

/-! ### Helpers (private, `g5_u12_aux_*`): the reduction bridge and the pairing in D̄₅ -/

/-- Helper: `red2M` is the matrix map of a ring map that agrees with `red2`. -/
private theorem g5_u12_aux_map (f : ZPhi →+* F4) (hf : ∀ t : ZPhi, f t = red2 t) (M : M2) :
    red2M M = f.mapMatrix M := by
  simp only [red2M, RingHom.mapMatrix_apply]
  congr 1
  funext t
  exact (hf t).symm

/-- Helper: the reduction of a literal word is the product of its reduced syllables. -/
private theorem g5_u12_aux_red2M_W (f : ZPhi →+* F4) (hf : ∀ t : ZPhi, f t = red2 t)
    (w : List ℕ) : red2M (W w) = (w.map fun a => Rbar ^ a * Sbar).prod := by
  have hR : f.mapMatrix R = Rbar := (g5_u12_aux_map f hf R).symm
  have hS : f.mapMatrix S = Sbar := (g5_u12_aux_map f hf S).symm
  rw [g5_u12_aux_map f hf, W, map_list_prod, List.map_map]
  congr 1
  apply List.map_congr_left
  intro a _
  simp only [Function.comp_apply, map_mul, map_pow, hR, hS]

/-- Helper: `red2` of a trace is the trace of `red2M`. -/
private theorem g5_u12_aux_red2_trace (f : ZPhi →+* F4) (hf : ∀ t : ZPhi, f t = red2 t)
    (M : M2) : red2 M.trace = (red2M M).trace := by
  rw [Matrix.trace_fin_two, Matrix.trace_fin_two, ← hf, map_add, hf, hf]
  rfl

/-- Helper: `R̄^j` for an exponent read mod 5. -/
private def g5_u12_aux_f (j : ZMod 5) : F4M := Rbar ^ j.val

/-- Helper: the pairing `R̄^a S̄ R̄^b S̄ R̄^j = R̄^(a − b + j)` in D̄₅, a finite check. -/
private theorem g5_u12_aux_step :
    ∀ a ∈ Finset.Icc (1 : ℕ) 4, ∀ b ∈ Finset.Icc (1 : ℕ) 4, ∀ j : ZMod 5,
    Rbar ^ a * Sbar * (Rbar ^ b * Sbar * g5_u12_aux_f j) =
      g5_u12_aux_f ((a : ZMod 5) - b + j) := by
  decide +kernel

/-- Helper: the φ̄-coefficient of the trace of `R̄^j` is 0 exactly at `j = 0`. -/
private theorem g5_u12_aux_trace_y : ∀ j : ZMod 5, (g5_u12_aux_f j).trace.y = 0 ↔ j = 0 := by
  decide +kernel

/-- Helper: at even length the reduced syllable product is `R̄^(A w mod 5)`. -/
private theorem g5_u12_aux_pair : ∀ w : List ℕ, (∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) → Even w.length →
    (w.map fun a => Rbar ^ a * Sbar).prod = g5_u12_aux_f (A w : ZMod 5)
  | [], _, _ => by simp [A, g5_u12_aux_f]
  | [_], _, h => by simp at h
  | a :: b :: l, hw, h => by
    have hl : Even l.length := by simpa [Nat.even_add_one] using h
    have ih := g5_u12_aux_pair l (fun c hc => hw c (by simp [hc])) hl
    have ha : a ∈ Finset.Icc 1 4 := Finset.mem_Icc.mpr (hw a (by simp))
    have hb : b ∈ Finset.Icc 1 4 := Finset.mem_Icc.mpr (hw b (by simp))
    have hA : ((A (a :: b :: l) : ℤ) : ZMod 5) = (a : ZMod 5) - b + (A l : ZMod 5) := by
      simp only [A]
      push_cast
      ring
    simp only [List.map_cons, List.prod_cons]
    rw [ih, g5_u12_aux_step a ha b hb, hA]

/-- G5-EVKa (the even-k law, (a) ⟺ (c)). For a word of even length, `5 ∣ A w` exactly
when the φ-coefficient `y` of `tr W = x + y φ` is even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); AM transcript §3.1 (l. 124); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_a (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ Even (W w).trace.y := by
  obtain ⟨f, hf⟩ := g5_u2_red_hom
  have htr : red2 (W w).trace = (g5_u12_aux_f (A w : ZMod 5)).trace := by
    rw [g5_u12_aux_red2_trace f hf, g5_u12_aux_red2M_W f hf, g5_u12_aux_pair w hw.2 hk]
  have hy : (((W w).trace.y : ℤ) : ZMod 2) = (g5_u12_aux_f (A w : ZMod 5)).trace.y :=
    congrArg F4.y htr
  have h5 : (5 : ℤ) ∣ A w ↔ ((A w : ℤ) : ZMod 5) = 0 :=
    (ZMod.intCast_zmod_eq_zero_iff_dvd (A w) 5).symm
  have h2 : Even (W w).trace.y ↔ (((W w).trace.y : ℤ) : ZMod 2) = 0 :=
    even_iff_two_dvd.trans (ZMod.intCast_zmod_eq_zero_iff_dvd _ 2).symm
  rw [h5, h2, hy, g5_u12_aux_trace_y]

/-- G5-EVKb (the even-k law, (c) ⟺ (d)). For a word of even length, the φ-coefficient
`y` of `tr W = x + y φ` is even exactly when `x` and `y` are both even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    Even (W w).trace.y ↔ (Even (W w).trace.x ∧ Even (W w).trace.y) := by
  refine ⟨fun hy => ⟨?_, hy⟩, fun h => h.2⟩
  by_contra hx
  exact g5_u2_l2 w hw ⟨Int.not_even_iff_odd.mp hx, hy⟩

end G5
