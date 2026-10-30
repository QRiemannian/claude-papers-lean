import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.Sector.Solution
import G5.GroupLevel.Solution
import G5.WordLevel.Solution

/-!
# Unit U9 (`G5/SectorGroup`) — Theorem B at element level (row G5-BG): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/SectorGroup/Challenge.lean` (sha256 prefix `c6a43405`), two theorems under the
same names and statement texts, byte for byte. U9 defines nothing; this module imports the
proved preludes `G5.Ring.Solution`, `G5.Group.Solution`, `G5.Sector.Solution`,
`G5.GroupLevel.Solution` and `G5.WordLevel.Solution` (the prelude rule for dependent units)
and restates nothing.
Method: U7's normal form `g5_u7_nf` conjugates `g` to `±I`, `±S`, `±R^a` or `±W w`; the trace
is a conjugation invariant and `rabs (−t) = rabs t` (the real order read through the ring map
`x + y φ ↦ x + y φ ∈ ℝ`, U5's method, private here). The finite forms have traces `±2`, `0`,
`±φ`, `±⟨−1, 1⟩` (`g5_u8_ell`), none with `2 < rabs t` (`decide`); a word has `tr W = ±t`
(`g5_u1_trace`), `t = 2` on the constant words, and otherwise `t ∈ ℕ[φ]` (`g5_u3_a_nonneg`), so
`rabs (tr g) = t` and U4's `g5_u4_ba` (BGa) and the first conjunct of `g5_u4_bc` (BGb) apply.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers: the real order through the ring map to ℝ (U5's method, private here) -/

/-- Helper: the real value `x + y φ` of an element of ℤ[φ], as a ring map to ℝ. -/
private noncomputable def g5_u9_aux_v : ZPhi →+* ℝ where
  toFun t := t.x + t.y * Real.goldenRatio
  map_one' := by simp
  map_mul' s t := by
    simp only [mul_x, mul_y]; push_cast
    linear_combination (-(s.y : ℝ) * t.y) * Real.goldenRatio_sq
  map_zero' := by simp
  map_add' s t := by simp only [add_x, add_y]; push_cast; ring

private theorem g5_u9_aux_v_apply (t : ZPhi) :
    g5_u9_aux_v t = t.x + t.y * Real.goldenRatio := rfl

private theorem g5_u9_aux_v_phi : g5_u9_aux_v phi = Real.goldenRatio := by
  simp [g5_u9_aux_v_apply, phi]

private theorem g5_u9_aux_ab5 (a b : ℤ) :
    NonnegAB5 a b ↔ (0 : ℝ) ≤ a + b * Real.sqrt 5 := by
  have h5 : Real.sqrt 5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hs : 0 ≤ Real.sqrt 5 := Real.sqrt_nonneg 5
  unfold NonnegAB5
  constructor
  · rintro (⟨ha, hb⟩ | ⟨ha, hb, h⟩ | ⟨ha, hb, h⟩)
    · have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
      have hb' : (0 : ℝ) ≤ b := by exact_mod_cast hb
      positivity
    · have ha' : (0 : ℝ) < a := by exact_mod_cast ha
      have hb' : (b : ℝ) < 0 := by exact_mod_cast hb
      have h' : 5 * (b : ℝ) ^ 2 ≤ (a : ℝ) ^ 2 := by exact_mod_cast h
      by_contra! hn
      nlinarith [mul_pos (by linarith : (0 : ℝ) < -(b * Real.sqrt 5) - a)
        (by nlinarith : (0 : ℝ) < -(b * Real.sqrt 5) + a)]
    · have ha' : (a : ℝ) < 0 := by exact_mod_cast ha
      have hb' : (0 : ℝ) < b := by exact_mod_cast hb
      have h' : (a : ℝ) ^ 2 ≤ 5 * (b : ℝ) ^ 2 := by exact_mod_cast h
      nlinarith [mul_nonneg hs hb'.le, sq_nonneg ((b : ℝ) * Real.sqrt 5 + a)]
  · intro h
    rcases le_or_gt 0 a with ha | ha
    · rcases le_or_gt 0 b with hb | hb
      · exact Or.inl ⟨ha, hb⟩
      · right; left
        have hb' : (b : ℝ) < 0 := by exact_mod_cast hb
        have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
        have hpos : (0 : ℝ) < a := by nlinarith [Real.sqrt_pos.2 (by norm_num : (0:ℝ) < 5)]
        refine ⟨by exact_mod_cast hpos, hb, ?_⟩
        have : 5 * (b : ℝ) ^ 2 ≤ (a : ℝ) ^ 2 := by
          nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ a + b * Real.sqrt 5)
            (by nlinarith : (0:ℝ) ≤ a - b * Real.sqrt 5)]
        exact_mod_cast this
    · right; right
      have ha' : (a : ℝ) < 0 := by exact_mod_cast ha
      have hbpos : (0 : ℝ) < b := by
        by_contra! hn; nlinarith
      refine ⟨ha, by exact_mod_cast hbpos, ?_⟩
      have : (a : ℝ) ^ 2 ≤ 5 * (b : ℝ) ^ 2 := by
        nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ a + b * Real.sqrt 5)
          (by nlinarith : (0:ℝ) ≤ b * Real.sqrt 5 - a)]
      exact_mod_cast this

