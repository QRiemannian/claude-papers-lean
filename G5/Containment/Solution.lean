import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.GroupLevel.Solution
import G5.WordLevel.Solution

/-!
# Unit U10 (`G5/Containment`) — the Corollary's containment (row G5-COR): proof

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statement: `G5/Containment/Challenge.lean` (sha256 prefix `34608245`), one theorem under the
same name and statement text, byte for byte. U10 defines nothing; this module imports the
proved preludes `G5.Ring.Solution`, `G5.Group.Solution`, `G5.GroupLevel.Solution` and
`G5.WordLevel.Solution` (the prelude rule for dependent units) and restates nothing.
Method: U7's normal form `g5_u7_nf` conjugates `g` to `±I`, `±S`, `±R^a` or `±W w`; the trace
is a conjugation invariant and the target set is closed under negation. The finite forms take
U8's values `g5_u8_ell`; a word has `tr W = ±t` (`g5_u1_trace`), with `t = 2` on the constant
words and `t = x + y φ`, `x ≥ 0`, `y ≥ 1` otherwise (`g5_u3_a_nonneg`, `g5_u3_a_y_eq_zero`).
-/

open G5 ZPhi

namespace G5

/-! ### Helpers -/

/-- Helper: the trace is a conjugation invariant. -/
private theorem g5_u10_aux_tr_conj (h g : M2ˣ) :
    ((h * g * h⁻¹ : M2ˣ) : M2).trace = (g : M2).trace := by
  rw [Units.val_mul, Units.val_mul, Matrix.trace_mul_cycle, Units.inv_mul, one_mul]

/-- Helper: a sign-symmetric property of traces that holds on the finite forms and on the
words holds on every element of `⟨S, T⟩` (from the normal form `g5_u7_nf`). -/
private theorem g5_u10_aux_main (Q : ZPhi → Prop) (hneg : ∀ t, Q t → Q (-t))
    (hI : Q (1 : M2).trace) (hS : Q S.trace) (hR : ∀ a : ℕ, 1 ≤ a ∧ a ≤ 4 → Q (R ^ a).trace)
    (hW : ∀ w : List ℕ, IsWord w → Q (W w).trace) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    Q (g : M2).trace := by
  obtain ⟨h, -, hn⟩ := g5_u7_nf g hg
  rw [← g5_u10_aux_tr_conj h g]
  generalize ((h * g * h⁻¹ : M2ˣ) : M2) = n at hn
  rcases hn with rfl | rfl | rfl | rfl | ⟨a, ha, rfl | rfl⟩ | ⟨w, hw, rfl | rfl⟩
  · exact hI
  · rw [Matrix.trace_neg]; exact hneg _ hI
  · exact hS
  · rw [Matrix.trace_neg]; exact hneg _ hS
  · exact hR a ha
  · rw [Matrix.trace_neg]; exact hneg _ (hR a ha)
  · exact hW w hw
  · rw [Matrix.trace_neg]; exact hneg _ (hW w hw)

/-- Helper: the literal trace of a word is `± t` (from `g5_u1_trace`). -/
private theorem g5_u10_aux_trW (w : List ℕ) (hw : IsWord w) :
    (W w).trace = ntr w ∨ (W w).trace = -ntr w := by
  have h := g5_u1_trace w hw
  rcases neg_one_pow_eq_or ZPhi w.length with e | e <;> rw [e] at h
  · left; rw [h, one_mul]
  · right; rw [h, neg_one_mul, neg_neg]

/-- Helper: a word's normalized trace is `2` (constant words) or `x + y φ`, `x ≥ 0`, `y ≥ 1`. -/
private theorem g5_u10_aux_word (w : List ℕ) (hw : IsWord w) :
    ntr w = (⟨2, 0⟩ : ZPhi) ∨ (0 ≤ (ntr w).x ∧ 1 ≤ (ntr w).y) := by
  have hn := g5_u3_a_nonneg w hw
  have hy := g5_u3_a_y_eq_zero w hw
  by_cases hc : (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)
  · left; exact ZPhi.ext (hy.2 hc) (hy.1.2 hc)
  · right
    have h0 : (ntr w).y ≠ 0 := fun h => hc (hy.1.1 h)
    exact ⟨hn.1, by have := hn.2; omega⟩

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
      ((g : M2).trace = (⟨x, y⟩ : ZPhi) ∨ (g : M2).trace = -(⟨x, y⟩ : ZPhi)) := by
  refine g5_u10_aux_main (fun t =>
    (t = (⟨2, 0⟩ : ZPhi) ∨ t = (⟨-2, 0⟩ : ZPhi) ∨ t = 0 ∨ t = (⟨0, 1⟩ : ZPhi) ∨
      t = (⟨0, -1⟩ : ZPhi) ∨ t = (⟨-1, 1⟩ : ZPhi) ∨ t = (⟨1, -1⟩ : ZPhi)) ∨
    ∃ x y : ℤ, 0 ≤ x ∧ 1 ≤ y ∧ (t = (⟨x, y⟩ : ZPhi) ∨ t = -(⟨x, y⟩ : ZPhi)))
    ?_ ?_ ?_ ?_ ?_ g hg
  · intro t ht
    beta_reduce at ht ⊢
    rcases ht with (rfl | rfl | rfl | rfl | rfl | rfl | rfl) | ⟨x, y, hx, hy, rfl | rfl⟩
    all_goals first
      | exact Or.inl (by decide)
      | exact Or.inr ⟨x, y, hx, hy, Or.inr rfl⟩
      | exact Or.inr ⟨x, y, hx, hy, Or.inl (neg_neg _)⟩
  · rw [(g5_u8_ell).1]; exact Or.inl (by decide)
  · rw [(g5_u8_ell).2.1]; exact Or.inl (by decide)
  · intro a ha
    obtain ⟨h1, h4⟩ := ha
    obtain ⟨-, -, e1, e2, e3, e4⟩ := g5_u8_ell
    interval_cases a
    · rw [e1]; exact Or.inl (by decide)
    · rw [e2]; exact Or.inl (by decide)
    · rw [e3]; exact Or.inl (by decide)
    · rw [e4]; exact Or.inl (by decide)
  · intro w hw
    rcases g5_u10_aux_word w hw with e | ⟨hx, hy⟩
    · rcases g5_u10_aux_trW w hw with f | f <;> rw [f, e] <;> exact Or.inl (by decide)
    · rcases g5_u10_aux_trW w hw with f | f <;> rw [f]
      · exact Or.inr ⟨(ntr w).x, (ntr w).y, hx, hy, Or.inl rfl⟩
      · exact Or.inr ⟨(ntr w).x, (ntr w).y, hx, hy, Or.inr rfl⟩

end G5
