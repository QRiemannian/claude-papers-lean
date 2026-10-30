import Mathlib
import G5.Ring.Solution
import G5.Ladder.Solution

/-!
# Unit U11 (`G5/Census`) — census completeness, corrected (row G5-LADc′): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/Census/Challenge.lean` (sha256 prefix `ee958447`), three theorems under the
same names and statement texts, byte for byte. U11 defines nothing; this module imports the
proved preludes `G5.Ring.Solution` and `G5.Ladder.Solution` (the prelude rule for dependent
units) and restates nothing.
Method: the real order on ℤ[φ] is read through the ring map `x + y φ ↦ x + y φ ∈ ℝ` (U5's
method, private here). (a) U5's ladder bounds a word of length `k` from below — `2φ` at `k = 1`,
`3 + φ` at `k = 2`, `(k + 1)φ` at `k ≥ 3` — so `t < (K + 2)φ` forces `k ≤ K` when `K = 0` or
`K ≥ 2`. (b) `t < 3φ` rules out `k ≥ 3`; the sixteen words of length 2 are then decided, and
U5's `g5_u5_lad_b_two` gives the rotation. The witness is a finite computation.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers: the real order through the ring map to ℝ (U5's method, private here) -/

/-- Helper: the real value `x + y φ` of an element of ℤ[φ], as a ring map to ℝ. -/
private noncomputable def g5_u11_aux_v : ZPhi →+* ℝ where
  toFun t := t.x + t.y * Real.goldenRatio
  map_one' := by simp
  map_mul' s t := by
    simp only [mul_x, mul_y]; push_cast
    linear_combination (-(s.y : ℝ) * t.y) * Real.goldenRatio_sq
  map_zero' := by simp
  map_add' s t := by simp only [add_x, add_y]; push_cast; ring

private theorem g5_u11_aux_v_apply (t : ZPhi) :
    g5_u11_aux_v t = t.x + t.y * Real.goldenRatio := rfl

private theorem g5_u11_aux_v_phi : g5_u11_aux_v phi = Real.goldenRatio := by
  simp [g5_u11_aux_v_apply, phi]

private theorem g5_u11_aux_ab5 (a b : ℤ) :
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
private theorem g5_u11_aux_le_iff (s t : ZPhi) : s ≤ t ↔ g5_u11_aux_v s ≤ g5_u11_aux_v t := by
  change RealNonneg (t - s) ↔ _
  unfold RealNonneg
  rw [g5_u11_aux_ab5, g5_u11_aux_v_apply, g5_u11_aux_v_apply]
  simp only [sub_x, sub_y]
  have hg : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  rw [hg]; push_cast
  constructor <;> intro h <;> linarith

private theorem g5_u11_aux_v_inj {s t : ZPhi} (h : g5_u11_aux_v s = g5_u11_aux_v t) : s = t := by
  rw [g5_u11_aux_v_apply, g5_u11_aux_v_apply] at h
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

/-- Helper: the strict real order maps to the strict order of the real values. -/
private theorem g5_u11_aux_lt {s t : ZPhi} (h : s < t) : g5_u11_aux_v s < g5_u11_aux_v t :=
  lt_of_le_of_ne ((g5_u11_aux_le_iff s t).1 h.1) (fun e => h.2 (g5_u11_aux_v_inj e))

/-- G5-LADc′a (census completeness, the law). For `K = 0` and every `K ≥ 2`, every
non-constant word with normalized trace `t < (K + 2) φ` (real order) has length `≤ K`.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (a); the corrected form of TA
transcript §1 l. 55 (JC-9 Event 27, l. 56); STATEMENTS.md §4 (l. 51).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_a (K : ℕ) (hK : K = 0 ∨ 2 ≤ K) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w < ((K : ZPhi) + 2) * phi) :
    w.length ≤ K := by
  have hk1 : 1 ≤ w.length := by
    rcases w with _ | ⟨a, w⟩
    · exact absurd rfl hw.1
    · simp
  have hv := g5_u11_aux_lt ht
  simp only [map_mul, map_add, map_natCast, map_ofNat, g5_u11_aux_v_phi] at hv
  have hp := Real.goldenRatio_pos
  have hp2 := Real.goldenRatio_lt_two
  by_contra hlt
  rw [not_le] at hlt
  rcases Nat.lt_or_ge w.length 3 with h3 | h3
  · have hK0 : (K : ℝ) = 0 := by
      have : K = 0 := by omega
      exact_mod_cast this
    rw [hK0] at hv
    rcases (show w.length = 1 ∨ w.length = 2 by omega) with h | h
    · have hl := (g5_u11_aux_le_iff _ _).1 (g5_u5_lad_a_one w hw h hc)
      simp only [map_mul, map_ofNat, g5_u11_aux_v_phi] at hl
      linarith
    · have hl := (g5_u11_aux_le_iff _ _).1 (g5_u5_lad_a_two w hw h hc)
      simp only [map_add, map_ofNat, g5_u11_aux_v_phi] at hl
      linarith
  · have hl := (g5_u11_aux_le_iff _ _).1 (g5_u5_lad_a_ge3 w hw h3 hc)
    simp only [map_mul, map_add, map_natCast, map_one, g5_u11_aux_v_phi] at hl
    have hKk : (K : ℝ) + 2 ≤ (w.length : ℝ) + 1 := by
      exact_mod_cast (show K + 2 ≤ w.length + 1 by omega)
    nlinarith [mul_le_mul_of_nonneg_right hKk hp.le]

/-- G5-LADc′b (census completeness, the K = 1 case). A non-constant word with
normalized trace `t < 3φ` (real order) and length `> 1` is a rotation of `(1, 4)`,
with `t = 3 + φ`.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (b);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4 (l. 353).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_b (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w < 3 * phi) (hk : 1 < w.length) :
    List.IsRotated w [1, 4] ∧ ntr w = 3 + phi := by
  have hv := g5_u11_aux_lt ht
  simp only [map_mul, map_ofNat, g5_u11_aux_v_phi] at hv
  have hp := Real.goldenRatio_pos
  have h2 : w.length = 2 := by
    by_contra hn
    have h3 : 3 ≤ w.length := by omega
    have hl := (g5_u11_aux_le_iff _ _).1 (g5_u5_lad_a_ge3 w hw h3 hc)
    simp only [map_mul, map_add, map_natCast, map_one, g5_u11_aux_v_phi] at hl
    have h4 : (4 : ℝ) ≤ (w.length : ℝ) + 1 := by
      exact_mod_cast (show 4 ≤ w.length + 1 by omega)
    nlinarith [mul_le_mul_of_nonneg_right h4 hp.le]
  have he : ntr w = 3 + phi := by
    obtain ⟨a, b, rfl⟩ := List.length_eq_two.1 h2
    obtain ⟨ha1, ha4⟩ := hw.2 a (by simp)
    obtain ⟨hb1, hb4⟩ := hw.2 b (by simp)
    clear hv hw hk h2
    revert ht hc
    interval_cases a <;> interval_cases b <;> decide
  exact ⟨(g5_u5_lad_b_two w hw h2 hc).1 he, he⟩

/-- G5-LADc′b (the witness: the law fails at K = 1). The word `(1, 4)` — non-constant,
of length 2 — has normalized trace `< 3φ` in the real order.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (b), "the law fails";
STATEMENTS.md §4 (l. 51). STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_b_wit : ntr [1, 4] < 3 * phi := by
  decide

end G5