/-- Helper: the real order on ℤ[φ] is the order of the real values. -/
private theorem g5_u9_aux_le_iff (s t : ZPhi) : s ≤ t ↔ g5_u9_aux_v s ≤ g5_u9_aux_v t := by
  change RealNonneg (t - s) ↔ _
  unfold RealNonneg
  rw [g5_u9_aux_ab5, g5_u9_aux_v_apply, g5_u9_aux_v_apply]
  simp only [sub_x, sub_y]
  have hg : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  rw [hg]; push_cast
  constructor <;> intro h <;> linarith

private theorem g5_u9_aux_v_inj {s t : ZPhi} (h : g5_u9_aux_v s = g5_u9_aux_v t) : s = t := by
  rw [g5_u9_aux_v_apply, g5_u9_aux_v_apply] at h
  by_cases hy : s.y = t.y
  · have hx : (s.x : ℝ) = t.x := by rw [hy] at h; linarith
    ext
    · exact_mod_cast hx
    · exact hy
  · exfalso
    have hne : ((s.y : ℝ) - t.y) ≠ 0 := by
      intro h0; apply hy; exact_mod_cast sub_eq_zero.1 h0
    have hq : Real.goldenRatio = ((t.x - s.x : ℤ) : ℝ) / ((s.y - t.y : ℤ) : ℝ) := by
      push_cast; rw [eq_div_iff hne]; linarith
    exact Real.goldenRatio_irrational.ne_rational (t.x - s.x) (s.y - t.y) hq

/-- Helper: `t ≥ 0` in the real order iff its real value is `≥ 0`. -/
private theorem g5_u9_aux_rn (t : ZPhi) : RealNonneg t ↔ 0 ≤ g5_u9_aux_v t := by
  have h := g5_u9_aux_le_iff 0 t
  rw [map_zero] at h
  change RealNonneg (t - 0) ↔ _ at h
  rwa [sub_zero] at h

/-- Helper: the real absolute value is even. -/
private theorem g5_u9_aux_rabs_neg (t : ZPhi) : rabs (-t) = rabs t := by
  rw [rabs, rabs]
  by_cases h1 : RealNonneg (-t) <;> by_cases h2 : RealNonneg t
  · rw [if_pos h1, if_pos h2]
    rw [g5_u9_aux_rn, map_neg] at h1
    rw [g5_u9_aux_rn] at h2
    have h0 : g5_u9_aux_v t = g5_u9_aux_v 0 := by rw [map_zero]; linarith
    rw [g5_u9_aux_v_inj h0, neg_zero]
  · rw [if_pos h1, if_neg h2]
  · rw [if_neg h1, if_pos h2, neg_neg]
  · rw [g5_u9_aux_rn, map_neg] at h1
    rw [g5_u9_aux_rn] at h2
    exact absurd (by linarith : 0 ≤ g5_u9_aux_v t) h2

/-- Helper: on ℕ[φ] the real absolute value is the identity. -/
private theorem g5_u9_aux_rabs_nonneg {t : ZPhi} (h : nonneg t) : rabs t = t := by
  rw [rabs, if_pos]
  change NonnegAB5 (2 * t.x + t.y) t.y
  obtain ⟨hx, hy⟩ := h
  exact Or.inl ⟨by omega, hy⟩

/-- Helper: the trace is a conjugation invariant. -/
private theorem g5_u9_aux_tr_conj (h g : M2ˣ) :
    ((h * g * h⁻¹ : M2ˣ) : M2).trace = (g : M2).trace := by
  rw [Units.val_mul, Units.val_mul, Matrix.trace_mul_cycle, Units.inv_mul, one_mul]

/-- Helper: a property of `rabs` of the trace that holds on the finite forms and on the
words holds on every element of `⟨S, T⟩` (from the normal form `g5_u7_nf`). -/
private theorem g5_u9_aux_main (Q : ZPhi → Prop)
    (hI : Q (rabs (1 : M2).trace)) (hS : Q (rabs S.trace))
    (hR : ∀ a : ℕ, 1 ≤ a ∧ a ≤ 4 → Q (rabs (R ^ a).trace))
    (hW : ∀ w : List ℕ, IsWord w → Q (rabs (W w).trace)) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    Q (rabs (g : M2).trace) := by
  obtain ⟨h, -, hn⟩ := g5_u7_nf g hg
  rw [← g5_u9_aux_tr_conj h g]
  generalize ((h * g * h⁻¹ : M2ˣ) : M2) = n at hn
  rcases hn with rfl | rfl | rfl | rfl | ⟨a, ha, rfl | rfl⟩ | ⟨w, hw, rfl | rfl⟩
  · exact hI
  · rw [Matrix.trace_neg, g5_u9_aux_rabs_neg]; exact hI
  · exact hS
  · rw [Matrix.trace_neg, g5_u9_aux_rabs_neg]; exact hS
  · exact hR a ha
  · rw [Matrix.trace_neg, g5_u9_aux_rabs_neg]; exact hR a ha
  · exact hW w hw
  · rw [Matrix.trace_neg, g5_u9_aux_rabs_neg]; exact hW w hw

/-- Helper: `rabs` of the literal trace of a word is `rabs t` (from `g5_u1_trace`). -/
private theorem g5_u9_aux_rabs_W (w : List ℕ) (hw : IsWord w) :
    rabs (W w).trace = rabs (ntr w) := by
  have h := g5_u1_trace w hw
  rcases neg_one_pow_eq_or ZPhi w.length with e | e <;> rw [e] at h
  · rw [h, one_mul]
  · rw [h, neg_one_mul, g5_u9_aux_rabs_neg]

/-- Helper: a word is constant with `t = 2`, or it is neither `(1^k)` nor `(4^k)`. -/
private theorem g5_u9_aux_word (w : List ℕ) (hw : IsWord w) :
    ntr w = (⟨2, 0⟩ : ZPhi) ∨ ((∃ a ∈ w, a ≠ 1) ∧ (∃ a ∈ w, a ≠ 4)) := by
  have hy := g5_u3_a_y_eq_zero w hw
  by_cases hc : (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)
  · left; exact ZPhi.ext (hy.2 hc) (hy.1.2 hc)
  · right
    simp only [not_or, not_forall] at hc
    obtain ⟨⟨a, ha, ha1⟩, ⟨b, hb, hb4⟩⟩ := hc
    exact ⟨⟨a, ha, ha1⟩, ⟨b, hb, hb4⟩⟩

/-- Helper: the finite forms and the constant words carry no hyperbolic trace, and a
non-constant word has `rabs (tr W) = t`; so a property of hyperbolic `rabs` traces that the
non-constant words satisfy holds on every hyperbolic element of `⟨S, T⟩`. -/
private theorem g5_u9_aux_hyp (Q : ZPhi → Prop)
    (hQ : ∀ w : List ℕ, IsWord w → (∃ a ∈ w, a ≠ 1) → (∃ a ∈ w, a ≠ 4) → Q (ntr w))
    (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    Q (rabs (g : M2).trace) := by
  refine g5_u9_aux_main (fun t => 2 < t → Q t) ?_ ?_ ?_ ?_ g hg hh
  · rw [(g5_u8_ell).1]; intro h; exact absurd h (by decide)
  · rw [(g5_u8_ell).2.1]; intro h; exact absurd h (by decide)
  · intro a ha
    obtain ⟨h1, h4⟩ := ha
    obtain ⟨-, -, e1, e2, e3, e4⟩ := g5_u8_ell
    intro h
    exfalso
    revert h
    interval_cases a
    · rw [e1]; decide
    · rw [e2]; decide
    · rw [e3]; decide
    · rw [e4]; decide
  · intro w hw
    rw [g5_u9_aux_rabs_W w hw]
    rcases g5_u9_aux_word w hw with e | ⟨h1, h4⟩
    · rw [e]; intro h; exact absurd h (by decide)
    · rw [g5_u9_aux_rabs_nonneg (g5_u3_a_nonneg w hw)]
      intro _
      exact hQ w hw h1 h4

/-- G5-BGa (Theorem B at element level, the sector). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, after sign normalization `t = |tr g|`,
`t = x + y φ` with `y ≥ 1` and `0 ≤ x ≤ y + 2`.
Locus: TA transcript §1 "Theorem B" (l. 43); STATEMENTS.md row G5-BG (l. 24).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u9_bg_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    1 ≤ (rabs (g : M2).trace).y ∧ 0 ≤ (rabs (g : M2).trace).x ∧
      (rabs (g : M2).trace).x ≤ (rabs (g : M2).trace).y + 2 := by
  exact g5_u9_aux_hyp (fun t => 1 ≤ t.y ∧ 0 ≤ t.x ∧ t.x ≤ t.y + 2)
    (fun w hw h1 h4 => g5_u4_ba w hw h1 h4) g hg hh

/-- G5-BGb (Theorem B at element level, the θ bound). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, after sign normalization `t = |tr g|`,
`11 |t^σ| ≤ (17 − 7φ) t` in the real order.
Locus: TA transcript §1 "The true cone" (l. 47); STATEMENTS.md row G5-BG (l. 24).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u9_bg_b (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    11 * rabs (conj (rabs (g : M2).trace)) ≤ (17 - 7 * phi) * rabs (g : M2).trace := by
  exact g5_u9_aux_hyp (fun t => 11 * rabs (conj t) ≤ (17 - 7 * phi) * t)
    (fun w hw h1 h4 => (g5_u4_bc w hw h1 h4).1) g hg hh

end G5
